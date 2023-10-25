import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vs_femalefellows/blocs/Registration/registration_bloc.dart';
import 'package:vs_femalefellows/components/text_bar.dart';
import 'package:vs_femalefellows/services/controller.dart';

class AuthWho extends StatefulWidget {
  const AuthWho({super.key});

  @override
  State<AuthWho> createState() => _AuthWhoState();
}

class _AuthWhoState extends State<AuthWho> {
  Uint8List? _image;

  void pickImage() async {
    Uint8List img = await selectImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  selectImage(ImageSource source) async {
    try {
      final ImagePicker selectImage = ImagePicker();
      XFile? file = await selectImage.pickImage(source: source);
      if (file != null) {
        return await file.readAsBytes();
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //namecheck
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocProvider(
          create: (context) => RegistrationBloc(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Text(
                    'Wer bist du?',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: GestureDetector(
                    onTap: pickImage,
                    child: _image != null
                        ? CircleAvatar(
                            backgroundImage: MemoryImage(_image!),
                            radius: 100,
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                          )
                        : CircleAvatar(
                            backgroundImage:
                                AssetImage('lib/images/Avatar.png'),
                            radius: 100,
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                          ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text(
                    'Profilbild / Avatar auswählen',
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
                      padding: const EdgeInsets.only(left: 40, bottom: 5),
                      child: Text(
                        'Vorname',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    BlocBuilder<RegistrationBloc, RegistrationState>(
                      builder: (context, state) {
                        return TextBar(
                          controller: Controller.firstnameController,
                          hintText: 'Lisa',
                          obscureText: false,
                          onChange: (value) =>
                              context.read<RegistrationBloc>().add(InputChanged(
                                    firstname: value,
                                  )),
                          validator: null,
                        );
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, bottom: 5),
                      child: Text(
                        'Nachname',
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
          )),
    );
  }
}
