import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class _EventNotAuthenticatedState extends StatefulWidget {
  const _EventNotAuthenticatedState({super.key});

  @override
  State<_EventNotAuthenticatedState> createState() => __EventNotAuthenticatedStateState();
}

class __EventNotAuthenticatedStateState extends State<_EventNotAuthenticatedState> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).colorScheme.surface,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 150,
              width: 1000,
              color: Theme.of(context).colorScheme.surface,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 60, top: 25),
                    child: Image.asset('lib/images/FF-Logo_blau-1.png',
                        height: 80, alignment: Alignment(0, -0.8)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      left: 50,
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.authenticationTitle,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
         
          ],
        ),
      ),
    );
  }
}
