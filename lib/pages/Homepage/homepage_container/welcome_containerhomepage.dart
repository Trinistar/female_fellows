import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vs_femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePageTitle extends StatelessWidget {
  HomePageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 520,
      width: 1000,
      child: Stack(
        children: [
          Container(
            width: 1000,
            height: 380,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(60)),
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (BuildContext context, AuthenticationState state) {
                if (state is AuthenticatedUser) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${AppLocalizations.of(context)!.homeWelcomeTextOne} ${state.userProfile != null ? state.userProfile!.firstname : ''}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                          Text(
                             AppLocalizations.of(context)!.homeWelcomeTextTwo,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        backgroundImage: NetworkImage(state.userProfile!.profilPicture != null ? state.userProfile!.profilPicture! : ''),
                        radius: 25,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                      ),
                    ],
                  );
                } else if (state is UnauthenticatedUser) {
                  return SizedBox.shrink();
                } else if (state is AuthenticationLoading) {
                  return CircularProgressIndicator.adaptive();
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          ),
          Positioned(
            top: 90,
            child: Image.asset('lib/images/handleft.png'),
          ),
          Positioned(
            top: 160,
            left: 200,
            child: Image.asset('lib/images/handright.png'),
          ),
          //pink Container with text
          Positioned(
            top: 230,
            child: Column(
              children: [
                Container(
                  width: 320,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(60),
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: -1,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(),
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                    Container(
                      width: 320,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                        ),
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          //Feathers in pink container
          Positioned(
            top: 250,
            left: 240,
            child: Image.asset('lib/images/federoben.png'),
          ),
          Positioned(
            top: 280,
            left: 210,
            child: Image.asset('lib/images/federlinks.png'),
          ),
          Positioned(
            top: 280,
            left: 270,
            child: Image.asset('lib/images/federrechts.png'),
          ),
          Positioned(
            top: 330,
            left: 280,
            child: Image.asset('lib/images/federunten.png'),
          ),
          Positioned(
            top: 300,
            left: 40,
            child: Text(
              AppLocalizations.of(context)!.homeInfo,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
