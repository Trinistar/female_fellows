import 'package:flutter/material.dart';

class EventCategorys extends StatefulWidget {
  const EventCategorys({super.key});

  @override
  State<EventCategorys> createState() => _EventCategoryState();
}

class _EventCategoryState extends State<EventCategorys> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(
            leading: Image.asset(
              'lib/images/category.png',
              cacheHeight: 30,
            ),
            title: Text('Kategorien'),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            width: 150,
            height: 30,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 2, color: Theme.of(context).colorScheme.primary),
                borderRadius: BorderRadius.circular(60)),
            child: Text('Sprache'),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
