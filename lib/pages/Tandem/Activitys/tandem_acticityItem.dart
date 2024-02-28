import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vs_femalefellows/pages/Tandem/Activitys/tandem_coffe.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ActivityCofe extends StatelessWidget {
  const ActivityCofe({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => TandemCoffe()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage('lib/images/CafePng.png')),
            borderRadius: BorderRadius.all(Radius.circular(40)),
          ),
          height: 160,
          width: 150,
        ),
      ),
    );
  }
}
