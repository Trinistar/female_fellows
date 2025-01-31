import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ActivityTileWidget extends StatelessWidget {
  const ActivityTileWidget({
    super.key,
    required this.assetPath,
    required this.text,
    required this.colorDark,
    required this.route,
  });

  final String assetPath;
  final String text;
  final bool colorDark;
  final String route;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(route),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Stack(
          children: [
            SvgPicture.asset(
              assetPath,
            ),
            Positioned(
              left: 20,
              top: 20,
              right: 20,
              child: Text(
                text,
                style: TextStyle(
                  color: colorDark
                      ? Theme.of(context).colorScheme.primary
                      : Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
