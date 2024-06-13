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
import 'package:femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:femalefellows/blocs/ImageUploadBloc/image_upload_bloc.dart';
import 'package:femalefellows/components/female_fellows_button.dart';
import 'package:femalefellows/models/address.dart';
import 'package:femalefellows/models/enums.dart';
import 'package:femalefellows/models/user_model.dart';
import 'package:femalefellows/provider/controller.dart';

class EditProfile extends StatefulWidget {
  EditProfile({super.key, required this.userstate});
  final FFUser userstate;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  LocalOrNewcomer? localOrNot;
  DateTime _dateTime = DateTime.now();
  XFile _image = XFile('');
  ImageProcessing _imageProcessing = ImageProcessing.none;
  bool _wasEmpty = false;

  @override
  void initState() {
    _setInputFields(widget.userstate);
    _image = XFile(widget.userstate.profilPicture != null ? widget.userstate.profilPicture! : '');
    if (_image.path.isEmpty) _wasEmpty = true;
    super.initState();
  }

  void _setInputFields(FFUser user) {
    Controller.firstnameController.text = user.firstname!;
    Controller.lastnameController.text = user.lastname!;
    _dateTime = user.birthday!.toDate();
    Controller.streetnameController.text = user.address!.street;
    Controller.zipCodeController.text = user.address!.zipCode;
    Controller.placeController.text = user.address!.city;
    Controller.aboutYouController.text = user.aboutMe!;
  }

