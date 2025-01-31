import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:femalefellows/components/text_bar.dart';
import 'package:femalefellows/generated/l10n.dart';
import 'package:femalefellows/models/enums.dart';

import 'package:femalefellows/provider/controller.dart';

class AuthWho extends StatefulWidget {
  const AuthWho({
    super.key,
    this.picture,
  });

  final void Function(XFile)? picture;

  @override
  State<AuthWho> createState() => _AuthWhoState();
}

class _AuthWhoState extends State<AuthWho> {
  //Uint8List? _image;
  XFile _image = XFile('');
  ImageProcessing _imageProcessing = ImageProcessing.none;
  bool _wasEmpty = false;

  /* void pickImage() async {
    Uint8List img = await selectImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  } */

  @override
  void initState() {
    super.initState();
    if (_image.path.isEmpty) _wasEmpty = true;
  }

  /* selectImage(ImageSource source) async {
    try {
      final ImagePicker selectImage = ImagePicker();
      XFile? file = await selectImage.pickImage(source: source);
      if (file != null) {
        return await file.readAsBytes();
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  } */

  Future<void> _getImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery, maxWidth: 2000, maxHeight: 2000);
    if (image != null) {
      setState(() {
        _image = image;
        widget.picture!(image);
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
        widget.picture!(image);
        _imageProcessing = ImageProcessing.upload;
      });
    }
    if (!mounted) return;
    Navigator.pop(context, 'Abbrechen');
  }

  void _deleteCurrentImage() {
    setState(() {
      _image = XFile('');
      widget.picture!(_image);
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
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ListView(
          children: [
            Text(
              S.of(context).authenticationWho,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: GestureDetector(
                onTap: () => _showChangePictureOptionsDialog(context),
                child: _image.path.isNotEmpty
                    ? CircleAvatar(
                        backgroundImage: FileImage(File(_image.path)),
                        radius: 80,
                        backgroundColor: Theme.of(context).colorScheme.secondary,
                      )
                    : CircleAvatar(
                        backgroundImage: AssetImage('lib/images/ImageIcon.png'),
                        radius: 80,
                        backgroundColor: Theme.of(context).colorScheme.secondary,
                      ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Center(
              child: Text(
                S.of(context).authenticationPicture,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    S.of(context).authenticationFirstname,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  builder: (context, state) {
                    //TODO inputvalidierung für Plichtfelder
                    return TextBar(
                      controller: Controller.firstnameController,
                      hintText: 'Lisa',
                      obscureText: false,
                      onChange: (_) {},
                      validator: null,
                    );
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    S.of(context).authenticationLastname,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                TextBar(
                  controller: Controller.lastnameController,
                  hintText: 'Musterfrau',
                  obscureText: false,
                  onChange: null,
                  validator: null,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
