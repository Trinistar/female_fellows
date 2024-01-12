part of 'categories_cubit.dart';

sealed class CategoriesState {
  const CategoriesState();
}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoaded extends CategoriesState {
  CategoriesLoaded({required this.cats});

  final List<Category> cats;
}

final class CategoriesNotLoaded extends CategoriesState {}
