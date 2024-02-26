import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vs_femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:vs_femalefellows/helper_functions.dart';
import 'package:vs_femalefellows/models/enums.dart';
import 'package:vs_femalefellows/models/tandem_match.dart';
import 'package:vs_femalefellows/models/user_model.dart';
import 'package:vs_femalefellows/pages/Tandem/TandemMatching/tandem_success.dart';

class TandemUserCard extends StatelessWidget {
  const TandemUserCard({super.key, required this.user});

  final FFUser user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 560,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 220,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    user.location != null ? user.location!.name! : 'Keine Angabe',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(CupertinoIcons.chat_bubble),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: SizedBox(
                                    width: 200,
                                    child: user.languages?.main != null
                                        ? Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('- ${user.languages!.main!.name} (Muttersprache)', style: TextStyle(fontSize: 15)),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: user.languages!.additional!.map((e) => Text('- ${e.name}', style: TextStyle(fontSize: 15))).toList(),
                                              )
                                            ],
                                          )
                                        : Text('Keine Angaben'),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: SizedBox(
                                width: 250,
                                child: Text(
                                  user.aboutMe != null ? '» ${user.aboutMe} «' : '',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                            Text(
                              '- ${user.firstname}, ${HelperFunctions.getAge(user.birthday!)}',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      BlocBuilder<AuthenticationBloc, AuthenticationState>(
                        builder: (context, state) {
                          if (state is AuthenticatedUser) {
                            if (state.userProfile!.tandemMatches != null && state.userProfile!.tandemMatches!.first.requester == user.id) {
                              return Row(
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 2.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          String localId = '';
                                          String newComerId = '';
                                          final profile = state.userProfile;
                                          final Map<String, dynamic> map = <String, dynamic>{};
                                          //map['requested'] = FieldValue.serverTimestamp();
                                          map['state'] = TandemMatchesState.declined;
                                          //map['requester'] = user.id;

                                          if (profile!.localOrNewcomer == LocalOrNewcomer.local) {
                                            localId = profile.id!;
                                            newComerId = user.id!;
                                          } else {
                                            localId = user.id!;
                                            newComerId = profile.id!;
                                          }
                                          final TandemMatch match = TandemMatch(requested: Timestamp.now(), state: TandemMatchesState.declined, requester: profile.id!, local: localId, newcomer: newComerId);
                                          BlocProvider.of<AuthenticationBloc>(context).add(SetTandemMatchEvent(tandemMatch: match, profile: profile));
                                          context.go('/tandem/tandemSuccess');
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(45),
                                            color: Colors.red,
                                          ),
                                          child: Center(
                                              child: Text(
                                            'Match ablehnen',
                                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                                          )),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 2.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          String localId = '';
                                          String newComerId = '';
                                          final profile = state.userProfile;
                                          if (profile!.localOrNewcomer == LocalOrNewcomer.local) {
                                            localId = profile.id!;
                                            newComerId = user.id!;
                                          } else {
                                            localId = user.id!;
                                            newComerId = profile.id!;
                                          }
                                          final TandemMatch match = TandemMatch(requested: Timestamp.now(), state: TandemMatchesState.confirmed, requester: profile.id!, local: localId, newcomer: newComerId);
                                          BlocProvider.of<AuthenticationBloc>(context).add(SetTandemMatchEvent(tandemMatch: match, profile: profile));
                                          context.go('/tandem/tandemSuccess');
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(45),
                                            color: Colors.green,
                                          ),
                                          child: Center(
                                              child: Text(
                                            'Match bestätigen',
                                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                                          )),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return GestureDetector(
                                onTap: () {
                                  String localId = '';
                                  String newComerId = '';
                                  final profile = state.userProfile;
                                  if (profile!.localOrNewcomer == LocalOrNewcomer.local) {
                                    localId = profile.id!;
                                    newComerId = user.id!;
                                  } else {
                                    localId = user.id!;
                                    newComerId = profile.id!;
                                  }
                                  final TandemMatch match = TandemMatch(requested: Timestamp.now(), state: TandemMatchesState.requested, requester: profile.id!, local: localId, newcomer: newComerId);
                                  BlocProvider.of<AuthenticationBloc>(context).add(SetTandemMatchEvent(tandemMatch: match, profile: profile));
                                  context.go('/tandem/tandemSuccess');
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(45),
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                                  child: Center(
                                      child: Text(
                                    'Als Tandem-Partnerin anfragen',
                                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                                  )),
                                ),
                              );
                            }
                          } else {
                            return SizedBox.shrink();
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(45), topLeft: Radius.circular(45)),
                  color: Colors.white,
                  image: user.profilPicture != null && user.profilPicture!.isNotEmpty
                      ? DecorationImage(
                          image: NetworkImage(user.profilPicture != null ? user.profilPicture! : ''),
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        )
                      : DecorationImage(
                          image: AssetImage('lib/images/Mask group2.png'),
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 200, top: 160),
                child: Center(
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: <Widget>[
                      Container(
                        width: 80.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          value: user.tandemMatch,
                          strokeWidth: 4,
                          valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).colorScheme.secondary),
                        ),
                      ),
                      Text(
                        '${(user.tandemMatch! * 100).toInt()}%\nMatch',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
