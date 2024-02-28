import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vs_femalefellows/pages/Tandem/Activitys/tandem_coffe.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ActivityPicnic extends StatelessWidget {
  const ActivityPicnic({super.key});

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
          ),
          height: 160,
          width: 150,
          child: ClipRRect(
            child: SvgPicture.asset(
              'lib/images/picknicken.svg',
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
