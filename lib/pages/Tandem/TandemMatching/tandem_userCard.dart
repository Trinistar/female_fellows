import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vs_femalefellows/helper_functions.dart';
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
                                    user.location != null ? user.location!.name! : '',
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
                                    child: Text(
                                      'Arabisch (Muttersprache), Deutsch (sehr gut), Englisch (sehr gut)',
                                      style: TextStyle(fontSize: 15),
                                    ),
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
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => TandemSuccess()));
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
