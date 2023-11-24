import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vs_femalefellows/models/events.dart';
import 'package:vs_femalefellows/provider/controller.dart';
import 'package:vs_femalefellows/provider/firestore/firestore_event.dart';

part 'event_event.dart';
part 'event_state.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  final FirestorEventRepository firestoreEventRepository;
  EventBloc(this.firestoreEventRepository) : super(EventInitial()) {
    on<NewEvent>((event, emit) async {
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

        if (eventdata !=null) {
          await firestoreEventRepository.updateEvent(eventdata,
              eventtitle: event.eventTitle);
        } else {
          emit(EventFailure());
        }
      } catch (e) {
        emit(EventFailure());
      }
    });
  }
}
