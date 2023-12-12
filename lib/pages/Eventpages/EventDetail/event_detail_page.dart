import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vs_femalefellows/components/female_fellows_button.dart';
import 'package:vs_femalefellows/models/events.dart';
import 'package:vs_femalefellows/pages/Eventpages/EventComponents/color_artbar.dart';
import 'package:vs_femalefellows/pages/Eventpages/EventComponents/favoritIcon.dart';
import 'package:vs_femalefellows/pages/Eventpages/EventDetail/event_Description.dart';
import 'package:vs_femalefellows/pages/Eventpages/EventDetail/event_Items.dart';
import 'package:vs_femalefellows/pages/Eventpages/EventDetail/event_Materials.dart';
import 'package:vs_femalefellows/pages/Eventpages/EventDetail/event_Pictures.dart';
import 'package:vs_femalefellows/pages/Eventpages/EventSignup/event_authentication_entry.dart';
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
        child: RepositoryProvider<Event>(
          create: (context) => widget.eventState,
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
                              BackButton(),
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
                            SizedBox(
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
                                  child:FavoritIcon(),
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
                      EventItems(),
                      SizedBox(
                        height: 20,
                      ),
                      FFButton(
                          onTap: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => Evententry(event:widget.eventState)));
                          },
                          text: 'Jetzt anmelden'),
                      SizedBox(
                        height: 30,
                      ),
                   EventDescription( ),
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
              EventImages(),
                      DividerBouthCorner(
                        color1: Theme.of(context).colorScheme.surfaceVariant,
                        color2: Colors.white,
                      ),
                 EventMaterials(),
                    ],
                  ),
                ),
        ));
  }
}
