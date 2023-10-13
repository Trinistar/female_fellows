import 'package:flutter/material.dart';
import 'package:vs_femalefellows/components/text_bar.dart';

class AuthPlace extends StatefulWidget {
  const AuthPlace({super.key});

  @override
  State<AuthPlace> createState() => _AuthPlaceState();
}

class _AuthPlaceState extends State<AuthPlace> {
  //namecontroller
  final streetController = TextEditingController();
  final placeController = TextEditingController();
  final postCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 50,
              ),
              child: Text(
                'Wo wohnst du?',
                style: TextStyle(
                  color:  Theme.of(context).colorScheme.primary,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('lib/images/Location.png'),
                radius: 100,
                backgroundColor:  Theme.of(context).colorScheme.secondary,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40, bottom: 5),
                  child: Text(
                    'Straße und Hausnummer',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                TextBar(
                  controller: streetController,
                  hintText: 'Mustersraße 1',
                  obscureText: false,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, bottom: 5),
                  child: Text(
                    'Postleitzahl und Wohnort',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
      padding: const EdgeInsets.only(left: 40.0,right: 55),
      child: TextField(
        controller: postCodeController,
   
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black87),
            // borderRadius: BorderRadius.only(topLeft:Radius.circular(20),),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color:  Theme.of(context).colorScheme.primary,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          fillColor:  Theme.of(context).colorScheme.surface,
          filled: true,
          hintText:'35510',
        ),
      ),
    ),
     ),Expanded(
                      child: Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: TextField(
        controller: placeController,
   
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black87),
            // borderRadius: BorderRadius.only(topLeft:Radius.circular(20),),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color:  Theme.of(context).colorScheme.primary,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          fillColor:  Theme.of(context).colorScheme.surface,
          filled: true,
          hintText:'Wohnort',
        ),
      ),
    ),
     ),
     SizedBox(width: 30,)
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
