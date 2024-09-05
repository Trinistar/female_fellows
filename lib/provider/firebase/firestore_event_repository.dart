import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:femalefellows/models/category.dart';
import 'package:femalefellows/models/event_participant.dart';
import 'package:femalefellows/models/user_model.dart';
import 'package:femalefellows/provider/firebase/firestore_repository.dart';

import '../../models/events.dart';

class FirestoreEventRepository {
  final FirebaseFirestore db;
  FirestoreEventRepository() : db = FirestoreRepository().firestoreInstance;

  Future<DocumentReference<Map<String, dynamic>>> createEvent(Event eventdata) {
    return db.collection('event').add(eventdata.toJson());
  }

  Future<void>? updateEvent(Event eventdata) {
    if (eventdata.id == null || eventdata.id!.isEmpty) return null;
    return db
        .collection('event')
        .doc(eventdata.id)
        .set(eventdata.toJson(), SetOptions(merge: true));
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getEvents() {
    return db.collection('event').snapshots();
  }

  Stream<Event?> getEvent(String eventId) {
    return db
        .collection('event')
        .doc(eventId)
        .snapshots()
        .map((DocumentSnapshot<Object> snapshot) {
      if (!snapshot.exists) return null;

      final Event event =
          Event.fromJson(snapshot.data()! as Map<String, dynamic>);

      event.id = snapshot.id;
      return event;
    });
  }

  Future<List<FFUser>> getEventParticipants(String eventId) async {
    final List<FFUser> participants = [];
    var parts = await db
        .collection('event')
        .doc(eventId)
        .collection('participants')
        .where('participating', isEqualTo: true)
        .get();
    if (parts.docs.isEmpty) return [];
    for (var part in parts.docs) {
      var usersnap = await db.collection('user').doc(part.id).get();
      if (usersnap.data() == null) continue;
      final FFUser userProfile = FFUser.fromJson(usersnap.data()!);
      userProfile.eventParticipant = EventParticipant.fromJson(part.data());
      userProfile.id = part.id;
      participants.add(userProfile);
    }
    return participants;
  }

  Stream<List<Event>> getEventsById(List<String> eventIds) {
    const String error = 'noElements';
    if (eventIds.isEmpty) return Stream.error(error);
    return db
        .collection('event')
        .where(FieldPath.documentId, whereIn: eventIds)
        .snapshots()
        .map(
      ((QuerySnapshot<Map<String, dynamic>> snapshot) {
        if (snapshot.docs.isNotEmpty) {
          List<Event> tmp = [];

          for (var change in snapshot.docs) {
            final Event event = Event.fromJson(change.data());
            event.id = change.id;
            tmp.add(event);
          }
          return tmp;
        } else {
          return [];
        }
      }),
    );
  }

  Stream<List<Event>> getAllEvents() {
    return db.collection('event').snapshots().map(
      ((QuerySnapshot<Map<String, dynamic>> snapshot) {
        if (snapshot.docs.isNotEmpty) {
          List<Event> tmp = [];

          for (var change in snapshot.docChanges) {
            final Event event = Event.fromJson(change.doc.data()!);
            event.id = change.doc.id;
            tmp.add(event);
          }
          return tmp;
        } else {
          return [];
        }
      }),
    );
  }

  Future<void> setEventParticipation(
      String? userId, String? eventId, EventParticipant data) {
    return db
        .collection('event')
        .doc(eventId)
        .collection('participants')
        .doc(userId)
        .set(data.toJson(), SetOptions(merge: true));
  }

  Future<void> revokeEventParticipation(
      String? userId, String? eventId, Map<String, dynamic> data) {
    return db
        .collection('event')
        .doc(eventId)
        .collection('participants')
        .doc(userId)
        .set(data, SetOptions(merge: true));
  }

  Future<List<Category>> getCategories() async {
    final List<Category> categories = [];
    var cats = await db.collection('category').get();
    if (cats.docs.isEmpty) return [];
    for (var cat in cats.docs) {
      categories.add(Category.fromJson(cat.data()));
    }
    return categories;
  }
}

StreamBuilder<QuerySnapshot<Map<String, dynamic>>> eventStreambuilder(
    Stream<QuerySnapshot<Map<String, dynamic>>> repo,
    Widget Function(BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot)
        builder) {
  return StreamBuilder(stream: repo, builder: builder);
}

class AllEventsStore extends Cubit<List<Event>> {
  final FirebaseFirestore db;
  AllEventsStore()
      : db = FirestoreRepository().firestoreInstance,
        super(List.empty(growable: true)) {
    db.collection('event').snapshots().listen(eventListener);
  }

