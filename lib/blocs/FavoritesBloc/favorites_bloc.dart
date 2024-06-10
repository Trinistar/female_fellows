import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:femalefellows/models/events.dart';
import 'package:femalefellows/models/user_model.dart';
import 'package:femalefellows/provider/firebase/firestore_event_repository.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc(this._authBloc) : super(FavoritesInitial()) {
    on<LoadFavoritesEvent>(_onLoadFavoritesEvent);
    on<UnloadFavoritesEvent>((UnloadFavoritesEvent event, Emitter<FavoritesState> emit) => emit(FavoritesNotLoaded()));

    _authBlocStreamSub = _authBloc.stream.listen((AuthenticationState state) {
      if (state is UnauthenticatedUser) {
        add(UnloadFavoritesEvent());
      } else if (state is AuthenticatedUser) {
        if (state.userProfile != null) {
          add(LoadFavoritesEvent(state.userProfile!));
        }
      }
    });
  }

  final AuthenticationBloc _authBloc;

  late StreamSubscription<dynamic>? _authBlocStreamSub;

  final FirestoreEventRepository _firestoreEventRepo = FirestoreEventRepository();

  Future<void> _onLoadFavoritesEvent(LoadFavoritesEvent event, Emitter<FavoritesState> emit) async {
    emit(FavoritesLoading());

    return emit.onEach(_firestoreEventRepo.getEventsById(event.profile.favorites), onData: (List<Event> favs) async {
      emit(FavoritesLoaded(favs));
    }).onError((error, stackTrace) => emit(FavoritesNotLoaded()));
  }

  @override
  Future<void> close() {
    _authBlocStreamSub?.cancel();
    return super.close();
  }
}
