import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ImageButton extends StatelessWidget {
  const ImageButton({super.key, this.pagechange});
  final void Function(int)? pagechange;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 250,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 45, right: 45, bottom: 10),
        child: GestureDetector(
          onTap: () {
            pagechange!(0);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              color: Theme.of(context).colorScheme.tertiary,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  AppLocalizations.of(context).homeTandemTeaser,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                Image(
                  image: AssetImage('lib/images/Tandemfind.png'),
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
