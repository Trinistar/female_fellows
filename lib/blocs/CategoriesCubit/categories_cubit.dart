import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vs_femalefellows/models/category.dart';
import 'package:vs_femalefellows/provider/firestore/firestore_event_repository.dart';
import 'package:vs_femalefellows/provider/firestore/firestore_repository.dart';

part 'categories_state.dart';

class CategoryCubit extends Cubit<List<Category>> {
  CategoryCubit()
      : db = FirestoreRepository().firestoreInstance,
        super(List.empty(growable: true)) {
    getCats();
  }

  final FirebaseFirestore db;

  final FirestoreEventRepository _eventRepository = FirestoreEventRepository();

  Future<void> getCats() async {
    try {
      final List<Category> cats = await _eventRepository.getCategories();
      emit(cats);
    } catch (e) {
      emit([]);
    }
  }
}
