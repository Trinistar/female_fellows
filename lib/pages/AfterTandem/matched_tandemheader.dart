import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:femalefellows/models/german_locale.dart';
import 'package:femalefellows/models/user_model.dart';
import 'package:femalefellows/pages/Homepage/homepage_container/homepage_divider.dart';
import 'package:femalefellows/generated/l10n.dart' as intl;

class AfterTandemHeader extends StatelessWidget {
  const AfterTandemHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticatedUser) {
          return _matchedContent(context, state.userProfile!);
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }

  Stack _matchedContent(BuildContext context, FFUser profile) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Column(
          children: [
            Container(
              height: 200,
              width: double.maxFinite,
              color: Theme.of(context).colorScheme.tertiary,
              child: Padding(
                padding: const EdgeInsets.only(left: 40, top: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      intl.S.of(context).tandemAftermatchedTitle,
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    Divider(
                      thickness: 5,
                      indent: 0,
                      endIndent: 300,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            DividerBouthCorner(
                color1: Colors.white,
                color2: Theme.of(context).colorScheme.tertiary),
            if (profile.tandemMatches != null &&
                profile.tandemMatches!.first.otherProfile != null)
              Text(
                '${profile.firstname} & ${profile.tandemMatches!.first.otherProfile!.firstname}',
                style: TextStyle(fontSize: 25),
              ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.supervised_user_circle_sharp),
                Text(
                    'gematched seit ${formatDate(profile.tandemMatches!.first.requested.toDate(), <String>[
                          d,
                          '. ',
                          MM,
                          ' ',
                          yyyy
                        ], locale: GermanLocale())}'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: MaterialButton(
                onPressed: null,
                child: Text('Kontaktdaten anzeigen'),
              ),
            ),
            MaterialButton(
              onPressed: null,
              child: Text('Match auflösen'),
            ),
          ],
        ),
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 160),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 90),
                      child: CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 90),
                      child: CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 160),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 90),
                      child: profile.profilPicture != null &&
                              profile.profilPicture!.isNotEmpty
                          ? CircleAvatar(
                              backgroundImage:
                                  NetworkImage(profile.profilPicture!),
                              radius: 55,
                              backgroundColor: Colors.white,
                            )
                          : CircleAvatar(
                              backgroundImage:
                                  AssetImage('lib/images/ImageIcon.png'),
                              radius: 55,
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 90),
                      child:
                          profile.tandemMatches!.first.otherProfile != null &&
                                  profile.tandemMatches!.first.otherProfile!
                                      .profilPicture!.isNotEmpty
                              ? CircleAvatar(
                                  backgroundImage: NetworkImage(profile
                                      .tandemMatches!
                                      .first
                                      .otherProfile!
                                      .profilPicture!),
                                  radius: 55,
                                  backgroundColor: Colors.white,
                                )
                              : CircleAvatar(
                                  backgroundImage:
                                      AssetImage('lib/images/ImageIcon.png'),
                                  radius: 55,
                                  backgroundColor:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
