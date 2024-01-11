part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => <Object>[];
}

class LoadFavoritesEvent extends FavoritesEvent {
  const LoadFavoritesEvent(this.profile);

  final FFUser profile;

    @override
  List<Object> get props => <Object>[profile];
}

class UnloadFavoritesEvent extends FavoritesEvent {
  
    @override
  List<Object> get props => <Object>[];
}
