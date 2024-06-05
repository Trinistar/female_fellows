import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vs_femalefellows/blocs/EventBloc/event_bloc.dart';
import 'package:vs_femalefellows/blocs/ImageUploadBloc/image_upload_bloc.dart';
import 'package:vs_femalefellows/components/female_fellows_button.dart';
import 'package:vs_femalefellows/models/address.dart';
import 'package:vs_femalefellows/models/enums.dart';
import 'package:vs_femalefellows/models/events.dart';
import 'package:vs_femalefellows/models/materials.dart';
import 'package:vs_femalefellows/pages/Event/CreateEvent/event_category_items.dart';
import 'package:vs_femalefellows/pages/Event/UpdateEvent/update_description.dart';
import 'package:vs_femalefellows/pages/Event/UpdateEvent/update_event_item.dart';
import 'package:vs_femalefellows/pages/Event/UpdateEvent/update_materials.dart';
import 'package:vs_femalefellows/provider/controller.dart';

class UpdateEvent extends StatefulWidget {
  const UpdateEvent({super.key, required this.eventState});

  final Event eventState;

  @override
  State<UpdateEvent> createState() => _UpdateEventState();
}

class _UpdateEventState extends State<UpdateEvent> {
  Timestamp _newDate = Timestamp.now();
  List<int> _catIds = [];
  XFile _image = XFile('');
  ImageProcessing _imageProcessing = ImageProcessing.none;
  bool _wasEmpty = false;

  void _getCatIds(List<int> catIds) {
    _catIds = catIds;
  }

  void _getEventDate(Timestamp date) {
    _newDate = date;
  }

  @override
  void initState() {
    _setInputFields(widget.eventState);
    _image = XFile(widget.eventState.picture != null ? widget.eventState.picture! : '');
    if (_image.path.isEmpty) _wasEmpty = true;
    super.initState();
  }

  void _setInputFields(Event eventState) {
    Controller.eventTitleController.text = eventState.title;
  }