  void _showdatePicker() {
    showDatePicker(
      context: context,
      initialDate: _dateTime,
      firstDate: DateTime(1940),
      lastDate: DateTime(3000),
    ).then((value) {
      setState(() {
        if (value != null) {
          _dateTime = value;
        }
      });
    });
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

  Stack _standardAvatar(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            width: 100.0,
            height: 100.0,
            /* decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: CupertinoTheme.of(context).brightness == Brightness.dark
                  ? const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: <Color>[colorBackground, colorBackground],
                    )
                  : null,
              border: CupertinoTheme.of(context).brightness == Brightness.dark ? null : Border.all(color: colorTwo),
            ), */
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('lib/images/ImageIcon.png'),
            radius: 50,
          ),
        ),
      ],
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
        child: RepositoryProvider<FFUser>(
          create: (context) => widget.userstate,
          child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(
                'Bearbeite dein Profil',
              ),
            ),
            backgroundColor: Colors.white,
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Center(
                    child: Wrap(
                      children: <Widget>[
                        if (_imageProcessing != ImageProcessing.none)
                          if (_image.path.isEmpty)
                            _standardAvatar(context)
                          else
                            Container(
                              margin: const EdgeInsets.all(12.0),
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(File(_image.path)),
                                ),
                              ),
                            ),
                        if (_imageProcessing == ImageProcessing.none)
                          if (widget.userstate.profilPicture == null || widget.userstate.profilPicture!.isEmpty)
                            _standardAvatar(context)
                          else
                            Container(
                              margin: const EdgeInsets.all(12.0),
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(widget.userstate.profilPicture != null ? widget.userstate.profilPicture! : ''),
                                ),
                              ),
                            )
                      ],
                    ),
                  ),
                ),
                CupertinoButton(
                  onPressed: () async {
                    _showChangePictureOptionsDialog(context);
                  },
                  child: Text('changePicture'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: SvgPicture.asset(
                          'lib/images/notebook.svg',
                          height: 20,
                        ),
                        title: TextFormField(
                          controller: Controller.firstnameController,
                          decoration: InputDecoration(
                            disabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            fillColor: Theme.of(context).colorScheme.surface,
                            hintText: widget.userstate.firstname,
                          ),
                        ),
                        subtitle: Text(
                          'Firstname',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      ListTile(
                        leading: SvgPicture.asset(
                          'lib/images/notebook.svg',
                          height: 20,
                        ),
                        title: TextFormField(
                          controller: Controller.lastnameController,
                          decoration: InputDecoration(
                            disabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            fillColor: Theme.of(context).colorScheme.surface,
                            hintText: widget.userstate.lastname,
                          ),
                        ),
                        subtitle: Text(
                          'Lastname',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.calendar_today),
                        title: GestureDetector(
                          onTap: () {
                            _showdatePicker();
                          },
                          child: Text(
                            // ignore: unnecessary_null_comparison
                            _dateTime != null
                                ? '${_dateTime.day}.${_dateTime.month}.${_dateTime.year}'
                                : '${widget.userstate.birthday!.toDate().day}.${widget.userstate.birthday!.toDate().month}.${widget.userstate.birthday!.toDate().year}',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        subtitle: Text(
                          'Birthday',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      ListTile(
                        leading: SvgPicture.asset(
                          'lib/images/globe.svg',
                          height: 20,
                        ),
                        title: TextFormField(
                          controller: Controller.streetnameController,
                          decoration: InputDecoration(
                            disabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            fillColor: Theme.of(context).colorScheme.surface,
                            hintText: widget.userstate.address?.street,
                          ),
                        ),
                        subtitle: Text(
                          'Streetname',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      ListTile(
                        leading: SvgPicture.asset(
                          'lib/images/globe.svg',
                          height: 20,
                        ),
                        title: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: Controller.zipCodeController,
                          decoration: InputDecoration(
                            disabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            fillColor: Theme.of(context).colorScheme.surface,
                            hintText: widget.userstate.address?.zipCode,
                          ),
                        ),
                        subtitle: Text(
                          'Zipcode',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      ListTile(
                        leading: SvgPicture.asset(
                          'lib/images/globe.svg',
                          height: 20,
                        ),
                        title: TextFormField(
                          controller: Controller.placeController,
                          decoration: InputDecoration(
                            disabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            fillColor: Theme.of(context).colorScheme.surface,
                            hintText: widget.userstate.address?.city,
                          ),
                        ),
                        subtitle: Text(
                          'Place',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: SizedBox(
                          width: 350,
                          child: RadioListTile(
                              isThreeLine: true,
                              groupValue: localOrNot,
                              dense: true,
                              title: Text(
                                AppLocalizations.of(context)!.authenticationNewcomerTitle,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              subtitle: Text(AppLocalizations.of(context)!.authenticationNewcomer),
                              value: LocalOrNewcomer.newcomer,
                              onChanged: (newValue) {
                                setState(() {
                                  localOrNot = newValue;
                                  //widget.onSettingsChanged(_question);
                                });
                              }),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: SizedBox(
                          width: 350,
                          child: RadioListTile(
                              isThreeLine: true,
                              groupValue: localOrNot,
                              dense: true,
                              title: Text(
                                AppLocalizations.of(context)!.authenticationLocalTitle,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              subtitle: Text(AppLocalizations.of(context)!.authenticationLocal),
                              value: LocalOrNewcomer.local,
                              onChanged: (newValue) {
                                setState(() {
                                  localOrNot = newValue;
                                });
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Text(
                        'About You',
                        style: TextStyle(fontSize: 20),
                      ),
                      Container(
                        decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface, borderRadius: BorderRadius.all(Radius.circular(20))),
                        height: 150,
                        width: 350,
                        child: TextFormField(
                          controller: Controller.aboutYouController,
                          maxLines: 6,
                          decoration: InputDecoration(
                            disabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            fillColor: Theme.of(context).colorScheme.surface,
                            hintText: widget.userstate.aboutMe,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text((BlocProvider.of<AuthenticationBloc>(context).state as AuthenticatedUser).user!.emailVerified.toString()),
                MaterialButton(
                  child: Text('verifiy'),
                  color: Colors.amber,
                  onPressed: () => (BlocProvider.of<AuthenticationBloc>(context).state as AuthenticatedUser).user!.sendEmailVerification(),
                ),
                FFButton(
                    onTap: () {
                      FFUser profile = (BlocProvider.of<AuthenticationBloc>(context).state as AuthenticatedUser).userProfile!;
                      profile.firstname = Controller.firstnameController.text;
                      profile.lastname = Controller.lastnameController.text;
                      profile.birthday = Timestamp.fromDate(_dateTime);
                      profile.address = Address(street: Controller.streetnameController.text, zipCode: Controller.zipCodeController.text, city: Controller.placeController.text);
                      profile.aboutMe = Controller.aboutYouController.text;
                      switch (_imageProcessing) {
                        case ImageProcessing.upload:
                          context.read<ImageUploadBloc>().add(UploadImageEvent(_image, widget.userstate));
                          break;
                        case ImageProcessing.delete:
                          context.read<ImageUploadBloc>().add(DeleteImageEvent(widget.userstate));
                          if (!_wasEmpty) {
                            context.read<ImageUploadBloc>().add(DeleteImageEvent(widget.userstate));
                          } else {
                            context.read<AuthenticationBloc>().add(UpdateUserProfileEvent(widget.userstate.id!, userProfile: profile));
                            context.pop();
                          }
                          break;
                        case ImageProcessing.none:
                          context.read<AuthenticationBloc>().add(UpdateUserProfileEvent(widget.userstate.id!, userProfile: profile));
                          context.pop();

                          break;
                        default:
                          context.pop();
                      }
                    },
                    text: 'Update User'),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ));
  }
}
