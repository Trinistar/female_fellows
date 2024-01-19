import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vs_femalefellows/blocs/CategoriesCubit/categories_cubit.dart';
import 'package:vs_femalefellows/blocs/EventBloc/event_bloc.dart';
import 'package:vs_femalefellows/models/category.dart';

class EventCategorys extends StatelessWidget {
  EventCategorys({super.key, required this.selectedCats});

  final List<int> selectedCats;

  final List<Category> _selectedCats = [];
  List<Category> _allCats = [];
  bool _once = true;

  @override
  Widget build(BuildContext context) {
    if (_once) {
      if (BlocProvider.of<CategoryCubit>(context).state is CategoriesLoaded) {
        _allCats.addAll((BlocProvider.of<CategoryCubit>(context).state as CategoriesLoaded).cats);
      }
      for (final int cat in selectedCats) {
        _selectedCats.addAll(_allCats.where((element) => element.id == cat));
      }
      _once = false;
    }
    return BlocBuilder<EventBloc, EventState>(
      builder: (context, state) {
        if (state is EventLoaded) {
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
                      children: _selectedCats.map((Category category) {
                        return FilterChip(
                          shape: CupertinoTheme.of(context).brightness == Brightness.dark ? null : RoundedRectangleBorder(side: const BorderSide(width: 0.5, color: Colors.grey), borderRadius: BorderRadius.circular(45)),
                          backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
                          selectedColor: Theme.of(context).colorScheme.primary,
                          label: Text(
                            category.translation.de,
                          ),
                          onSelected: (value) {},
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
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
