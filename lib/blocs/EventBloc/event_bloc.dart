import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:vs_femalefellows/models/events.dart';
import 'package:vs_femalefellows/models/materials.dart';
import 'package:vs_femalefellows/provider/controller.dart';
import 'package:vs_femalefellows/provider/firestore/firestore_event.dart';

part 'event_event.dart';
part 'event_state.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  final FirestoreEventRepository firestoreEventRepository;
  EventBloc(this.firestoreEventRepository) : super(EventInitial()) {
    on<NewEvent>((event, emit) async {
      try {
        Event eventdata = Event(
            eventPhoneNumber: Controller.eventPhoneNumberController.text,
            eventEmail: Controller.eventEmailController.text,
            isfavorit: false,
            date: Controller.dateController.text,
            host: Controller.hostController.text,
            participants: '',
            eventTitle: Controller.eventTitleController.text,
            location: Controller.locationController.text,
            eventDescription: Controller.descriptionController.text,
            contactPerson: Controller.contactPersonController.text,
            material: EventMaterials(
              planer: Controller.planerController.text,
              book: Controller.bookController.text,
              food: Controller.foodController.text,
              information: Controller.informationController.text,
              clothes: Controller.clothesController.text,
            ));
        emit(CreateSuccess(
            eventdata: eventdata,
            eventRef: await firestoreEventRepository.createEvent(eventdata)));
      } catch (e) {
        emit(EventFailure());
      }
    });
  }
}
