import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vs_femalefellows/helper_functions.dart';
import 'package:vs_femalefellows/models/user_model.dart';
import 'package:vs_femalefellows/pages/Tandem/TandemMatching/tandem_success.dart';

class TandemUserCard extends StatefulWidget {
  const TandemUserCard({super.key, required this.user});

  final FFUser user;

  @override
  State<TandemUserCard> createState() => _TandemUserCardState();
}

class _TandemUserCardState extends State<TandemUserCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 170,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 30,
                          ),
                          Text(
                            widget.user.location != null ? widget.user.location!.name! : '',
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'lib/images/chat.svg',
                            width: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 200,
                            child: Text(
                              'Arabisch (Muttersprache), Deutsch (sehr gut), Englisch (sehr gut)',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        width: 250,
                        child: Text(
                          widget.user.aboutMe ?? '',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Text('- ${widget.user.firstname}, ${HelperFunctions.getAge(widget.user.birthday!)}'),
                      SizedBox(
                        height: 50,
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
              // der Container soll das Profil bild Später ersetzen //
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(45), topLeft: Radius.circular(45)),
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage('lib/images/Mask group2.png'),
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 200, top: 100),
                child: Center(
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90), color: Theme.of(context).colorScheme.primary),
                    child: Text(
                      '100%\nMatch',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
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
