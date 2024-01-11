import 'package:flutter/material.dart';
import 'package:vs_femalefellows/pages/Event/CreateEvent/event_category_items.dart';

class EventCategory extends StatelessWidget {
  const EventCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return      Container(
                  color: Colors.white,
                  width: 1000,
                  height: 400,
                  child: Padding(
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
                              children: [
                                CategoryItem(),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
  }
}