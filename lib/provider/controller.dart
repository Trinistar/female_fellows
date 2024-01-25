import 'package:flutter/material.dart';

class Controller {
  static final emailController = TextEditingController();
  static final passwordController = TextEditingController();
  static final firstnameController = TextEditingController();
  static final lastnameController = TextEditingController();
  static final profilpictureController = TextEditingController();
  static final birthdayController = TextEditingController();
  static final streetnameController = TextEditingController();
  static final zipCodeController = TextEditingController();
  static final placeController = TextEditingController();
  static final phonenumberController = TextEditingController();
  static final searchbarController = TextEditingController();

  //controller event
  static final dateController = TextEditingController();
  static final hostController = TextEditingController();
  static final eventTitleController = TextEditingController();
  static final contactPersonController = TextEditingController();
  static final descriptionController = TextEditingController();
  static final locationController = TextEditingController();
  static final eventEmailController = TextEditingController();
  static final eventPhoneNumberController = TextEditingController();
  static final whatsAppLinkController = TextEditingController();
//Events Materials
  static final planerController = TextEditingController();
  static final foodController = TextEditingController();
  static final informationController = TextEditingController();
  static final clothesController = TextEditingController();

//controller Event Authentication
  static final languageController = TextEditingController();
  static final childNameController = TextEditingController();

//controller Tandem
static final aboutYouController= TextEditingController();

  static void clearControllers() {
    emailController.clear();
    passwordController.clear();
    firstnameController.clear();
    lastnameController.clear();
    phonenumberController.clear();
    birthdayController.clear();

    //event
    whatsAppLinkController.clear();
    eventEmailController.clear();
    eventPhoneNumberController.clear();
    descriptionController.clear();
    hostController.clear();
    eventTitleController.clear();
    contactPersonController.clear();
    //location
    streetnameController.clear();
    placeController.clear();
    zipCodeController.clear();
    //materials
    planerController.clear();
    foodController.clear();
    informationController.clear();
    clothesController.clear();
    //Tandem
    aboutYouController.clear();
  }
}
