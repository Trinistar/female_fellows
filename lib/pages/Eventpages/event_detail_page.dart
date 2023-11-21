import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vs_femalefellows/components/female_fellows_button.dart';
import 'package:vs_femalefellows/pages/Eventpages/EventComponents/color_artbar.dart';
import 'package:vs_femalefellows/pages/Eventpages/EventComponents/participants_image_row.dart';

class DetailEvent extends StatefulWidget {
  const DetailEvent({super.key});

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
                    Row(
                      children: [
                        Text(
                          'Sprachecafé:\nArabisch/Deutsch',
                          style: TextStyle(fontSize: 20),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 120),
                          child: Icon(
                            Icons.favorite_border,
                            size: 35,
                          ),
                        )
                      ],
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
                          'Jeden Mittwoch\n18:30-21:00Uhr',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        )),
                    ListTile(
                        leading: Icon(Icons.person_outline),
                        title: Text(
                          'Female Fellows e.V.',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        )),
                    ListTile(
                      leading: Icon(Icons.location_on_outlined),
                      title: Text(
                        'Stuttgart',
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
                        'Miriam Müller',
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
              FFButton(onTap: null, text: 'Jetzt anmelden'),
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
                    SizedBox(height: 15,),
                    SizedBox(
                      height: 150,
                      width: 350,
                      child: Text(
                          'Unser "Sprachcafé"ist ein informelles und ein-ladendes Event, das den interkulturellen Austausch fördert. Hier kommen Menschen unterschiedlicher Hintergründe und Muttersprachen zusammen, um in entspannter Atmosphäre miteinander ins Gespräch zu kommen. Das "Sprachcafé" bietet eine ideale Gelegenheit, neue Sprachen zu lernen, kulturelle Einblicke zu gewinnen und neue Freundschaften zu schließen. Egal, ob Sie eine neue Sprache erlernen, Ihre Sprachkenntnisse vertiefen oder einfach interessante Gespräche führen möchten – das "Sprachcafé" ist der richtige Ort dafür.',style: TextStyle(fontSize: 15),),
                    ),
                    SizedBox(height: 15,),
                  ],
                ),
              ),
                          Padding(
                            padding: const EdgeInsets.only(left:20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ListTile(leading: Icon(Icons.category_outlined),
                                title: Text('Kategorien'),),
                                
                              ],
                            ),
                          )
            ],
          ),
        ));
  }
}
