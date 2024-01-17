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
    on<NewEvent>(_onNewEvent);
    on<EventUpdate>(_onEventUpdate);
    on<LoadEvent>(_onLoadEvent);
  }

  Future<void> _onLoadEvent(LoadEvent event, Emitter<EventState> emit) async {
    return emit.onEach(firestoreEventRepository.getEvent(event.eventId), onData: (Event? event) async {
      if (event == null) emit(EventNotLoaded());

      emit(EventLoaded(event: event!));
    });
  }

  Future<void> _onNewEvent(NewEvent event, Emitter<EventState> emit) async {
    try {
      Event eventdata = Event(
        categories: event.newEvent.categories,
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
      var ref = await firestoreEventRepository.createEvent(eventdata);
      emit(CreateSuccess(eventdata: eventdata, eventRef: ref));
      Controller.clearControllers();
    } catch (e) {
      emit(EventFailure());
    }
  }

  Future<void> _onEventUpdate(EventUpdate event, Emitter<EventState> emit) async {
    try {
      Event eventdata = Event(
        categories: event.updateEvent.categories,
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
      //emit(UpdateEventSuccess());
      Controller.clearControllers();
    } catch (e) {
      emit(UpdateEventFailure());
    }
  }

  @override
  Future<void> close() {
    // TODO: implement close
    return super.close();
  }
}
