import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:html/parser.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vs_femalefellows/statics.dart';
import 'package:html/dom.dart' as htmldoc;

class TandemGreen extends StatefulWidget {
  const TandemGreen({super.key});

  @override
  State<TandemGreen> createState() => _TandemGreenState();
}

class _TandemGreenState extends State<TandemGreen> {
  bool showSteps = false;
  late htmldoc.Document _tandemActivityFiveBody2;
  final List<String> _links2 = [];
  late htmldoc.Document _tandemActivityFiveBody3;
  final List<String> _links3 = [];
  late htmldoc.Document _tandemActivityFiveBody4;
  final List<String> _links4 = [];
  late htmldoc.Document _tandemActivityFiveBody5;
  final List<String> _links5 = [];
  late htmldoc.Document _tandemActivityFiveBody6;
  final List<String> _links6 = [];
    late htmldoc.Document _tandemActivityFiveBody7;
  final List<String> _links7 = [];
    late htmldoc.Document _tandemActivityFiveBody10;
  final List<String> _links10 = [];
    late htmldoc.Document _tandemActivityFiveBody11;
  final List<String> _links11 = [];

  @override
  void didChangeDependencies() {
    _tandemActivityFiveBody2 = parse(AppLocalizations.of(context)!.tandemActivityFiveBody2(fernsehturmWebsite, waldauWebsite));
    var aTag2 = _tandemActivityFiveBody2.getElementsByTagName('a');
    for (var aTag in aTag2) {
      aTag.attributes.forEach((key, value) {
        if (key == 'href') {
          _links2.add(value);
        }
      });
    }
    _tandemActivityFiveBody3 = parse(AppLocalizations.of(context)!.tandemActivityFiveBody3(kraehenwaldWebsite));
    var aTags3 = _tandemActivityFiveBody3.getElementsByTagName('a');
    for (var aTag in aTags3) {
      aTag.attributes.forEach((key, value) {
        if (key == 'href') {
          _links3.add(value);
        }
      });
    }
    _tandemActivityFiveBody4 = parse(AppLocalizations.of(context)!.tandemActivityFiveBody4(bismarckturmWebsite));
    var aTags4 = _tandemActivityFiveBody4.getElementsByTagName('a');
    for (var aTag in aTags4) {
      aTag.attributes.forEach((key, value) {
        if (key == 'href') {
          _links4.add(value);
        }
      });
    }
    _tandemActivityFiveBody5 = parse(AppLocalizations.of(context)!.tandemActivityFiveBody5(killesberparkWebsite));
    var aTags5 = _tandemActivityFiveBody5.getElementsByTagName('a');
    for (var aTag in aTags5) {
      aTag.attributes.forEach((key, value) {
        if (key == 'href') {
          _links5.add(value);
        }
      });
    }
    _tandemActivityFiveBody6 = parse(AppLocalizations.of(context)!.tandemActivityFiveBody6(kriegsbergturmWebsite));
    var aTags6 = _tandemActivityFiveBody6.getElementsByTagName('a');
    for (var aTag in aTags6) {
      aTag.attributes.forEach((key, value) {
        if (key == 'href') {
          _links6.add(value);
        }
      });
    }
    _tandemActivityFiveBody7 = parse(AppLocalizations.of(context)!.tandemActivityFiveBody7(kriegsbergturmWebsite, chinesischegartenWebsite));
    var aTags7 = _tandemActivityFiveBody7.getElementsByTagName('a');
    for (var aTag in aTags7) {
      aTag.attributes.forEach((key, value) {
        if (key == 'href') {
          _links7.add(value);
        }
      });
    }
    _tandemActivityFiveBody10 = parse(AppLocalizations.of(context)!.tandemActivityFiveBody10(zackeWebsite));
    var aTags10 = _tandemActivityFiveBody10.getElementsByTagName('a');
    for (var aTag in aTags10) {
      aTag.attributes.forEach((key, value) {
        if (key == 'href') {
          _links10.add(value);
        }
      });
    }
    _tandemActivityFiveBody11 = parse(AppLocalizations.of(context)!.tandemActivityFiveBody11(ausblickeWebsite, siebenmuehlentalWebsite, grabkapelleWebsite, solitudeWebsite));
    var aTags11 = _tandemActivityFiveBody11.getElementsByTagName('a');
    for (var aTag in aTags11) {
      aTag.attributes.forEach((key, value) {
        if (key == 'href') {
          _links11.add(value);
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
                  AppLocalizations.of(context)!.tandemActivityFiveTitle,
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
                  AppLocalizations.of(context)!.tandemActivityFiveBody,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Text.rich(
                  TextSpan(
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    children: [
                      TextSpan(text: _tandemActivityFiveBody2.getElementsByTagName('span').first.text),
                      TextSpan(
                        style: TextStyle(fontSize: 15, color: Colors.white, decoration: TextDecoration.underline, decorationColor: Colors.white),
                        text: _tandemActivityFiveBody2.getElementsByTagName('a').first.text,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(Uri.parse(_links2[0]));
                          },
                      ),
                      TextSpan(text: _tandemActivityFiveBody2.getElementsByTagName('span')[1].text),
                      TextSpan(
                        style: TextStyle(fontSize: 15, color: Colors.white, decoration: TextDecoration.underline, decorationColor: Colors.white),
                        text: _tandemActivityFiveBody2.getElementsByTagName('a')[1].text,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(Uri.parse(_links2[1]));
                          },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text.rich(
                  TextSpan(
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    children: [
                      TextSpan(text: _tandemActivityFiveBody3.getElementsByTagName('span').first.text),
                      TextSpan(
                        style: TextStyle(fontSize: 15, color: Colors.white, decoration: TextDecoration.underline, decorationColor: Colors.white),
                        text: _tandemActivityFiveBody3.getElementsByTagName('a').first.text,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(Uri.parse(_links3[0]));
                          },
                      ),
                      TextSpan(text: _tandemActivityFiveBody3.getElementsByTagName('span')[1].text),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text.rich(
                  TextSpan(
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    children: [
                      TextSpan(text: _tandemActivityFiveBody4.getElementsByTagName('span').first.text),
                      TextSpan(
                        style: TextStyle(fontSize: 15, color: Colors.white, decoration: TextDecoration.underline, decorationColor: Colors.white),
                        text: _tandemActivityFiveBody4.getElementsByTagName('a').first.text,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(Uri.parse(_links4[0]));
                          },
                      ),
                      TextSpan(text: _tandemActivityFiveBody4.getElementsByTagName('span')[1].text),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text.rich(
                  TextSpan(
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    children: [
                      TextSpan(text: _tandemActivityFiveBody5.getElementsByTagName('span').first.text),
                      TextSpan(
                        style: TextStyle(fontSize: 15, color: Colors.white, decoration: TextDecoration.underline, decorationColor: Colors.white),
                        text: _tandemActivityFiveBody5.getElementsByTagName('a').first.text,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(Uri.parse(_links5[0]));
                          },
                      ),
                      TextSpan(text: _tandemActivityFiveBody5.getElementsByTagName('span')[1].text),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text.rich(
                  TextSpan(
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    children: [
                      TextSpan(text: _tandemActivityFiveBody6.getElementsByTagName('span').first.text),
                      TextSpan(
                        style: TextStyle(fontSize: 15, color: Colors.white, decoration: TextDecoration.underline, decorationColor: Colors.white),
                        text: _tandemActivityFiveBody6.getElementsByTagName('a').first.text,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(Uri.parse(_links6[0]));
                          },
                      ),
                      TextSpan(text: _tandemActivityFiveBody6.getElementsByTagName('span')[1].text),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text.rich(
                  TextSpan(
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    children: [
                      TextSpan(text: _tandemActivityFiveBody7.getElementsByTagName('span').first.text),
                      TextSpan(
                        style: TextStyle(fontSize: 15, color: Colors.white, decoration: TextDecoration.underline, decorationColor: Colors.white),
                        text: _tandemActivityFiveBody7.getElementsByTagName('a').first.text,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(Uri.parse(_links7[0]));
                          },
                      ),
                      TextSpan(text: _tandemActivityFiveBody7.getElementsByTagName('span')[1].text),
                      TextSpan(
                        style: TextStyle(fontSize: 15, color: Colors.white, decoration: TextDecoration.underline, decorationColor: Colors.white),
                        text: _tandemActivityFiveBody7.getElementsByTagName('a')[1].text,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(Uri.parse(_links7[1]));
                          },
                      ),
                      TextSpan(text: _tandemActivityFiveBody7.getElementsByTagName('span')[2].text),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  AppLocalizations.of(context)!.tandemActivityFiveBody8,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  AppLocalizations.of(context)!.tandemActivityFiveBody9,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Text.rich(
                  TextSpan(
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    children: [
                      TextSpan(text: _tandemActivityFiveBody10.getElementsByTagName('span').first.text),
                      TextSpan(
                        style: TextStyle(fontSize: 15, color: Colors.white, decoration: TextDecoration.underline, decorationColor: Colors.white),
                        text: _tandemActivityFiveBody10.getElementsByTagName('a').first.text,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(Uri.parse(_links10[0]));
                          },
                      ),
                      TextSpan(text: _tandemActivityFiveBody10.getElementsByTagName('span')[1].text),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text.rich(
                  TextSpan(
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    children: [
                      TextSpan(text: _tandemActivityFiveBody11.getElementsByTagName('span').first.text),
                      TextSpan(
                        style: TextStyle(fontSize: 15, color: Colors.white, decoration: TextDecoration.underline, decorationColor: Colors.white),
                        text: _tandemActivityFiveBody11.getElementsByTagName('a').first.text,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(Uri.parse(_links11[0]));
                          },
                      ),
                      TextSpan(text: _tandemActivityFiveBody11.getElementsByTagName('span')[1].text),
                      TextSpan(
                        style: TextStyle(fontSize: 15, color: Colors.white, decoration: TextDecoration.underline, decorationColor: Colors.white),
                        text: _tandemActivityFiveBody11.getElementsByTagName('a')[1].text,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(Uri.parse(_links11[1]));
                          },
                      ),
                      TextSpan(text: ' '),
                      TextSpan(
                        style: TextStyle(fontSize: 15, color: Colors.white, decoration: TextDecoration.underline, decorationColor: Colors.white),
                        text: _tandemActivityFiveBody11.getElementsByTagName('a')[2].text,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(Uri.parse(_links11[2]));
                          },
                      ),
                      TextSpan(text: _tandemActivityFiveBody11.getElementsByTagName('span')[2].text),
                      TextSpan(
                        style: TextStyle(fontSize: 15, color: Colors.white, decoration: TextDecoration.underline, decorationColor: Colors.white),
                        text: _tandemActivityFiveBody11.getElementsByTagName('a')[3].text,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(Uri.parse(_links11[3]));
                          },
                      ),
                    ],
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.tandemActivityFiveBody11(ausblickeWebsite, siebenmuehlentalWebsite, grabkapelleWebsite, solitudeWebsite),
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  AppLocalizations.of(context)!.tandemActivityFiveBody12(besigheimWebsite),
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  AppLocalizations.of(context)!.tandemActivityFiveBody13(kapelleWebsite),
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  AppLocalizations.of(context)!.tandemActivityFiveBody14(badurachWebsite),
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  AppLocalizations.of(context)!.tandemActivityFiveBody15(femaleFellowsMail),
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
