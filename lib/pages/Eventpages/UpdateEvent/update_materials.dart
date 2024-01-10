import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vs_femalefellows/models/events.dart';
import 'package:vs_femalefellows/provider/controller.dart';

class UpdateMaterials extends StatelessWidget {
  const UpdateMaterials({super.key});

  @override
  Widget build(BuildContext context) {
        var event = context.read<Event>();
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text(
              'Was soll mitgebracht werden',
              style: TextStyle(fontSize: 20),
            ),
            Divider(
              color: Theme.of(context).colorScheme.primary,
              thickness: 5,
              endIndent: 320,
            ),
           SizedBox(height: 20,),
            ListTile(
              isThreeLine: true,
              leading: SvgPicture.asset(
                'lib/images/notebook.svg',                
              ),
              title: Text('Notizbuch & Stifte'),
              subtitle: TextField(
                controller: Controller.planerController,
                decoration:
                    InputDecoration(hintText: event.material?.planer ?? 'Trage die Materialien ein'),
              ),
            ),
            ListTile(
              isThreeLine: true,
              leading: SvgPicture.asset(
                'lib/images/food.svg',             
              ),
              title: Text('Kulinarische Köstlichkeiten'),
              subtitle: TextField(
                controller: Controller.foodController,
                decoration:
                    InputDecoration(hintText: event.material?.food ?? 'Trage die Materialien ein'),
              ),
            ),
            ListTile(
              isThreeLine: true,
              leading: Image.asset(
                'lib/images/Shirt.png',
                cacheHeight: 35,
              ),
              title: Text('Kleidung'),
              subtitle: TextField(
                controller: Controller.clothesController,
                decoration:
                    InputDecoration(hintText: event.material?.clothes??'Trage die Materialien ein'),
              ),
            ),
            ListTile(
              isThreeLine: true,
              leading: Image.asset(
                'lib/images/Star.png',
                cacheHeight: 35,
              ),
              title: Text('Sonstiges'),
              subtitle: TextField(
                  controller: Controller.informationController,
                  decoration:
                      InputDecoration(hintText:event.material?.information?? 'Trage die Materialien ein')),
            ),
        ],
      ),
    );
  }
}