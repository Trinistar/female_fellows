import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vs_femalefellows/blocs/EventBloc/event_bloc.dart';
import 'package:vs_femalefellows/components/female_fellows_button.dart';
import 'package:vs_femalefellows/components/text_bar.dart';
import 'package:vs_femalefellows/pages/Eventpages/EventComponents/color_artbar.dart';
import 'package:vs_femalefellows/pages/Eventpages/EventDetail/event_Categorys.dart';
import 'package:vs_femalefellows/pages/Eventpages/EventDetail/event_detail_page.dart';
import 'package:vs_femalefellows/pages/Homepage/homepage_container/homepage_divider.dart';
import 'package:vs_femalefellows/provider/controller.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

// Variablen
bool? _sport = false;
bool? _tandem = false;
bool? _outdoor = false;

class _CreateEventState extends State<CreateEvent> {
  @override
  Widget build(BuildContext context) {
    print(Controller.dateController);
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).colorScheme.secondary,
        ),
        child: Scaffold(
          body: BlocConsumer<EventBloc, EventState>(
            listener: (context, state) {
              if (state is CreateSuccess) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DetailEvent(
                          eventState: state.eventdata,
                        )));
              }
              if (state is EventFailure) {
                SnackBar(
                  content: Text('Failure'),
                );
              }
            },
            builder: (context, state) {
              return ListView(children: [
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(60))),
                  height: 215,
                  width: 1000,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      BackButton(),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          height: 26,
                          width: 40,
                          decoration: BoxDecoration(color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 35),
                        child: Image.asset(
                          'lib/images/Mask group2.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 130,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Text(
                              'Create Events',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 5,
                            indent: 40,
                            endIndent: 310,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Artbar(
                    colorleft: Theme.of(context).colorScheme.secondary,
                    colorright: Colors.white),
                SizedBox(
                  height: 20,
                ),
                // *************************************  //EVENT DATA //**************************************/
                Container(
                  width: 1000,
                  height: 350,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Text('Event Title'),
                        ),
                        TextBar(
                            controller: Controller.eventTitleController,
                            hintText: 'Title',
                            obscureText: false,
                            onChange: null,
                            validator: null),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Text('Event Datum'),
                        ),
                        TextBar(
                            controller: Controller.dateController,
                            hintText: 'Date',
                            obscureText: false,
                            onChange: null,
                            validator: null),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Text('Event Location'),
                        ),
                        TextBar(
                            controller: Controller.locationController,
                            hintText: 'Location',
                            obscureText: false,
                            onChange: null,
                            validator: null),
                      ],
                    ),
                  ),
                ),
                DividerBouthCorner(
                    color1: Theme.of(context).colorScheme.tertiary,
                    color2: Colors.white),

                // *************************************  //EVENT ORGA //**************************************/
                Container(
                  color: Theme.of(context).colorScheme.tertiary,
                  width: 1000,
                  height: 650,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 1000,
                        height: 110,
                        child: Stack(
                          children: [
                            Positioned(
                              right: 0,
                              child: Image.asset(
                                'lib/images/handright.png',
                              ),
                            ),
                            Positioned(
                              top: 50,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 40),
                                child: Column(
                                  children: [
                                    Text(
                                      'Orga des Events',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 40, top: 80),
                              child: Divider(
                                thickness: 5,
                                color: Colors.white,
                                endIndent: 300,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Text(
                          'Veranstalter',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                      TextBar(
                          controller: Controller.hostController,
                          hintText: 'Host',
                          obscureText: false,
                          onChange: null,
                          validator: null),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Text(
                          'Kontakt Person',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                      TextBar(
                          controller: Controller.contactPersonController,
                          hintText: 'Kontaktperson',
                          obscureText: false,
                          onChange: null,
                          validator: null),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Text(
                          'Event Email',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                      TextBar(
                          controller: Controller.eventEmailController,
                          hintText: 'Event Email',
                          obscureText: false,
                          onChange: null,
                          validator: null),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Text(
                          'Event PhoneNumber',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                      TextBar(
                          controller: Controller.eventPhoneNumberController,
                          hintText: 'Event PhoneNumber',
                          obscureText: false,
                          onChange: null,
                          validator: null),
                      Image.asset('lib/images/handleft.png')
                    ],
                  ),
                ),
                DividerBouthCorner(
                    color1: Theme.of(context).colorScheme.secondary,
                    color2: Theme.of(context).colorScheme.tertiary),
                // *************************************  //EVENT DESCRIPTION //**************************************/
                Container(
                  color: Theme.of(context).colorScheme.secondary,
                  height: 350,
                  width: 1000,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 250),
                          child: Image.asset('lib/images/Vector.png'),
                        ),
                        Text(
                          'Event Beschreibung',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Divider(
                          color: Colors.white,
                          thickness: 5,
                          endIndent: 280,
                        ),
                        TextField(
                          maxLength: 150,
                          maxLines: 6,
                          controller: Controller.descriptionController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black87),
                              // borderRadius: BorderRadius.only(topLeft:Radius.circular(20),),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            fillColor: Theme.of(context).colorScheme.surface,
                            filled: true,
                            hintText: 'Description',
                          ),
                        ),
                        Image.asset('lib/images/Vector.png'),
                      ],
                    ),
                  ),
                ),
                DividerBouthCorner(
                    color1: Colors.white,
                    color2: Theme.of(context).colorScheme.secondary),
                // *************************************  //EVENT CATEGORYS //**************************************/
                Container(
                  width: 1000,
                  height: 400,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: Image.asset(
                            'lib/images/category.png',
                            cacheHeight: 30,
                          ),
                          title: Text('Kategorien'),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            Wrap(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 150,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                      borderRadius: BorderRadius.circular(60)),
                                  child: Text('Sprache'),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 150,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                      borderRadius: BorderRadius.circular(60)),
                                  child: Text('Frauengesundheit'),
                                  
                                ),
                                    FilterChip(
                          label: Text('Sport'),
                          onSelected: (isSelected){},
                      
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 150,
                              height: 30,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                  borderRadius: BorderRadius.circular(60)),
                              child: Text('Frauengesundheit'),
                            ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                DividerBouthCorner(
                    color1: Theme.of(context).colorScheme.surfaceVariant,
                    color2: Colors.white),
                // *************************************  //EVENT MATERIALS //**************************************/
                Container(
                  width: 1000,
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Was soll mitgebracht werden',
                          style: TextStyle(fontSize: 20),
                        ),
                        Divider(
                          color: Theme.of(context).colorScheme.primary,
                          thickness: 5,
                          endIndent: 320,
                        ),
                        ListTile(
                          isThreeLine: true,
                          leading: Image.asset(
                            'lib/images/notebook.png',
                            cacheHeight: 45,
                          ),
                          title: Text('Notizbuch & Stifte'),
                          subtitle: TextField(
                            controller: Controller.planerController,
                            decoration: InputDecoration(
                                hintText: 'Trage die Materialien ein'),
                          ),
                        ),
                        ListTile(
                          isThreeLine: true,
                          leading: Image.asset(
                            'lib/images/book.png',
                            cacheHeight: 45,
                          ),
                          title: Text('Wörterbuch'),
                          subtitle: TextField(
                            controller: Controller.bookController,
                            decoration: InputDecoration(
                                hintText: 'Trage die Materialien ein'),
                          ),
                        ),
                        ListTile(
                          isThreeLine: true,
                          leading: Image.asset(
                            'lib/images/food.png',
                            cacheHeight: 45,
                          ),
                          title: Text('Kulinarische Köstlichkeiten'),
                          subtitle: TextField(
                            controller: Controller.foodController,
                            decoration: InputDecoration(
                                hintText: 'Trage die Materialien ein'),
                          ),
                        ),
                        ListTile(
                          isThreeLine: true,
                          leading: Image.asset(
                            'lib/images/globe.png',
                            cacheHeight: 45,
                          ),
                          title: Text('Kulturelle Informationen'),
                          subtitle: TextField(
                            controller: Controller.informationController,
                            decoration: InputDecoration(
                                hintText: 'Trage die Materialien ein'),
                          ),
                        ),
                        ListTile(
                          isThreeLine: true,
                          leading: Image.asset(
                            'lib/images/globe.png',
                            cacheHeight: 45,
                          ),
                          title: Text('Kleidung'),
                          subtitle: TextField(
                            controller: Controller.clothesController,
                            decoration: InputDecoration(
                                hintText: 'Trage die Materialien ein'),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                DividerBouthCorner(
                    color1: Colors.white,
                    color2: Theme.of(context).colorScheme.surfaceVariant),
                SizedBox(
                  height: 20,
                ),
                BlocBuilder<EventBloc, EventState>(
                  builder: (context, state) {
                    return FFButton(
                      text: 'Create Event',
                      onTap: () {
                        context.read<EventBloc>().add(NewEvent(
                              eventEmail: Controller.eventEmailController.text,
                              evntPhoneNumber:
                                  Controller.eventPhoneNumberController.text,
                              date: Controller.dateController.text,
                              eventDescription:
                                  Controller.descriptionController.text,
                              host: Controller.hostController.text,
                              eventTitle: Controller.eventTitleController.text,
                              contactPerson:
                                  Controller.contactPersonController.text,
                              location: Controller.locationController.text,
                              planer: Controller.planerController.text,
                              book: Controller.bookController.text,
                              food: Controller.foodController.text,
                              information:
                                  Controller.informationController.text,
                              clothes: Controller.clothesController.text,
                            ));
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 100,
                ),
              ]);
            },
          ),
        ));
  }
}
