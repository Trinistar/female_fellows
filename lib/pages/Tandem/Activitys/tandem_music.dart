import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:html/dom.dart' as htmldoc;
import 'package:html/parser.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vs_femalefellows/statics.dart';

class TandemMusic extends StatefulWidget {
  const TandemMusic({super.key});

  @override
  State<TandemMusic> createState() => _TandemMusicState();
}

class _TandemMusicState extends State<TandemMusic> {
  bool showSteps = false;
  late htmldoc.Document _tandemActivityThreeBody2;
  final List<String> _links = [];

  @override
  void didChangeDependencies() {
    _tandemActivityThreeBody2 = parse(AppLocalizations.of(context)!.tandemActivityThreeBody2(chorusWebsite, laboratoriumWebsite, musikwerkWebsite, kneipchorWebsite));
    var aTags = _tandemActivityThreeBody2.getElementsByTagName('a');
    for (var aTag in aTags) {
      aTag.attributes.forEach((key, value) {
        if (key == 'href') {
          _links.add(value);
        }
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ListView(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  AppLocalizations.of(context)!.tandemActivityThreeTitle,
                  style: TextStyle(fontSize: 30, color: Colors.white),
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
                  AppLocalizations.of(context)!.tandemActivityThreeBody,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Text.rich(
                  TextSpan(
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    children: [
                      TextSpan(text: _tandemActivityThreeBody2.getElementsByTagName('span').first.text),
                      TextSpan(
                        style: TextStyle(fontSize: 15, color: Colors.white, decoration: TextDecoration.underline, decorationColor: Colors.white),
                        text: _tandemActivityThreeBody2.getElementsByTagName('a').first.text,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(Uri.parse(_links[0]));
                          },
                      ),
                      TextSpan(text: _tandemActivityThreeBody2.getElementsByTagName('span')[1].text),
                      TextSpan(
                        style: TextStyle(fontSize: 15, color: Colors.white, decoration: TextDecoration.underline, decorationColor: Colors.white),
                        text: _tandemActivityThreeBody2.getElementsByTagName('a')[1].text,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(Uri.parse(_links[1]));
                          },
                      ),
                      TextSpan(text: _tandemActivityThreeBody2.getElementsByTagName('span')[2].text),
                      TextSpan(
                        style: TextStyle(fontSize: 15, color: Colors.white, decoration: TextDecoration.underline, decorationColor: Colors.white),
                        text: _tandemActivityThreeBody2.getElementsByTagName('a')[2].text,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(Uri.parse(_links[2]));
                          },
                      ),
                      TextSpan(text: _tandemActivityThreeBody2.getElementsByTagName('span')[3].text),
                      TextSpan(
                        style: TextStyle(fontSize: 15, color: Colors.white, decoration: TextDecoration.underline, decorationColor: Colors.white),
                        text: _tandemActivityThreeBody2.getElementsByTagName('a')[3].text,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(Uri.parse(_links[3]));
                          },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  AppLocalizations.of(context)!.tandemActivityThreeBody3,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                SizedBox(
                  height: 50,
                ),
              ])),
        ],
      ),
    );
  }
}
