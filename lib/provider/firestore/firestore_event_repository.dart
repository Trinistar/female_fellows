import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vs_femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:vs_femalefellows/models/category.dart';
import 'package:vs_femalefellows/models/event_participant.dart';
import 'package:vs_femalefellows/provider/firestore/firestore_repository.dart';

import '../../models/events.dart';

class FirestoreEventRepository {
  final FirebaseFirestore db;
  FirestoreEventRepository() : db = FirestoreRepository().firestoreInstance;

  Future<DocumentReference<Map<String, dynamic>>> createEvent(Event eventdata) {
    return db.collection('event').add(eventdata.toJson());
  }

  Future<void> updateEvent(Event eventdata) {
    return db.collection('event').doc().set(eventdata.toJson(), SetOptions(merge: true));
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getEvents() {
    return db.collection('event').snapshots();
  }

  Stream<List<Event>> getEventsById(List<String> eventIds) {
    const String error = 'noElements';
    if (eventIds.isEmpty) return Stream.error(error);
    return db.collection('event').where(FieldPath.documentId, whereIn: eventIds).snapshots().map(
      ((QuerySnapshot<Map<String, dynamic>> snapshot) {
        if (snapshot.docs.isNotEmpty) {
          List<Event> tmp = [];

          for (var change in snapshot.docChanges) {
            final Event event = Event.fromJson(change.doc.data()!);
            event.eventId = change.doc.id;
            tmp.add(event);
          }
          return tmp;
        } else {
          return [];
        }
      }),
    );
  }

  Future<void> setEventParticipation(String? userId, String? eventId, EventParticipant data) {
    return db.collection('event').doc(eventId).collection('participants').doc(userId).set(data.toJson(), SetOptions(merge: true));
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
    Stream<QuerySnapshot<Map<String, dynamic>>> repo, Widget Function(BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) builder) {
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
      List<Event> tmp = [...state];
      for (var change in snapshot.docChanges) {
        switch (change.type) {
          case DocumentChangeType.added:
            final Event event = Event.fromJson(change.doc.data()!);
            tmp.add(event);
            event.eventId = change.doc.id;
            break;
          case DocumentChangeType.modified:
            Event modiefiedEvent = Event.fromJson(change.doc.data()!);
            int index = tmp.indexWhere((e) => e.eventTitle == modiefiedEvent.eventTitle);
            modiefiedEvent.eventId = change.doc.id;
            if (index > -1) {
              tmp[index] = modiefiedEvent;
            }
            break;
          case DocumentChangeType.removed:
            Event deletedEvent = Event.fromJson(change.doc.data()!);
            int index = tmp.indexWhere((e) => e.eventTitle == deletedEvent.eventTitle);
            deletedEvent.eventId = change.doc.id;
            if (index > -1) {
              tmp.removeAt(index);
            }
            break;
        }
      }
      emit(tmp);
    }
  }
}

class SubscribedEventsStore extends Cubit<List<Event>> {
  SubscribedEventsStore(this._authBloc)
      : _db = FirestoreRepository().firestoreInstance,
        super(List.empty(growable: false)) {
    _authBlocStreamSub = _authBloc.stream.listen((AuthenticationState authState) {
      if (authState is AuthenticatedUser) {
        if (authState.userProfile!.participatingEvents.isEmpty) {
          return;
        }
        _eventRepo.getEventsById(authState.userProfile!.participatingEvents).listen((event) {
          emit(event);
        });
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
            event.eventId = change.doc.id;
            break;
          case DocumentChangeType.modified:
            Event modiefiedEvent = Event.fromJson(change.doc.data()!);
            int index = tmp.indexWhere((e) => e.eventTitle == modiefiedEvent.eventTitle);
            modiefiedEvent.eventId = change.doc.id;
            if (index > -1) {
              tmp[index] = modiefiedEvent;
            }
            break;
          case DocumentChangeType.removed:
            Event deletedEvent = Event.fromJson(change.doc.data()!);
            int index = tmp.indexWhere((e) => e.eventTitle == deletedEvent.eventTitle);
            deletedEvent.eventId = change.doc.id;
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
        super(List.empty(growable: false)) {
    _authBlocStreamSub = _authBloc.stream.listen((AuthenticationState authState) {
      if (authState is AuthenticatedUser) {
        if (authState.userProfile!.favorites.isEmpty) {
          return;
        }
        _db.collection('event').where(FieldPath.documentId, whereIn: authState.userProfile!.favorites).snapshots().listen(eventListener);
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
            event.eventId = change.doc.id;
            break;
          case DocumentChangeType.modified:
            Event modiefiedEvent = Event.fromJson(change.doc.data()!);
            int index = tmp.indexWhere((e) => e.eventTitle == modiefiedEvent.eventTitle);
            modiefiedEvent.eventId = change.doc.id;
            if (index > -1) {
              tmp2[index] = modiefiedEvent;
            }
            break;
          case DocumentChangeType.removed:
            Event deletedEvent = Event.fromJson(change.doc.data()!);
            int index = tmp.indexWhere((e) => e.eventTitle == deletedEvent.eventTitle);
            deletedEvent.eventId = change.doc.id;
            if (index > -1) {
              tmp2.removeAt(index);
            }
            break;
        }
      }
      tmp = List<Event>.from([...state, ...tmp2], growable: false);
      emit(tmp);
    }
  }

  @override
  Future<void> close() {
    _authBlocStreamSub?.cancel();
    return super.close();
  }
}
