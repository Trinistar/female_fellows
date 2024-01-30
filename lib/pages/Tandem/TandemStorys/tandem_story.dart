import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TandemStory extends StatelessWidget {
  const TandemStory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 300,
                color: Colors.green,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 250),
                    child: Container(
                      width: 1000,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            Text(
                              'Erfahrungsbericht von Lisa',
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.tertiary,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Makai & Lisa',
                              style: TextStyle(fontSize: 25),
                            ),
                            Divider(
                              thickness: 3,
                              indent: 0,
                              endIndent: 280,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Ein Tandem mit einer Frau, die aus einem anderen Land stammt, zu haben ist eine bereichernde Erfahrung, die ich nicht mehr missen möchte.Makai hatte zunächst vor allem zum Deutschlernen eine hier beheimatete Frau gesucht. Doch auch das gemeinsame Lernen war meistens schon davon begleitet, dass wir gemeinsam Chai getrunken, etwas gegessen, uns ausgetauscht und viel gemeinsam gelacht haben. Ich finde die Zeit, dass man in Form von interessanten Einblicken, neuen Kontakten und einem ganz praktischen kulturellen Lernen tausendmal zurückbekommt. ',
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    width: 1000,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          width: 250,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(60)),
                          child: SvgPicture.asset(
                            'lib/images/cafe.svg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 300,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(60)),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 300,
                          decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(60)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Es war ein Kennenlernen für uns beide: Nicht nur ich habe Makai Deutsch und etwas über das Leben hier beigebracht– ich konnte von ihr und ihrer Familie auch total viel über Afghanistan, die Lebensweise dort und auch über die Bedingungen für Geflüchtete hier in Deutschland lernen.Ich finde es total wichtig, als Frau andere Frauen darin zu bestärken, alle Möglichkeiten, die wir haben, für sich zu nutzen. Gemeinsam haben wir auch viele Freizeitaktivitäten in Stuttgart unternommen, waren schwimmen, im Park oder der Bücherei. Da konnte ich meine Stadt selbst nochmal mit ganz anderen Augen kennenlernen und zeigen, was ich hier schätze. Der Verein bietet auch mega schöne und vielseitige Aktivitäten für die ganze Gemeinschaft an, in der man eine interessante Zeit mit anderen Frauen verbringen kann.Ich kann nur jede interessierte Frau ermutigen, selbst auch diese sinnvolle Chance zu nutzen und andere Frauen zu unterstützen!',
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(height: 100),
                      ],
                    ),
                  )
                ],
              ),
              BackButton(
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
