import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vs_femalefellows/blocs/CategoriesCubit/categories_cubit.dart';
import 'package:vs_femalefellows/models/category.dart';
import 'package:vs_femalefellows/models/events.dart';

class CategoryItems extends StatefulWidget {
  const CategoryItems({super.key, this.selectedCategories, this.editingEvent = false, this.event});

  final void Function(List<int> categories)? selectedCategories;
  final bool editingEvent;
  final Event? event;

  @override
  State<CategoryItems> createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {
  final List<int> _filters = [];
  List<Category> _allCats = [];

  @override
  void initState() {
    if (BlocProvider.of<CategoryCubit>(context).state is CategoriesLoaded) {
    _allCats.addAll((BlocProvider.of<CategoryCubit>(context).state as CategoriesLoaded).cats);

    }
    if (widget.editingEvent && widget.event != null && widget.event!.categories != null) {
      for (final Category category in _allCats) {
        for (int i = 0; i < widget.event!.categories!.length; i++) {
          if (category.id == widget.event!.categories![i]) {
            _filters.add(category.id);
          }
        }
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoriesState>(
      builder: (context, state) {
        return Column(
          children: [
            Wrap(
              spacing: 5.0,
              children: categoryWidgets.toList(),
            ),
          ],
        );
      },
    );
  }

  Iterable<Widget> get categoryWidgets sync* {
    for (final Category category in _allCats) {
      yield FilterChip(
        shape: CupertinoTheme.of(context).brightness == Brightness.dark ? null : RoundedRectangleBorder(side: const BorderSide(width: 0.5, color: Colors.grey), borderRadius: BorderRadius.circular(45)),
        backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
        selectedColor: Theme.of(context).colorScheme.primary,
        label: Text(
          category.translation.de,
          style: TextStyle(
            color: _filters.contains(category.id) ? Colors.white : null,
          ),
        ),
        selected: _filters.contains(category.id),
        onSelected: (bool selected) {
          setState(() {
            if (selected) {
              _filters.add(category.id);
            } else {
              _filters.remove(category.id);
            }
            widget.selectedCategories!(_filters);
          });
        },
      );
    }
  }
}
