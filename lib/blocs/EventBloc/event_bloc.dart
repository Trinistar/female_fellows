import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:vs_femalefellows/models/address.dart';
import 'package:vs_femalefellows/models/events.dart';
import 'package:vs_femalefellows/models/materials.dart';
import 'package:vs_femalefellows/provider/controller.dart';
import 'package:vs_femalefellows/provider/firestore/firestore_event_repository.dart';

part 'event_event.dart';
part 'event_state.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  final FirestoreEventRepository firestoreEventRepository;
  EventBloc(this.firestoreEventRepository) : super(EventInitial()) {
    on<NewEvent>((event, emit) async {
      try {
        Event eventdata = Event(
          whatsAppLink: Controller.whatsAppLinkController.text,
          phoneNumber: Controller.eventPhoneNumberController.text,
          email: Controller.eventEmailController.text,
          date: event.newEvent.date,
          host: Controller.hostController.text,
          title: Controller.eventTitleController.text,
          location: Address(street: Controller.streetnameController.text, city: Controller.placeController.text, zipCode: Controller.zipCodeController.text),
          description: Controller.descriptionController.text,
          contactPerson: Controller.contactPersonController.text,
          material: EventMaterials(
            planer: Controller.planerController.text,
            food: Controller.foodController.text,
            information: Controller.informationController.text,
            clothes: Controller.clothesController.text,
          ),
        );
        emit(CreateSuccess(eventdata: eventdata, eventRef: await firestoreEventRepository.createEvent(eventdata)));
          Controller.clearControllers();
      } catch (e) {
        emit(EventFailure());
      }
    });
    on<EventUpdate>((event, emit) async {
      try {
        Event eventdata = Event(
          id: event.updateEvent.id,
          whatsAppLink: Controller.whatsAppLinkController.text,
          phoneNumber: Controller.eventPhoneNumberController.text,
          email: Controller.eventEmailController.text,
          date: event.updateEvent.date,
          host: Controller.hostController.text,
          title: Controller.eventTitleController.text,
          location: Address(street: Controller.streetnameController.text, city: Controller.placeController.text, zipCode: Controller.zipCodeController.text),
          description: Controller.descriptionController.text,
          contactPerson: Controller.contactPersonController.text,
          material: EventMaterials(
            planer: Controller.planerController.text,
            food: Controller.foodController.text,
            information: Controller.informationController.text,
            clothes: Controller.clothesController.text,
          ),
        );

        await firestoreEventRepository.updateEvent(eventdata);
        emit(UpdateEventSuccess());
          Controller.clearControllers();
      } catch (e) {
        emit(UpdateEventFailure());
      }
    });
  }
}
