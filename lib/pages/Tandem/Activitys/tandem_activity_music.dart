import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vs_femalefellows/pages/Tandem/Activitys/tandem_coffe.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ActivityMusic extends StatelessWidget {
  const ActivityMusic({super.key});

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
            borderRadius: BorderRadius.all(Radius.circular(40)),
            color: Theme.of(context).colorScheme.secondary,
          ),
          height: 160,
          width: 150,
          child: ClipRRect(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    AppLocalizations.of(context)!.tandemActivityOneTitle,
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.center,
                  ),
                ),
                SvgPicture.asset(
                  'lib/images/event-1.svg',
                  fit: BoxFit.cover,
                  width: 120,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
