import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:femalefellows/generated/l10n.dart';
import 'package:html/parser.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:femalefellows/statics.dart';
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
  late htmldoc.Document _tandemActivityFiveBody12;
  final List<String> _links12 = [];
  late htmldoc.Document _tandemActivityFiveBody13;
  final List<String> _links13 = [];
  late htmldoc.Document _tandemActivityFiveBody14;
  final List<String> _links14 = [];
  late htmldoc.Document _tandemActivityFiveBody15;
  final List<String> _links15 = [];

  @override
  void didChangeDependencies() {
    _tandemActivityFiveBody2 = parse(S.of(context).tandemActivityFiveBody2(fernsehturmWebsite, waldauWebsite));
    var aTag2 = _tandemActivityFiveBody2.getElementsByTagName('a');
    for (var aTag in aTag2) {
      aTag.attributes.forEach((key, value) {
        if (key == 'href') {
          _links2.add(value);
        }
      });
    }
    _tandemActivityFiveBody3 = parse(S.of(context).tandemActivityFiveBody3(kraehenwaldWebsite));
    var aTags3 = _tandemActivityFiveBody3.getElementsByTagName('a');
    for (var aTag in aTags3) {
      aTag.attributes.forEach((key, value) {
        if (key == 'href') {
          _links3.add(value);
        }
      });
    }
    _tandemActivityFiveBody4 = parse(S.of(context).tandemActivityFiveBody4(bismarckturmWebsite));
    var aTags4 = _tandemActivityFiveBody4.getElementsByTagName('a');
    for (var aTag in aTags4) {
      aTag.attributes.forEach((key, value) {
        if (key == 'href') {
          _links4.add(value);
        }
      });
    }
    _tandemActivityFiveBody5 = parse(S.of(context).tandemActivityFiveBody5(killesberparkWebsite));
    var aTags5 = _tandemActivityFiveBody5.getElementsByTagName('a');
    for (var aTag in aTags5) {
      aTag.attributes.forEach((key, value) {
        if (key == 'href') {
          _links5.add(value);
        }
      });
    }
    _tandemActivityFiveBody6 = parse(S.of(context).tandemActivityFiveBody6(kriegsbergturmWebsite));
    var aTags6 = _tandemActivityFiveBody6.getElementsByTagName('a');
    for (var aTag in aTags6) {
      aTag.attributes.forEach((key, value) {
        if (key == 'href') {
          _links6.add(value);
        }
      });
    }
    _tandemActivityFiveBody7 = parse(S.of(context).tandemActivityFiveBody7(kriegsbergturmWebsite, chinesischegartenWebsite));
    var aTags7 = _tandemActivityFiveBody7.getElementsByTagName('a');
    for (var aTag in aTags7) {
      aTag.attributes.forEach((key, value) {
        if (key == 'href') {
          _links7.add(value);
        }
      });
    }
    _tandemActivityFiveBody10 = parse(S.of(context).tandemActivityFiveBody10(zackeWebsite));
    var aTags10 = _tandemActivityFiveBody10.getElementsByTagName('a');
    for (var aTag in aTags10) {
      aTag.attributes.forEach((key, value) {
        if (key == 'href') {
          _links10.add(value);
        }
      });
    }
    _tandemActivityFiveBody11 = parse(S.of(context).tandemActivityFiveBody11(ausblickeWebsite, siebenmuehlentalWebsite, grabkapelleWebsite, solitudeWebsite));
    var aTags11 = _tandemActivityFiveBody11.getElementsByTagName('a');
    for (var aTag in aTags11) {
      aTag.attributes.forEach((key, value) {
        if (key == 'href') {
          _links11.add(value);
        }
      });
    }
    _tandemActivityFiveBody12 = parse(S.of(context).tandemActivityFiveBody12(besigheimWebsite));
    var aTags12 = _tandemActivityFiveBody12.getElementsByTagName('a');
    for (var aTag in aTags12) {
      aTag.attributes.forEach((key, value) {
        if (key == 'href') {
          _links12.add(value);
        }
      });
    }
    _tandemActivityFiveBody13 = parse(S.of(context).tandemActivityFiveBody13(kapelleWebsite));
    var aTags13 = _tandemActivityFiveBody13.getElementsByTagName('a');
    for (var aTag in aTags13) {
      aTag.attributes.forEach((key, value) {
        if (key == 'href') {
          _links13.add(value);
        }
      });
    }
    _tandemActivityFiveBody14 = parse(S.of(context).tandemActivityFiveBody14(badurachWebsite));
    var aTags14 = _tandemActivityFiveBody14.getElementsByTagName('a');
    for (var aTag in aTags14) {
      aTag.attributes.forEach((key, value) {
        if (key == 'href') {
          _links14.add(value);
        }
      });
    }
    _tandemActivityFiveBody15 = parse(S.of(context).tandemActivityFiveBody15(femaleFellowsMail));
    var aTags15 = _tandemActivityFiveBody15.getElementsByTagName('a');
    for (var aTag in aTags15) {
      aTag.attributes.forEach((key, value) {
        if (key == 'href') {
          _links15.add(value);
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
                  S.of(context).tandemActivityFiveTitle,
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
                  S.of(context).tandemActivityFiveBody,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Text.rich(
                  TextSpan(
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    children: [
                      TextSpan(text: _tandemActivityFiveBody2.getElementsByTagName('span').isNotEmpty ? _tandemActivityFiveBody2.getElementsByTagName('span').first.text : ''),
                      TextSpan(
                        style: TextStyle(fontSize: 15, color: Colors.white, decoration: TextDecoration.underline, decorationColor: Colors.white),
                        text: _tandemActivityFiveBody2.getElementsByTagName('a').first.text,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(Uri.parse(_links2[0]));
                          },
                      ),
                      TextSpan(text: _tandemActivityFiveBody2.getElementsByTagName('span').isNotEmpty ? _tandemActivityFiveBody2.getElementsByTagName('span')[1].text : ''),
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
                      TextSpan(text: _tandemActivityFiveBody3.getElementsByTagName('span').isNotEmpty ? _tandemActivityFiveBody3.getElementsByTagName('span').first.text : ''),
                      TextSpan(
                        style: TextStyle(fontSize: 15, color: Colors.white, decoration: TextDecoration.underline, decorationColor: Colors.white),
                        text: _tandemActivityFiveBody3.getElementsByTagName('a').first.text,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(Uri.parse(_links3[0]));
                          },
                      ),
                      TextSpan(text: _tandemActivityFiveBody3.getElementsByTagName('span').isNotEmpty ? _tandemActivityFiveBody3.getElementsByTagName('span')[1].text : ''),
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
                      TextSpan(text: _tandemActivityFiveBody4.getElementsByTagName('span').isNotEmpty ? _tandemActivityFiveBody4.getElementsByTagName('span').first.text : ''),
                      TextSpan(
                        style: TextStyle(fontSize: 15, color: Colors.white, decoration: TextDecoration.underline, decorationColor: Colors.white),
                        text: _tandemActivityFiveBody4.getElementsByTagName('a').first.text,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(Uri.parse(_links4[0]));
                          },
                      ),
                      TextSpan(text: _tandemActivityFiveBody4.getElementsByTagName('span').isNotEmpty ? _tandemActivityFiveBody4.getElementsByTagName('span')[1].text : ''),
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
                      TextSpan(text: _tandemActivityFiveBody5.getElementsByTagName('span').isNotEmpty ? _tandemActivityFiveBody5.getElementsByTagName('span').first.text : ''),
                      TextSpan(
                        style: TextStyle(fontSize: 15, color: Colors.white, decoration: TextDecoration.underline, decorationColor: Colors.white),
                        text: _tandemActivityFiveBody5.getElementsByTagName('a').first.text,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(Uri.parse(_links5[0]));
                          },
                      ),
                      TextSpan(text: _tandemActivityFiveBody5.getElementsByTagName('span').isNotEmpty ? _tandemActivityFiveBody5.getElementsByTagName('span')[1].text : ''),
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
                      TextSpan(text: _tandemActivityFiveBody6.getElementsByTagName('span').isNotEmpty ? _tandemActivityFiveBody6.getElementsByTagName('span').first.text : ''),
                      TextSpan(
                        style: TextStyle(fontSize: 15, color: Colors.white, decoration: TextDecoration.underline, decorationColor: Colors.white),
                        text: _tandemActivityFiveBody6.getElementsByTagName('a').first.text,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(Uri.parse(_links6[0]));
                          },
                      ),
                      TextSpan(text: _tandemActivityFiveBody6.getElementsByTagName('span').isNotEmpty ? _tandemActivityFiveBody6.getElementsByTagName('span')[1].text : ''),
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
                      TextSpan(text: _tandemActivityFiveBody7.getElementsByTagName('span').isNotEmpty ? _tandemActivityFiveBody7.getElementsByTagName('span').first.text : ''),
                      TextSpan(
                        style: TextStyle(fontSize: 15, color: Colors.white, decoration: TextDecoration.underline, decorationColor: Colors.white),
                        text: _tandemActivityFiveBody7.getElementsByTagName('a').first.text,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(Uri.parse(_links7[0]));
                          },
                      ),
                      TextSpan(text: _tandemActivityFiveBody7.getElementsByTagName('span').isNotEmpty ? _tandemActivityFiveBody7.getElementsByTagName('span')[1].text : ''),
                      TextSpan(
                        style: TextStyle(fontSize: 15, color: Colors.white, decoration: TextDecoration.underline, decorationColor: Colors.white),
                        text: _tandemActivityFiveBody7.getElementsByTagName('a')[1].text,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(Uri.parse(_links7[1]));
                          },
                      ),
                      TextSpan(text: _tandemActivityFiveBody7.getElementsByTagName('span').isNotEmpty ? _tandemActivityFiveBody7.getElementsByTagName('span')[2].text : ''),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  S.of(context).tandemActivityFiveBody8,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  S.of(context).tandemActivityFiveBody9,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Text.rich(
                  TextSpan(
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    children: [
                      TextSpan(text: _tandemActivityFiveBody10.getElementsByTagName('span').isNotEmpty ? _tandemActivityFiveBody10.getElementsByTagName('span').first.text : ''),
                      TextSpan(
                        style: TextStyle(fontSize: 15, color: Colors.white, decoration: TextDecoration.underline, decorationColor: Colors.white),
                        text: _tandemActivityFiveBody10.getElementsByTagName('a').first.text,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(Uri.parse(_links10[0]));
                          },
                      ),
                      TextSpan(text: _tandemActivityFiveBody10.getElementsByTagName('span').isNotEmpty ? _tandemActivityFiveBody10.getElementsByTagName('span')[1].text : ''),
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
                      TextSpan(text: _tandemActivityFiveBody11.getElementsByTagName('span').isNotEmpty ? _tandemActivityFiveBody11.getElementsByTagName('span').first.text : ''),
                      TextSpan(
                        style: TextStyle(fontSize: 15, color: Colors.white, decoration: TextDecoration.underline, decorationColor: Colors.white),
                        text: _tandemActivityFiveBody11.getElementsByTagName('a').first.text,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(Uri.parse(_links11[0]));
                          },
                      ),
                      TextSpan(text: _tandemActivityFiveBody11.getElementsByTagName('span').isNotEmpty ? _tandemActivityFiveBody11.getElementsByTagName('span')[1].text : ''),
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
                      TextSpan(text: _tandemActivityFiveBody11.getElementsByTagName('span').isNotEmpty ? _tandemActivityFiveBody11.getElementsByTagName('span')[2].text : ''),
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
                SizedBox(
                  height: 10,
                ),
                Text.rich(
                  TextSpan(
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    children: [
                      TextSpan(text: _tandemActivityFiveBody12.getElementsByTagName('span').isNotEmpty ? _tandemActivityFiveBody12.getElementsByTagName('span').first.text : ''),
                      TextSpan(
                        style: TextStyle(fontSize: 15, color: Colors.white, decoration: TextDecoration.underline, decorationColor: Colors.white),
                        text: _tandemActivityFiveBody12.getElementsByTagName('a').first.text,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(Uri.parse(_links12[0]));
                          },
                      ),
                      TextSpan(text: _tandemActivityFiveBody12.getElementsByTagName('span').isNotEmpty ? _tandemActivityFiveBody12.getElementsByTagName('span')[1].text : ''),
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
                      TextSpan(text: _tandemActivityFiveBody13.getElementsByTagName('span').isNotEmpty ? _tandemActivityFiveBody13.getElementsByTagName('span').first.text : ''),
                      TextSpan(
                        style: TextStyle(fontSize: 15, color: Colors.white, decoration: TextDecoration.underline, decorationColor: Colors.white),
                        text: _tandemActivityFiveBody13.getElementsByTagName('a').first.text,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(Uri.parse(_links13[0]));
                          },
                      ),
                      TextSpan(text: _tandemActivityFiveBody13.getElementsByTagName('span').isNotEmpty ? _tandemActivityFiveBody13.getElementsByTagName('span')[1].text : ''),
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
                      TextSpan(text: _tandemActivityFiveBody14.getElementsByTagName('span').isNotEmpty ? _tandemActivityFiveBody14.getElementsByTagName('span').first.text : ''),
                      TextSpan(
                        style: TextStyle(fontSize: 15, color: Colors.white, decoration: TextDecoration.underline, decorationColor: Colors.white),
                        text: _tandemActivityFiveBody14.getElementsByTagName('a').first.text,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(Uri.parse(_links14[0]));
                          },
                      ),
                      TextSpan(text: _tandemActivityFiveBody14.getElementsByTagName('span').isNotEmpty ? _tandemActivityFiveBody14.getElementsByTagName('span')[1].text : ''),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  S.of(context).tandemActivityFiveBody15(femaleFellowsMail),
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