  Future<void> _getImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery, maxWidth: 2000, maxHeight: 2000);
    if (image != null) {
      setState(() {
        _image = image;
        _imageProcessing = ImageProcessing.upload;
      });
    }
    if (!mounted) return;
    Navigator.pop(context, 'Abbrechen');
  }

  Future<void> _getImageFromCamera() async {
    final XFile? image = await ImagePicker().pickImage(source: ImageSource.camera, maxWidth: 2000, maxHeight: 2000);
    if (image != null) {
      setState(() {
        _image = image;
        _imageProcessing = ImageProcessing.upload;
      });
    }
    if (!mounted) return;
    Navigator.pop(context, 'Abbrechen');
  }

  void _deleteCurrentImage() {
    setState(() {
      _image = XFile('');
      _imageProcessing = ImageProcessing.delete;
      Navigator.pop(context, 'Abbrechen');
    });
  }

  Widget _standardAvatar(BuildContext context) {
    return Container(
      width: 500.0,
      height: 150.0,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(10),
        shape: BoxShape.rectangle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('lib/images/event-1.png'),
        ),
      ),
    );
  }

  Future<dynamic> _showChangePictureOptionsDialog(BuildContext context) {
    return showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        //title: Text('Profilbild ändern'),
        actions: <Widget>[
          ColoredBox(
            color: Colors.white,
            child: CupertinoActionSheetAction(
              onPressed: _deleteCurrentImage,
              child: Text(
                'removeCurrentPicture',
                style: const TextStyle(color: CupertinoColors.destructiveRed),
              ),
            ),
          ),
          ColoredBox(
            color: Colors.white,
            child: CupertinoActionSheetAction(
              onPressed: _getImageFromGallery,
              child: Text('chooseFromLibrary'),
            ),
          ),
          ColoredBox(
            color: Colors.white,
            child: CupertinoActionSheetAction(
              onPressed: _getImageFromCamera,
              child: Text('takePhoto'),
            ),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context, 'Abbrechen'),
          child: Text('cancel'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
        ),
        child: RepositoryProvider<Event>(
          create: (context) => widget.eventState,
          child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: Text(
                AppLocalizations.of(context)!.updateEventTitle,
              ),
            ),
            backgroundColor: Colors.white,
            body: ListView(
              children: [
                GestureDetector(
                  onTap: () => _showChangePictureOptionsDialog(context),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Center(
                      child: Wrap(
                        children: <Widget>[
                          if (_imageProcessing != ImageProcessing.none)
                            if (_image.path.isEmpty)
                              _standardAvatar(context)
                            else
                              Container(
                                width: 500.0,
                                height: 150.0,
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10),
                                  shape: BoxShape.rectangle,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: FileImage(File(_image.path)),
                                  ),
                                ),
                              ),
                          if (_imageProcessing == ImageProcessing.none)
                            if (_image.path.isEmpty)
                              _standardAvatar(context)
                            else
                              Container(
                                width: 500.0,
                                height: 150.0,
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10),
                                  shape: BoxShape.rectangle,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: FileImage(File(_image.path)),
                                  ),
                                ),
                              ),
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: CupertinoButton(
                    onPressed: () async {
                      _showChangePictureOptionsDialog(context);
                    },
                    child: Text('changePicture'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: SvgPicture.asset(
                          'lib/images/globe.svg',
                          height: 20,
                        ),
                        title: TextFormField(
                          controller: Controller.eventTitleController,
                          decoration: InputDecoration(
                            disabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            fillColor: Theme.of(context).colorScheme.surface,
                            hintText: widget.eventState.title,
                          ),
                        ),
                        subtitle: Text(
                          AppLocalizations.of(context)!.createEventTitle,
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                UpdateEventDate(eventState: widget.eventState, newEventDate: _getEventDate),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 30,
                ),
                UpdateDesciption(event: widget.eventState),
                SizedBox(
                  height: 30,
                ),
                Container(
                  color: Colors.white,
                  width: 1000,
                  height: 500,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: ListView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        ListTile(
                          leading: Image.asset(
                            'lib/images/category.png',
                            cacheHeight: 30,
                          ),
                          title: Text(AppLocalizations.of(context)!.eventOneTitleTwo),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CategoryItems(selectedCategories: _getCatIds, editingEvent: true, event: widget.eventState),
                      ],
                    ),
                  ),
                ),
                UpdateMaterials(event: widget.eventState),
                SizedBox(
                  height: 30,
                ),
                FFButton(
                    onTap: () {
                      final Event updatedEvent = Event(
                        categories: _catIds,
                        id: widget.eventState.id,
                        whatsAppLink: Controller.whatsAppLinkController.text,
                        email: Controller.eventEmailController.text,
                        phoneNumber: Controller.eventPhoneNumberController.text,
                        dates: EventDates(updated: Timestamp.fromDate(DateTime.now()), eventDate: _newDate),
                        description: Controller.descriptionController.text,
                        host: Controller.hostController.text,
                        title: Controller.eventTitleController.text,
                        contactPerson: Controller.contactPersonController.text,
                        location: Address(street: Controller.streetnameController.text, city: Controller.placeController.text, zipCode: Controller.zipCodeController.text),
                        material: EventMaterials(
                          planer: Controller.planerController.text,
                          food: Controller.foodController.text,
                          information: Controller.informationController.text,
                          clothes: Controller.clothesController.text,
                        ),
                      );
                      switch (_imageProcessing) {
                        case ImageProcessing.upload:
                          context.read<ImageUploadBloc>().add(UploadEventImageEvent(_image, updatedEvent, imageUploadType: ImageUploadType.event));
                          break;
                        case ImageProcessing.delete:
                          context.read<ImageUploadBloc>().add(DeleteEventImageEvent(updatedEvent));
                          if (!_wasEmpty) {
                            context.read<ImageUploadBloc>().add(DeleteEventImageEvent(updatedEvent));
                          } else {
                            context.read<EventBloc>().add(
                                  EventUpdate(
                                    updateEvent: updatedEvent,
                                  ),
                                );
                            context.pop();
                          }
                          break;
                        case ImageProcessing.none:
                          context.read<EventBloc>().add(
                                EventUpdate(
                                  updateEvent: updatedEvent,
                                ),
                              );
                          context.pop();

                          break;
                        default:
                      }
                      context.pop();
                    },
                    text: AppLocalizations.of(context)!.updateEventButton),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ));
  }
}
