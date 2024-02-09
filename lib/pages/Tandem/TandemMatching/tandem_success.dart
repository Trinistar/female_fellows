import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vs_femalefellows/pages/Tandem/tandem.dart';

class TandemSuccess extends StatelessWidget {
  const TandemSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      appBar: AppBar(
        toolbarHeight: 30,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Theme.of(context).colorScheme.tertiary,
      ),
      body: ListView(children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                  child: SvgPicture.asset(
                'lib/images/Jump.svg',
                width: 250,
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60)),
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Center(
                          child: CircleAvatar(
                        minRadius: 80,
                      )),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Bitte habe etwas Geduld',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Es kann bis zu 24 Stunden dauern, dass dem Match zugestimmt wird. Du wirst per E-Mail und in der App eine Nachricht bekommen, ob die Matching-Anfrage zustande gekommen ist. Falls es nicht geklappt hat bekommst du deine drei neuen best Matches vorgeschlagen.',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.pop();
                      },
                      child: Container(
                        padding: EdgeInsets.all(25),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        child: Center(
                            child: Text(
                          'Jetzt mit Tandem matchen',
                          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ]),
                ),
              ),
            )
          ],
        ),
      ]),
    );
  }
}
