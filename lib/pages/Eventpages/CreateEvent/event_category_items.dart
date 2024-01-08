import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum CategoryFilter {
  sport,
  bildung,
  sprache,
  frauengesundheit,
  tandemgeeignet,
  computer,
  inforveranstaltung,
  kinder,
  musik,
  kunst,
  kinderfreundlich,
  schwanderschaft,
  beratung,
  schule,
  selbststaendigkeit
}

class CategoryItem extends StatefulWidget {
  const CategoryItem({super.key});

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  Set<CategoryFilter> filters = <CategoryFilter>{};
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Wrap(
            spacing: 5.0,
            children: CategoryFilter.values.map((CategoryFilter category) {
              return FilterChip(
                shape: CupertinoTheme.of(context).brightness == Brightness.dark
                    ? null
                    : RoundedRectangleBorder(
                        side: const BorderSide(width: 0.5, color: Colors.grey),
                        borderRadius: BorderRadius.circular(45)),
                backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
                selectedColor: Theme.of(context).colorScheme.primary,
                label: Text(
                  category.name,
                  style: TextStyle(
                    color: filters.contains(category) ? Colors.white : null,
                  ),
                ),
                selected: filters.contains(category),
                onSelected: (bool selected) {
                  setState(() {
                    if (selected) {
                      filters.add(category);
                    } else {
                      filters.remove(category);
                    }
                  });
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
