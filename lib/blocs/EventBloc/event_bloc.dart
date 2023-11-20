import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vs_femalefellows/models/events.dart';
import 'package:vs_femalefellows/provider/controller.dart';
import 'package:vs_femalefellows/provider/firestore/firestore_event.dart';

part 'event_event.dart';
part 'event_state.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  EventBloc(this.currentuser) : super(EventInitial()) {
    on<EventEvent>((event, emit) {
      on<NewEvent>(_createEvent as EventHandler<NewEvent, EventState>); // TODO das ist nicht richtig ///
    });
  }


  final User? currentuser;
  final FirestorEventRepository _firestoreEventRepository =
      FirestorEventRepository();

  Future<void> _createEvent(Emitter<EventState> emit) async {
    emit(FormEvent());

    try {
      Event eventdata = Event(
        isfavorit: false,
        date: Controller.dateController.text,
        host: Controller.hostController.text,
        participants: '',
        eventTitle: Controller.eventTitleController.text,
        location: '',
        eventDescription: Controller.descriptionController.text,
        contactPerson: Controller.contactPersonController.text,
        material: Controller.materialController.text,
      );

      if (currentuser != null) {
        await _firestoreEventRepository.updateEvent(eventdata,
            userID: currentuser!.uid);
      } else {
        emit(EventFailure());
      }
    } catch (e) {
      emit(EventFailure());
    }
  }
}
