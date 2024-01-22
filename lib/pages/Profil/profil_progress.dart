import 'package:flutter/material.dart';
import 'package:vs_femalefellows/components/female_fellows_button.dart';

class ProfilProgress extends StatefulWidget {
  const ProfilProgress({super.key});

  @override
  State<ProfilProgress> createState() => _ProfilProgressState();
}

class _ProfilProgressState extends State<ProfilProgress> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top:30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child:  Center(
                      child: Text('456',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 40),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:10),
                    child: Text('Mitglied seit\nTagen',textAlign: TextAlign.center, style: TextStyle(fontSize: 15),),
                  )
                ],
              ),
              SizedBox(width: 20,),
                  Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                    child: Center(child: Text('23',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 40),)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:10),
                    child: Text('An Events \n teilgenommen',textAlign: TextAlign.center, style: TextStyle(fontSize: 15),),
                  )
                 
                ],
              ),
                SizedBox(width: 20,),
                  Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.onTertiary,
                    ),
                    child:  Center(child: Text('6',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 40),)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:10),
                    child: Text('Auszeichnungen\n', style: TextStyle(fontSize: 15),),
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 50,),
        GestureDetector(
      onTap: null,
      child: Container(
        padding: EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 60),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Center(
            child: Text(
          'Ehrentamtsnachweis beantragen',
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
        )),
      ),
    ),
      ],
    );
  }
}
