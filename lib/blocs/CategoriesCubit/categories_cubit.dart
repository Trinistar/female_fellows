import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vs_femalefellows/models/category.dart';
import 'package:vs_femalefellows/provider/firebase/firestore_event_repository.dart';
import 'package:vs_femalefellows/provider/firebase/firestore_repository.dart';

part 'categories_state.dart';

class CategoryCubit extends Cubit<CategoriesState> {
  CategoryCubit()
      : db = FirestoreRepository().firestoreInstance,
        super(CategoriesInitial()) {
    getCats();
  }

  final FirebaseFirestore db;

  final FirestoreEventRepository _eventRepository = FirestoreEventRepository();

  Future<void> getCats() async {
    try {
      final List<Category> cats = await _eventRepository.getCategories();
      emit(CategoriesLoaded(cats: cats));
    } catch (e) {
      emit(CategoriesNotLoaded());
    }
  }
}
