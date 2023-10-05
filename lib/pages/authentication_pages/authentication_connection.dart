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
                    color: Color.fromRGBO(27, 25, 86, 1),
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
                  backgroundColor: Color.fromRGBO(252, 208, 220, 1),
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
                    onChanged: (newValue) {
                      setState(() {
                        question = newValue ;
                      });
                    }),
                RadioListTile(
                  dense: true,
                    title: Text('Online',style: TextStyle(
                    fontSize: 15,
                  ),),
                    value: "Online",
                    groupValue: question,
                    onChanged: ( newValue) {
                      setState(() {
                        question = newValue ;
                      });
                    }),
                RadioListTile(
                  dense: true,
                    title: Text('vor Ort & Online',style: TextStyle(
                    fontSize: 15,
                  ),),
                    value: "vor Ort & Online",
                    groupValue: question,
                    onChanged: (newValue) {
                      setState(() {
                        question = newValue;
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
