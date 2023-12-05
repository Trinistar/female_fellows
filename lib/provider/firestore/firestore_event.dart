import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vs_femalefellows/provider/firestore/firestore_repository.dart';

import '../../models/events.dart';

class FirestoreEventRepository {
  final FirebaseFirestore db;
  FirestoreEventRepository() : db = FirestoreRepository().firestoreInstance;

  Future<DocumentReference<Map<String, dynamic>>> createEvent(Event eventdata) {
    return db.collection('event').add(eventdata.toJson());
  }

  Future<void> updateEvent(Event eventdata) {
    return db
        .collection('event')
        .doc()
        .set(eventdata.toJson(), SetOptions(merge: true));
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getEvents() {
    return db.collection('event').limit(5).snapshots();
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
    db.collection('event').limit(5).snapshots().listen(eventListener);
  }

  void eventListener(QuerySnapshot<Map<String, dynamic>> snapshot) {
    if (snapshot.docs.isNotEmpty) {
      List<Event> tmp = [...state];
      for (var change in snapshot.docChanges) {
        switch (change.type) {
          case DocumentChangeType.added:
            tmp.add(Event.fromJson(change.doc.data()!));
            break;
          case DocumentChangeType.modified:
            Event modiefiedEvent = Event.fromJson(change.doc.data()!);
            int index = tmp.indexWhere((e) => e.eventTitle == modiefiedEvent.eventTitle);
            if(index > -1){
              tmp[index] = modiefiedEvent;
            }
            break;
          case DocumentChangeType.removed:
            Event deletedEvent = Event.fromJson(change.doc.data()!);
            int index = tmp.indexWhere((e) => e.eventTitle == deletedEvent.eventTitle);
            if(index > -1){
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
  final FirebaseFirestore db;
  SubscribedEventsStore()
      : db = FirestoreRepository().firestoreInstance,
        super(List.empty(growable: true)) {
    db.collection('event').limit(5).snapshots().listen(eventListener);
  }

  void eventListener(QuerySnapshot<Map<String, dynamic>> snapshot) {
    if (snapshot.docs.isNotEmpty) {
      List<Event> tmp = [...state];
      for (var change in snapshot.docChanges) {
        switch (change.type) {
          case DocumentChangeType.added:
            tmp.add(Event.fromJson(change.doc.data()!));
            break;
          case DocumentChangeType.modified:
            Event modiefiedEvent = Event.fromJson(change.doc.data()!);
            int index = tmp.indexWhere((e) => e.eventTitle == modiefiedEvent.eventTitle);
            if(index > -1){
              tmp[index] = modiefiedEvent;
            }
            break;
          case DocumentChangeType.removed:
            Event deletedEvent = Event.fromJson(change.doc.data()!);
            int index = tmp.indexWhere((e) => e.eventTitle == deletedEvent.eventTitle);
            if(index > -1){
              tmp.removeAt(index);
            }
            break;
        }
      }
      emit(tmp);
    }
  }
}

class FavoriteEventStore extends Cubit<List<Event>> {
  final FirebaseFirestore db;
  FavoriteEventStore()
      : db = FirestoreRepository().firestoreInstance,
        super(List.empty(growable: true)) {
    db.collection('event').limit(5).snapshots().listen(eventListener);
  }

  void eventListener(QuerySnapshot<Map<String, dynamic>> snapshot) {
    if (snapshot.docs.isNotEmpty) {
      List<Event> tmp = [...state];
      for (var change in snapshot.docChanges) {
        switch (change.type) {
          case DocumentChangeType.added:
            tmp.add(Event.fromJson(change.doc.data()!));
            break;
          case DocumentChangeType.modified:
            Event modiefiedEvent = Event.fromJson(change.doc.data()!);
            int index = tmp.indexWhere((e) => e.eventTitle == modiefiedEvent.eventTitle);
            if(index > -1){
              tmp[index] = modiefiedEvent;
            }
            break;
          case DocumentChangeType.removed:
            Event deletedEvent = Event.fromJson(change.doc.data()!);
            int index = tmp.indexWhere((e) => e.eventTitle == deletedEvent.eventTitle);
            if(index > -1){
              tmp.removeAt(index);
            }
            break;
        }
      }
      emit(tmp);
    }
  }
}
