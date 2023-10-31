import 'package:flutter/material.dart';

class AuthConnect extends StatefulWidget {
  const AuthConnect({super.key});

  @override
  State<AuthConnect> createState() => _AuthConnectState();
}

class _AuthConnectState extends State<AuthConnect> {

  //Checkmark for radio 
 String? question;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Text(
                  'Wie möchtest du dich\ntreffen?',
                  style: TextStyle(
                    color:  Theme.of(context).colorScheme.primary,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('lib/images/Kennenlernene.png'),
                  radius: 100,
                  backgroundColor:  Theme.of(context).colorScheme.secondary,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(children: [
                   RadioListTile(
                    dense: true,
                    title: Text('vor Ort',style: TextStyle(
                    fontSize: 15,
                  ),),
                    value: "vor Ort",
                    groupValue: question,
                    onChanged: (place) {
                      setState(() {
                        question = place ;
                      });
                    }),
                RadioListTile(
                  dense: true,
                    title: Text('Online',style: TextStyle(
                    fontSize: 15,
                  ),),
                    value: "Online",
                    groupValue: question,
                    onChanged: (online) {
                      setState(() {
                        question = online ;
                      });
                    }),
                RadioListTile(
                  dense: true,
                    title: Text('vor Ort & Online',style: TextStyle(
                    fontSize: 15,
                  ),),
                    value: "vor Ort & Online",
                    groupValue: question,
                    onChanged: (placeOnline) {
                      setState(() {
                        question = placeOnline;
                      });
                    }),
              
                ],),
              )
             
            ],
          ),
        ),
      ),
    );
  }
}
