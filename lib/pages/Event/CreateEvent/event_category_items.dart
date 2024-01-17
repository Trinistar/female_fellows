import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vs_femalefellows/blocs/CategoriesCubit/categories_cubit.dart';
import 'package:vs_femalefellows/models/category.dart';

enum CategoryFilter { sport, bildung, sprache, frauengesundheit, tandemgeeignet, computer, inforveranstaltung, kinder, musik, kunst, kinderfreundlich, schwanderschaft, beratung, schule, selbststaendigkeit }

class CategoryItems extends StatefulWidget {
  const CategoryItems({super.key, this.selectedCategories});

  final void Function(List<Category> categories)? selectedCategories;

  @override
  State<CategoryItems> createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {
  Set<Category> filters = <Category>{};
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, List<Category>>(
      builder: (context, state) {
        return Column(
          children: [
            Wrap(
              spacing: 5.0,
              children: state.map((Category category) {
                return FilterChip(
                  shape: CupertinoTheme.of(context).brightness == Brightness.dark ? null : RoundedRectangleBorder(side: const BorderSide(width: 0.5, color: Colors.grey), borderRadius: BorderRadius.circular(45)),
                  backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
                  selectedColor: Theme.of(context).colorScheme.primary,
                  label: Text(
                    category.translation.de,
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
                      /* final List<int> cats = [];
                      for (final Category cat in filters) {
                        cats.add(cat.id);
                      } */
                      widget.selectedCategories!(filters.toList());
                    });
                  },
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}
