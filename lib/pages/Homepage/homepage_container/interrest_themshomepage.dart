import 'package:flutter/material.dart';

class ThemeGroups extends StatelessWidget {
  const ThemeGroups({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1000,
      height: 320,
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 20),
              child: Text(
                'Diese Events könnten\ndich interessieren',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 150,
              width: 1000,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Image(image: AssetImage('lib/images/schwimmen.png')),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Image(image: AssetImage('lib/images/schwimmen.png')),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Image(image: AssetImage('lib/images/schwimmen.png')),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:10),
              child: ElevatedButton( onPressed: (){},
              style: ElevatedButton.styleFrom( 
                fixedSize: Size(320, 60),
                backgroundColor: Theme.of(context).colorScheme.primary,
               ),
              child: Text('Zu allen Themengruppen',style: TextStyle(color: Colors.white,
              fontSize: 15),
              ),
              
              ),
            )
          ],
        ),
      ),
    );
  }
}
