import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:femalefellows/generated/l10n.dart';

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
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: <Widget>[
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: CircularProgressIndicator(
                                strokeCap: StrokeCap.round,
                                backgroundColor: Colors.grey[100],
                                value: 1,
                                strokeWidth: 8,
                                valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).colorScheme.secondary),
                              ),
                            ),
                            Text(
                              '24 h',
                              style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        S.of(context).tandemMatchingAngefragtTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      S.of(context).tandemMatchingAngefragtBody,
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
                          S.of(context).tandemMatchingAngefragtButtonMatching,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
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
