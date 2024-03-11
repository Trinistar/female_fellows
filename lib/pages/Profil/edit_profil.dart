import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vs_femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:vs_femalefellows/blocs/EventBloc/event_bloc.dart';
import 'package:vs_femalefellows/components/female_fellows_button.dart';
import 'package:vs_femalefellows/models/address.dart';
import 'package:vs_femalefellows/models/enums.dart';
import 'package:vs_femalefellows/models/user_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vs_femalefellows/pages/Authentication/authentication_safety.dart';
import 'package:vs_femalefellows/provider/controller.dart';

class EditProfil extends StatefulWidget {
  EditProfil({super.key, required this.userstate, required this.hasChosen});
  final FFUser userstate;
  final void Function(LocalOrNewcomer)? hasChosen;

  @override
  State<EditProfil> createState() => _EditProfilState();
}

class _EditProfilState extends State<EditProfil> {
  LocalOrNewcomer? localOrNot;
  DateTime dateTime = DateTime.now();

  void _showdatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1940),
      lastDate: DateTime(3000),
    ).then((value) {
      setState(() {
        if (value != null) {
          dateTime = value;
        }
      });
    });
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
                            dateTime != null
                                ? '${dateTime.day}.${dateTime.month}.${dateTime.year}'
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
                                AppLocalizations.of(context)!
                                    .authenticationNewcomerTitle,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              subtitle: Text(AppLocalizations.of(context)!
                                  .authenticationNewcomer),
                              value: LocalOrNewcomer.newcomer,
                              onChanged: (newValue) {
                                setState(() {
                                  localOrNot = newValue;
                                  widget.hasChosen!(LocalOrNewcomer.newcomer);

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
                                AppLocalizations.of(context)!
                                    .authenticationLocalTitle,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              subtitle: Text(AppLocalizations.of(context)!
                                  .authenticationLocal),
                              value: LocalOrNewcomer.local,
                              onChanged: (newValue) {
                                setState(() {
                                  localOrNot = newValue;
                                  widget.hasChosen!(LocalOrNewcomer.local);
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
                  padding: const EdgeInsets.symmetric( horizontal: 20),
                  child: Column(
                    children: [
                      Text(
                      'About You',
                        style: TextStyle(fontSize: 20),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
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
                FFButton(
                    onTap: () {
                      context.read<AuthenticationBloc>().add(UpdateUSerProfil(
                          updateUser: FFUser(
                            aboutMe: Controller.aboutYouController.text,
                              firstname: Controller.firstnameController.text,
                              lastname: Controller.lastnameController.text,
                              //   birthday: Timestamp.fromDate(DateTime.now()),
                              address: Address(
                                street: Controller.streetnameController.text,
                                zipCode: Controller.zipCodeController.text,
                                city: Controller.placeController.text,
                              ))));
                      context.pop();
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
