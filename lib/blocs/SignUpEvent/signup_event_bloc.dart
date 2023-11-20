import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'signup_event_event.dart';
part 'signup_event_state.dart';

class SignupEventBloc extends Bloc<SignupEventEvent, SignupEventState> {
  SignupEventBloc() : super(SignupEventInitial()) {
    on<SignupEventEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
