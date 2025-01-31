import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:femalefellows/pages/Authentication/authentication_entry.dart';
//import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:femalefellows/generated/l10n.dart';

class ThirdStep extends StatefulWidget {
  const ThirdStep({super.key});

  @override
  State<ThirdStep> createState() => _ThirdStepState();
}

class _ThirdStepState extends State<ThirdStep> {
  /* final videoURL =
      "https://www.youtube.com/watch?v=5C6p2DxK6S8&t=32s";
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
  } */

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
                  S.of(context).tandemThirdStep,
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
                  S.of(context).tandemThirdStepBody,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                SizedBox(
                  height: 100,
                ),
                Text(
                  S.of(context).tandemThirdStepNewcomer,
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
                  S.of(context).tandemThirdStepBody2,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                SizedBox(
                  height: 100,
                ),
                Text(
                  S.of(context).tandemThirdStepLocal,
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
           S.of(context).tandemThirdStepBody,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                )
              ],
            ),
          ),
          SizedBox(height: 50,),
          /* Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: YoutubePlayer(controller: _controller,
                  
            onReady: () => debugPrint(S.of(context)!.tandemReady),
            showVideoProgressIndicator: true,),
          ), */
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
                S.of(context).tandemMatchingAngefragtButtonMatching,
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