  void eventListener(QuerySnapshot<Map<String, dynamic>> snapshot) {
    if (snapshot.docs.isNotEmpty) {
      List<Event> tmp = [];
      for (var doc in snapshot.docs) {
        final Event event = Event.fromJson(doc.data());
        event.id = doc.id;
        tmp.add(event);
      }
      /* for (var change in snapshot.docChanges) {
        switch (change.type) {
          case DocumentChangeType.added:
            final Event event = Event.fromJson(change.doc.data()!);
            tmp.add(event);
            event.id = change.doc.id;
            break;
          case DocumentChangeType.modified:
            Event modiefiedEvent = Event.fromJson(change.doc.data()!);
            int index = tmp.indexWhere((e) => e.title == modiefiedEvent.title);
            modiefiedEvent.id = change.doc.id;
            if (index > -1) {
              tmp[index] = modiefiedEvent;
            }
            break;
          case DocumentChangeType.removed:
            Event deletedEvent = Event.fromJson(change.doc.data()!);
            int index = tmp.indexWhere((e) => e.title == deletedEvent.title);
            deletedEvent.id = change.doc.id;
            if (index > -1) {
              tmp.removeAt(index);
            }
            break;
        }
      } */
      emit(tmp);
    }
  }
}

class SubscribedEventsStore extends Cubit<List<Event>> {
  SubscribedEventsStore(this._authBloc)
      : _db = FirestoreRepository().firestoreInstance,
        super(List.empty(growable: false)) {
    _authBlocStreamSub =
        _authBloc.stream.listen((AuthenticationState authState) {
      if (authState is AuthenticatedUser) {
        if (authState.userProfile!.participatingEvents.isEmpty) {
          return;
        }
        _eventRepo
            .getEventsById(authState.userProfile!.participatingEvents)
            .listen((event) {
          emit(event);
        });
      } else {
        emit([]);
      }
    });
  }

  final FirestoreEventRepository _eventRepo = FirestoreEventRepository();

  final FirebaseFirestore _db;

  final AuthenticationBloc _authBloc;

  StreamSubscription<dynamic>? _authBlocStreamSub;

  void eventListener(QuerySnapshot<Map<String, dynamic>> snapshot) {
    if (snapshot.docs.isNotEmpty) {
      List<Event> tmp = [...state];
      for (var change in snapshot.docChanges) {
        switch (change.type) {
          case DocumentChangeType.added:
            final Event event = Event.fromJson(change.doc.data()!);
            tmp.add(event);
            event.id = change.doc.id;
            break;
          case DocumentChangeType.modified:
            Event modiefiedEvent = Event.fromJson(change.doc.data()!);
            int index = tmp.indexWhere((e) => e.title == modiefiedEvent.title);
            modiefiedEvent.id = change.doc.id;
            if (index > -1) {
              tmp[index] = modiefiedEvent;
            }
            break;
          case DocumentChangeType.removed:
            Event deletedEvent = Event.fromJson(change.doc.data()!);
            int index = tmp.indexWhere((e) => e.title == deletedEvent.title);
            deletedEvent.id = change.doc.id;
            if (index > -1) {
              tmp.removeAt(index);
            }
            break;
        }
      }
      emit(tmp);
    }
  }

  @override
  Future<void> close() {
    _authBlocStreamSub?.cancel();
    return super.close();
  }
}

class FavoriteEventStore extends Cubit<List<Event>> {
  FavoriteEventStore(this._authBloc)
      : _db = FirestoreRepository().firestoreInstance,
        super(List.empty(growable: true)) {
    _authBlocStreamSub =
        _authBloc.stream.listen((AuthenticationState authState) {
      if (authState is AuthenticatedUser) {
        if (authState.userProfile!.favorites.isEmpty) {
          return;
        }
        _db
            .collection('event')
            .where(FieldPath.documentId,
                whereIn: authState.userProfile!.favorites)
            .snapshots()
            .listen(eventListener);
      }
    });
  }

  final FirebaseFirestore _db;

  final AuthenticationBloc _authBloc;

  StreamSubscription<dynamic>? _authBlocStreamSub;

  void eventListener(QuerySnapshot<Map<String, dynamic>> snapshot) {
    if (snapshot.docs.isNotEmpty) {
      List<Event> tmp = List<Event>.empty();
      List<Event> tmp2 = [];
      tmp2 = List<Event>.from([...state]);
      for (var change in snapshot.docChanges) {
        switch (change.type) {
          case DocumentChangeType.added:
            final Event event = Event.fromJson(change.doc.data()!);
            tmp2.add(event);
            event.id = change.doc.id;
            break;
          case DocumentChangeType.modified:
            Event modiefiedEvent = Event.fromJson(change.doc.data()!);
            int index = tmp.indexWhere((e) => e.title == modiefiedEvent.title);
            modiefiedEvent.id = change.doc.id;
            if (index > -1) {
              tmp2[index] = modiefiedEvent;
            }
            break;
          case DocumentChangeType.removed:
            Event deletedEvent = Event.fromJson(change.doc.data()!);
            int index = tmp.indexWhere((e) => e.title == deletedEvent.title);
            deletedEvent.id = change.doc.id;
            if (index > -1) {
              tmp2.removeAt(index);
            }
            break;
        }
      }
      tmp = List<Event>.from([...state, ...tmp2], growable: true);
      emit(tmp);
    }
  }

  @override
  Future<void> close() {
    _authBlocStreamSub?.cancel();
    return super.close();
  }
}
