import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FemPower extends StatelessWidget {
  const FemPower({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).colorScheme.secondary,
      ),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.only(left: 300),
                      child: FloatingActionButton(
                        elevation: 0,
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          mini: true,
                          child: Icon(
                            Icons.cancel_outlined,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ),
                    Text(
                      'Fempowerment',
                      style: TextStyle(fontSize: 20),
                    ),
                    Divider(
                      color: Theme.of(context).colorScheme.primary,
                      thickness: 5,
                      endIndent: 310,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      child: SizedBox(
                        height: 420,
                        width: 320,
                        child: Text(
                          'Laut einer aktuellen Studie der OECD werden weibliche Geflüchtete schlechter in die deutsche Gesellschaft integriert. Grund hierfür ist die geringe Teilnahme an Integrationsangeboten und wenig Kontakt zu Einheimischen. Nur 12% der geflüchteten Frauen in Deutschland haben täglich Kontakt zu Einheimischen. Female Fellows möchte diesem Phänomen durch das Tandemprojekt entgegenwirken und einen großen ersten Schritt hin zu einem gelungenen Miteinander machen. Das Tandemprojekt ermöglicht und fördert darüber hinaus den kulturellen Austausch.Diese Frauen haben das Potenzial, die Kapazität und die Fähigkeit zum Handeln! Es geht darum, das Potenzial der Frauen zu nutzen, sie stark zu machen und zu ermutigen!',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 72),
                      child: Image.asset('lib/images/kugeln.png'),
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
