import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vs_femalefellows/models/category.dart';

class EventCategorys extends StatelessWidget {
  const EventCategorys({super.key, required this.cats});

  final List<Category> cats;

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
          Column(
            children: [
              Wrap(
                spacing: 5.0,
                children: cats.map((Category category) {
                  return FilterChip(
                    shape: CupertinoTheme.of(context).brightness == Brightness.dark ? null : RoundedRectangleBorder(side: const BorderSide(width: 0.5, color: Colors.grey), borderRadius: BorderRadius.circular(45)),
                    backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
                    selectedColor: Theme.of(context).colorScheme.primary,
                    label: Text(
                      category.translation.de,
                    ),
                    onSelected:(value) {
                      
                    },
                  );
                }).toList(),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
