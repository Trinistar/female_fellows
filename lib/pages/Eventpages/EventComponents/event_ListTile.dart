import 'package:flutter/material.dart';

class EventListTile extends StatelessWidget {
  const EventListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 30,bottom: 30),
          child: SizedBox(
            height: 80,
            width: 320,
            child: ListTile(
                leading: Image.asset(
                  'lib/images/partner1.png',
                  fit: BoxFit.fill,
                  width: 80,
        
                ),
                title: Text(
                  'Sprachcafé: Arrabisch/Deutsch',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          size: 20,
                        ),
                        Text(
                          'Datum',
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.person_2_outlined,
                          size: 20,
                        ),
                        Text(
                          'Veranstalter',
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 20,
                        ),
                        Text(
                          'Location',
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
        ),
        Icon(Icons.favorite_outline)
      ],
    );
  }
}
