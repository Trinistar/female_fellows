import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vs_femalefellows/blocs/EventBloc/event_bloc.dart';
import 'package:vs_femalefellows/components/female_fellows_button.dart';
import 'package:vs_femalefellows/models/events.dart';
import 'package:vs_femalefellows/pages/Eventpages/EventComponents/color_artbar.dart';
import 'package:vs_femalefellows/pages/Eventpages/EventComponents/participants_image_row.dart';
import 'package:vs_femalefellows/pages/Eventpages/event_authentication_entry.dart';
import 'package:vs_femalefellows/pages/Homepage/homepage_container/homepage_divider.dart';

class DetailEvent extends StatefulWidget {
  const DetailEvent({super.key, required this.eventState});
  final Event eventState;

  @override
  State<DetailEvent> createState() => _DetailEventState();
}

class _DetailEventState extends State<DetailEvent> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).colorScheme.secondary,
        ),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            children: [
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
                    Image.asset(
                      'lib/images/Mask group2.png',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              Artbar(
                  colorleft: Theme.of(context).colorScheme.secondary,
                  colorright: Colors.white),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 1000,
                      height: 30,
                      child:  Stack(
                      children: [
                        Text(
                         widget.eventState.eventTitle,
                          style: TextStyle(fontSize: 20),
                        ),
                       
                        Positioned(
                          top: -10,
                          right: 10,
                          child: IconButton(
                            onPressed: null,
                            icon: Icon (Icons.favorite_border),
                            iconSize: 35,
                          ),
                        )
                      ],
                    ), 
                    ),
                  
                    Divider(
                      thickness: 5,
                      color: Theme.of(context).colorScheme.primary,
                      endIndent: 330,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                        leading: Icon(Icons.calendar_today),
                        title: Text(
                        widget.eventState.date,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        )),
                    ListTile(
                        leading: Icon(Icons.person_outline),
                        title: Text(
                         widget.eventState.host,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        )),
                    ListTile(
                      leading: Icon(Icons.location_on_outlined),
                      title: Text(
                     widget.eventState.location,
                        style: TextStyle(fontSize: 15),
                      ),
                      subtitle: Text(
                        'Adresse anzeigen',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    ListTile(
                      leading: Image.asset(
                        'lib/images/ImageIcon.png',
                        cacheHeight: 25,
                      ),
                      title: Text(
                        widget.eventState.contactPerson,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      subtitle: Text(
                        'Ansprechpartnerin',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    ParticipantsImageRow(),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FFButton(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Evententry()));
                  },
                  text: 'Jetzt anmelden'),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Über das Event',
                      style: TextStyle(fontSize: 20),
                    ),
                    Divider(
                      thickness: 5,
                      endIndent: 320,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 150,
                      width: 350,
                      child: Text(
                        widget.eventState.eventDescription,
                       style: TextStyle(fontSize: 15),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
              Padding(
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
                    Container(
                      alignment: Alignment.center,
                      width: 150,
                      height: 30,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2,
                              color: Theme.of(context).colorScheme.primary),
                          borderRadius: BorderRadius.circular(60)),
                      child: Text('Sprache'),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bilder von den letzten Events',
                      style: TextStyle(fontSize: 20),
                    ),
                    Divider(
                      color: Theme.of(context).colorScheme.primary,
                      thickness: 5,
                      endIndent: 320,
                    ),
                    SizedBox(
                      height: 200,
                    ),
                  ],
                ),
              ),
              DividerBouthCorner(
                color1: Theme.of(context).colorScheme.surfaceVariant,
                color2: Colors.white,
              ),
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
                        'Was muss ich mitbringen',
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
                        subtitle: Text(widget.eventState.material!.planer),
                      ),
                      ListTile(
                        isThreeLine: true,
                        leading: Image.asset(
                          'lib/images/book.png',
                          cacheHeight: 45,
                        ),
                        title: Text('Wörterbuch'),
                        subtitle: Text(widget.eventState.material!.book),
                      ),
                      ListTile(
                        isThreeLine: true,
                        leading: Image.asset(
                          'lib/images/food.png',
                          cacheHeight: 45,
                        ),
                        title: Text('Kulinarische Köstlichkeiten'),
                        subtitle: Text(widget.eventState.material!.food),
                      ),
                      ListTile(
                        isThreeLine: true,
                        leading: Image.asset(
                          'lib/images/globe.png',
                          cacheHeight: 45,
                        ),
                        title: Text('Kulturelle Informationen'),
                        subtitle: Text(widget.eventState.material!.information),
                      ),
                      ListTile(
                        isThreeLine: true,
                        leading: Image.asset(
                          'lib/images/globe.png',
                          cacheHeight: 45,
                        ),
                        title: Text('Kleidung'),
                        subtitle: Text(widget.eventState.material!.clothes),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
