import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vs_femalefellows/pages/Authentication/authentication_entry.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ThirdStep extends StatefulWidget {
  const ThirdStep({super.key});

  @override
  State<ThirdStep> createState() => _ThirdStepState();
}

class _ThirdStepState extends State<ThirdStep> {
  final videoURL =
      "https://www.youtube.com/watch?v=dQw4w9WgXcQ&ab_channel=RickAstley";
  late YoutubePlayerController _controller;
  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videoURL);
    _controller= YoutubePlayerController(
      initialVideoId: videoID!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      )
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Theme.of(context).colorScheme.tertiary,
      ),
      body: ListView(
        children: [
          Center(
            child: SvgPicture.asset(
              'lib/images/kennen-lernen.svg',
              width: 150,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 20, right: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '3 | Das Kennenlernen',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                Divider(
                  thickness: 5,
                  indent: 0,
                  endIndent: 280,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Du wohnst schon länger in Deutschland und möchtest dich für ein gutes Zusammenleben ALLER stark machen, und bist an einem kulturellen Austausch interessiert? Dann bist du genau richtig für unser Tandem-Projekt. Wir suchen eine passende Tandem-Partnerin für dich, die deinen kulturellen Horizont erweitern wird und sich im Gegenzug über deine Unterstützung freut. In zusätzlichen monatlichen Gruppenveranstaltungen kannst du dich mit anderen Tandems austauschen und an spannenden Events teilnehmen.',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                SizedBox(
                  height: 100,
                ),
                Text(
                  'Als Newcomerin mitmachen ',
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
                Divider(
                  thickness: 5,
                  indent: 0,
                  endIndent: 280,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Du bist entweder neu in Deutschland oder wohnst schon länger in Deutschland? Du wünschst dir eine Freundin zum Austauschen oder Kontakt zu Frauen, die sich gut in Deutschland und in deiner Umgebung auskennen? Dann bist du genau richtig bei uns! Wir suchen eine passende Tandem-Partnerin für dich, die dir hilft, dich in Deutschland wohlzufühlen. In zusätzlichen monatlichen Gruppenveranstaltungen kannst du dich mit anderen Tandems austauschen und an spannenden Events teilnehmen.',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                SizedBox(
                  height: 100,
                ),
                Text(
                  'Als Local mitmachen:',
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
                Divider(
                  thickness: 5,
                  indent: 0,
                  endIndent: 280,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Du wohnst schon länger in Deutschland und möchtest dich für ein gutes Zusammenleben ALLER stark machen, und bist an einem kulturellen Austausch interessiert? Dann bist du genau richtig für unser Tandem-Projekt. Wir suchen eine passende Tandem-Partnerin für dich, die deinen kulturellen Horizont erweitern wird und sich im Gegenzug über deine Unterstützung freut. In zusätzlichen monatlichen Gruppenveranstaltungen kannst du dich mit anderen Tandems austauschen und an spannenden Events teilnehmen.',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                )
              ],
            ),
          ),
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: YoutubePlayer(controller: _controller,
                  
            onReady: () => debugPrint('Ready'),
            showVideoProgressIndicator: true,),
          ),
          SizedBox(
            height: 100,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => RegistrationEntry()));
            },
            child: Container(
              padding: EdgeInsets.all(25),
              margin: const EdgeInsets.symmetric(horizontal: 50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
              ),
              child: Center(
                  child: Text(
                'Jetzt mit Tandem matchen',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              )),
            ),
          ),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
