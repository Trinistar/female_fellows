import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:femalefellows/helper_functions.dart';
import 'package:femalefellows/models/enums.dart';
import 'package:femalefellows/models/user_model.dart';

class TandemUserCard extends StatelessWidget {
  const TandemUserCard({super.key, required this.otherUserProfile});

  final FFUser otherUserProfile;

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
                                    otherUserProfile.location != null ? otherUserProfile.location!.name! : 'Keine Angabe',
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
                                    child: otherUserProfile.languages?.main != null
                                        ? Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('- ${otherUserProfile.languages!.main!.name} (Muttersprache)', style: TextStyle(fontSize: 15)),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: otherUserProfile.languages!.additional!.map((e) => Text('- ${e.name}', style: TextStyle(fontSize: 15))).toList(),
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
                                  otherUserProfile.aboutMe != null ? '» ${otherUserProfile.aboutMe} «' : '',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                            Text(
                              '- ${otherUserProfile.firstname}, ${HelperFunctions.getAge(otherUserProfile.birthday!)}',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      BlocBuilder<AuthenticationBloc, AuthenticationState>(
                        builder: (context, state) {
                          if (state is AuthenticatedUser) {
                            if (state.userProfile!.tandemMatches != null &&
                                state.userProfile!.tandemMatches!.first.requester == otherUserProfile.id &&
                                (state.userProfile!.tandemMatches!.first.state == TandemMatchesState.requested || state.userProfile!.tandemMatches!.first.state == TandemMatchesState.rerequested)) {
                              return Row(
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 2.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          final Map<String, dynamic> update = {};
                                          //update['requested'] = FieldValue.serverTimestamp();
                                          update['state'] = 'declined';
                                          BlocProvider.of<AuthenticationBloc>(context).add(SetTandemMatchEvent(tandemMatch: update, profile: state.userProfile!, otherId: otherUserProfile.id));
                                          //context.go('/tandem/tandemSuccess');
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
                                          final Map<String, dynamic> update = {};
                                          //update['requested'] = FieldValue.serverTimestamp();
                                          update['state'] = 'confirmed';
                                          BlocProvider.of<AuthenticationBloc>(context).add(SetTandemMatchEvent(tandemMatch: update, profile: state.userProfile!, otherId: otherUserProfile.id));
                                          //context.go('/tandem/tandemSuccess');
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
                                    newComerId = otherUserProfile.id!;
                                  } else {
                                    localId = otherUserProfile.id!;
                                    newComerId = profile.id!;
                                  }
                                  //final TandemMatch match = TandemMatch(requested: Timestamp.now(), state: TandemMatchesState.requested, requester: profile.id!, local: localId, newcomer: newComerId);
                                  final Map<String, dynamic> match = {};
                                  match['requested'] = FieldValue.serverTimestamp();
                                  match['state'] = 'requested';
                                  match['requester'] = profile.id!;
                                  match['local'] = localId;
                                  match['newcomer'] = newComerId;
                                  match['enabled'] = true;

                                  BlocProvider.of<AuthenticationBloc>(context).add(SetTandemMatchEvent(tandemMatch: match, profile: profile, otherId: otherUserProfile.id));
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
                  image: otherUserProfile.profilPicture != null && otherUserProfile.profilPicture!.isNotEmpty
                      ? DecorationImage(
                          image: NetworkImage(otherUserProfile.profilPicture != null ? otherUserProfile.profilPicture! : ''),
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
                          value: otherUserProfile.tandemMatch,
                          strokeWidth: 4,
                          valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).colorScheme.secondary),
                        ),
                      ),
                      Text(
                        '${(otherUserProfile.tandemMatch! * 100).toInt()}%\nMatch',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 15,
                top: 15,
                child: IconButton(
                  onPressed: () => _reportDialog(context),
                  icon: Icon(Icons.report),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> _reportDialog(BuildContext context) {
    return showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Profil melden'),
          content: const Text('Möchten Sie dieses Profil wegen unangemessener Inhalte melden?'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Abbrechen'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Melden'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
