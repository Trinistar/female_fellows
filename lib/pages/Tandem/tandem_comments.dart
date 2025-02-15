import 'package:flutter/material.dart';
import 'package:femalefellows/generated/l10n.dart';


class TandemComments extends StatelessWidget {
  const TandemComments({super.key});

  @override
  Widget build(BuildContext context) {
    return      Container(
            color: Theme.of(context).colorScheme.tertiary,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('lib/images/fariba.png'),
                        radius: 50,
                        backgroundColor: Theme.of(context).colorScheme.secondary,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                          width: 250,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                              S.of(context).tandemQuotesOne,
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                                Text(
                                '-Fabria, Stuttgart',
                                style: TextStyle(color: Colors.white, fontSize: 15),
                              ),
                              
                            ],
                          )),
                    ],
                  ),
                  SizedBox(height: 50,),
                          Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('lib/images/anna.png'),
                        radius: 50,
                        backgroundColor: Theme.of(context).colorScheme.secondary,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                          width: 250,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                S.of(context).tandemQuotesTwo,
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                                Text(
                                '-Anna, Stuttgart',
                                style: TextStyle(color: Colors.white, fontSize: 15),
                              ),
                              
                            ],
                          )),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}