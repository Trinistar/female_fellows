import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vs_femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:vs_femalefellows/models/enums.dart';
import 'package:vs_femalefellows/models/user_model.dart';
import 'package:vs_femalefellows/provider/firestore/firestore_user_profile_repository.dart';

part 'tandem_event.dart';
part 'tandem_state.dart';

class TandemBloc extends Bloc<TandemEvent, TandemState> {
  TandemBloc(this.firestoreUserprofileRepository, this._authBloc) : super(TandemInitial()) {
    on<LoadAllTandemLocalsEvent>(_onLoadAllTandemLocalsEvent);
    on<LoadAllTandemNewcomersEvent>(_onLoadAllTandemNewcomersEvent);

    _authBlocStreamSub = _authBloc.stream.listen((AuthenticationState state) {
      if (state is AuthenticatedUser) {
        if (state.userProfile!.localOrNewcomer == LocalOrNewcomer.local) {
          add(LoadAllTandemNewcomersEvent());
        }
        if (state.userProfile!.localOrNewcomer == LocalOrNewcomer.newcomer) {
          add(LoadAllTandemLocalsEvent());
        }
      } else if (state is UnauthenticatedUser) {
        add(UnloadAllTandemsEvent());
      }
    });
  }

  final AuthenticationBloc _authBloc;

  StreamSubscription<dynamic>? _authBlocStreamSub;

  final FirestoreUserProfileRepository firestoreUserprofileRepository;

  Future<void> _onLoadAllTandemLocalsEvent(LoadAllTandemLocalsEvent event, Emitter<TandemState> emit) async {
    return emit.onEach(
      firestoreUserprofileRepository.getAllTandems('local'),
      onData: (List<FFUser> tandems) async {
        if (tandems.isEmpty) emit(TandemsNotLoaded());

        emit(TandemLocalsLoaded(tandems: tandems));
      },
    );
  }

  Future<void> _onLoadAllTandemNewcomersEvent(LoadAllTandemNewcomersEvent event, Emitter<TandemState> emit) async {
    return emit.onEach(
      firestoreUserprofileRepository.getAllTandems('newcomer'),
      onData: (List<FFUser> tandems) async {
        if (tandems.isEmpty) emit(TandemsNotLoaded());

        emit(TandemNewcomersLoaded(tandems: tandems));
      },
    );
  }

  @override
  Future<void> close() {
    _authBlocStreamSub?.cancel();
    return super.close();
  }
}
