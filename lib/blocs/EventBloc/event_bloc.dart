import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vs_femalefellows/models/address.dart';
import 'package:vs_femalefellows/models/enums.dart';
import 'package:vs_femalefellows/models/events.dart';
import 'package:vs_femalefellows/models/materials.dart';
import 'package:vs_femalefellows/models/user_model.dart';
import 'package:vs_femalefellows/provider/controller.dart';
import 'package:vs_femalefellows/provider/firestore/firestore_event_repository.dart';
import 'package:vs_femalefellows/provider/firestore/storage_repository.dart';

part 'event_event.dart';
part 'event_state.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  EventBloc(this._firestoreEventRepository) : super(EventInitial()) {
    on<NewEvent>(_onNewEvent);
    on<EventUpdate>(_onEventUpdate);
    on<LoadEvent>(_onLoadEvent);
  }

  final FirestoreEventRepository _firestoreEventRepository;
  final StorageRepository _storageRepository = StorageRepository();

  Future<void> _onLoadEvent(LoadEvent event, Emitter<EventState> emit) async {
    return emit.onEach(_firestoreEventRepository.getEvent(event.eventId), onData: (Event? eventData) async {
      if (eventData == null) emit(EventNotLoaded());

      if (event.isAdmin) {
        List<FFUser> parts = [];
        parts = await _firestoreEventRepository.getEventParticipants(event.eventId);
        eventData!.participants.addAll(parts);
        emit(EventLoaded(event: eventData));
      }

      emit(EventLoaded(event: eventData!));
    });
  }

  Future<void> _onNewEvent(NewEvent event, Emitter<EventState> emit) async {
    try {
      Event eventdata = Event(
        categories: event.newEvent.categories,
        whatsAppLink: Controller.whatsAppLinkController.text,
        phoneNumber: Controller.eventPhoneNumberController.text,
        email: Controller.eventEmailController.text,
        dates: event.newEvent.dates,
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
      var ref = await _firestoreEventRepository.createEvent(eventdata);
      eventdata.id = ref.id;
      final UploadTask? task = await _getUploadTask(event.eventPicture, ref.id);
      if (task != null) {
          await emit.onEach(task.snapshotEvents, onData: (uploadState) async {
            switch (uploadState.state) {
              case TaskState.running:
                break;

              case TaskState.success:
                final String downloadUrl = await uploadState.ref.getDownloadURL();
                eventdata.picture = downloadUrl;        
                await _firestoreEventRepository.updateEvent(eventdata);
                break;
              default:
            }
          });
        }
      emit(CreateSuccess(eventdata: eventdata, eventRef: ref));
      Controller.clearControllers();
    } catch (e) {
      emit(EventFailure());
    }
  }

  Future<UploadTask?> _getUploadTask(XFile? picture, String eventId) async {
    if (picture == null) return null;
    try {
      final PickedFile file = PickedFile(picture.path);
      final UploadTask? task = await _storageRepository.uploadFile(file, eventId, type: ImageUploadType.event);

      if (task == null) return null;

      return task;
    } catch (e) {
      print(e);
      return null;
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
        dates: event.updateEvent.dates,
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

      await _firestoreEventRepository.updateEvent(eventdata);
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
