import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:femalefellows/models/events.dart';
import 'package:femalefellows/models/user_model.dart';
import 'package:femalefellows/provider/firebase/firestore_event_repository.dart';

part 'signedup_event_event.dart';
part 'signedup_event_state.dart';

class SignedupEventsBloc extends Bloc<SignedupEventEvents, SignedupEventsState> {
  SignedupEventsBloc(this._authBloc) : super(SignedupEventsInitial()) {
    on<LoadSignedupEvents>(_onLoadSignedUpEvents);
    on<UnloadSignedUpEvents>((UnloadSignedUpEvents event, Emitter<SignedupEventsState> emit) => emit(SignedupEventsNotLoaded()));

    _authBlocStreamSub = _authBloc.stream.listen((AuthenticationState state) {
      if (state is UnauthenticatedUser) {
        add(UnloadSignedUpEvents());
      } else if (state is AuthenticatedUser) {
        if (state.userProfile != null) {
          add(LoadSignedupEvents(state.userProfile!));
        }
      }
    });
  }


  final AuthenticationBloc _authBloc;

  late StreamSubscription<dynamic>? _authBlocStreamSub;

  final FirestoreEventRepository _firestoreEventRepo = FirestoreEventRepository();

  Future<void> _onLoadSignedUpEvents(LoadSignedupEvents event, Emitter<SignedupEventsState> emit) async {
    emit(SignedupEventsLoading());

    return emit.onEach(_firestoreEventRepo.getEventsById(event.profile.participatingEvents), onData: (List<Event> favs) async {
      emit(SignedupEventsLoaded(favs));
    }).onError((error, stackTrace) => emit(SignedupEventsNotLoaded()));
  }

  @override
  Future<void> close() {
    _authBlocStreamSub?.cancel();
    return super.close();
  }
}
