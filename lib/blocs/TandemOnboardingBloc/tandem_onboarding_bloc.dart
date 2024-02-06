import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vs_femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';

part 'tandem_onboarding_event.dart';
part 'tandem_onboarding_state.dart';

class TandemOnboardingBloc extends Bloc<TandemOnboardingEvent, TandemOnboardingState> {
  TandemOnboardingBloc(this._authBloc) : super(IsTandemOnboardingState()) {
    on<TandemOnboardingDoneEvent>(_onTandemOnboardingDoneEvent);
    on<CheckTandemOnboardingEvent>(_onTandemCheckOnboardingEvent);

    _authBlocSubscription = _authBloc.stream.listen((AuthenticationState state) {
      if (state is AuthenticatedUser) {
        add(CheckTandemOnboardingEvent());
      }
    });
  }

  final AuthenticationBloc _authBloc;

  StreamSubscription<dynamic>? _authBlocSubscription;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  late bool _onboarding;

  Future<void> _onTandemOnboardingDoneEvent(TandemOnboardingDoneEvent event, Emitter<TandemOnboardingState> emit) async {
    try {
      final SharedPreferences prefs = await _prefs;
      await prefs.setBool('tandemOnboarding', false);
      emit(TandemOnboardingDoneState());
    } catch (e) {
      emit(IsTandemOnboardingState());
    }
  }

  Future<void> _onTandemCheckOnboardingEvent(CheckTandemOnboardingEvent event, Emitter<TandemOnboardingState> emit) async {
    try {
      final SharedPreferences prefs = await _prefs;
      _onboarding = prefs.getBool('tandemOnboarding') ?? true;
      _onboarding ? emit(IsTandemOnboardingState()) : emit(TandemOnboardingDoneState());
    } catch (e) {
      emit(IsTandemOnboardingState());
    }
  }

  @override
  Future<void> close() {
    _authBlocSubscription?.cancel();
    return super.close();
  }
}
