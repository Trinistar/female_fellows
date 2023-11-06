import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vs_femalefellows/components/login_button.dart';
import 'package:vs_femalefellows/pages/Homepage/homepage.dart';

class EmailCheck extends StatefulWidget {
  const EmailCheck({super.key});

  @override
  State<EmailCheck> createState() => _EmailCheckState();
}

class _EmailCheckState extends State<EmailCheck> {
  final user = FirebaseAuth.instance.currentUser!;
  bool emailVerified = false;
  @override
  void initState(){
    super.initState();
    emailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!emailVerified){
      sendVerification();
    }
  }
  Future sendVerification()async{
    try{
final user = FirebaseAuth.instance.currentUser!;
    await user.sendEmailVerification();
    }catch (e){
     return null;
    }
  }


  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).colorScheme.surface,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: emailVerified
            ? Column(
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
                          child: Image.asset('lib/images/Empowerment 1.png',
                              height: 80, alignment: Alignment(0, -0.8)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 15,
                            left: 50,
                          ),
                          child: Text('Herzlichen Glückwunsch,\n${user.email!}\nbist jetzt ein\nFemale Fellows Mitglied.'),
                        ),
                        LoginButton(onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Home(),
                    ));
                  }
                        , text: 'Jetzt Starten')
                      ],
                    ),
                  )
                ],
              )
            : Column(
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
                          child: Text('Dir wurde eine Email an\n${user.email!} gesendet,\nbitte klick auf den Link\num dich zu verifizieren'),
                        ),
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
