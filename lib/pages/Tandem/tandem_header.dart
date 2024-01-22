import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TandemHeader extends StatelessWidget {
  const TandemHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          children: [
            Container(
              height: 150,
              width: double.maxFinite,
              color: Theme.of(context).colorScheme.tertiary,
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: SvgPicture.asset(
                  'lib/images/Jump.svg',
                  alignment: Alignment.bottomRight,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, top: 80),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tandem',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  Divider(
                thickness: 5,
                indent: 0,
                endIndent: 310,
                color: Colors.white,
              ),
                ],
              ),
            ),
          
          ],
        ),
      ],
    );
  }
}
