import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_picker/languages.dart';
import 'package:vs_femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:vs_femalefellows/models/user_model.dart';

class TandemLanguages extends StatefulWidget {
  const TandemLanguages({
    super.key,
    this.userLanguages,
  });

  final void Function(UserLanguages)? userLanguages;

  @override
  State<TandemLanguages> createState() => _TandemLanguagesState();
}

class _TandemLanguagesState extends State<TandemLanguages> {
  List<Language> _selectedLanguages = [];
  List<FFLanguage> _ffLanguages = [];
  late Language _selectedLanguage;
  late Language _lang;

  @override
  void initState() {
    if (BlocProvider.of<AuthenticationBloc>(context).state is AuthenticatedUser) {
      final FFUser profile = (BlocProvider.of<AuthenticationBloc>(context).state as AuthenticatedUser).userProfile!;
      if (profile.languages != null) {
        final FFLanguage lang = (BlocProvider.of<AuthenticationBloc>(context).state as AuthenticatedUser).userProfile?.languages?.main ?? FFLanguage('de', 'German');
        _lang = Language(lang.isoCode, lang.name);
        final List<FFLanguage> additional = (BlocProvider.of<AuthenticationBloc>(context).state as AuthenticatedUser).userProfile?.languages?.additional ?? [];
        _ffLanguages = additional;
        for (final FFLanguage lang in additional) {
          _selectedLanguages.add(Language(lang.isoCode, lang.name));
        }
      } else {
        _lang = Languages.german;
        _selectedLanguage = Languages.german;
      }
    } else {
      _lang = Languages.german;
      _selectedLanguage = Languages.german;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: ListView(
        children: [
          Text(
            'Welche Sprachen sprichst du?',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: CircleAvatar(
              backgroundImage: AssetImage('lib/images/dolmetcher.png'),
              radius: 100,
              backgroundColor: Theme.of(context).colorScheme.secondary,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            'Muttersprache',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          DropdownMenu<Language>(
            width: 300,
            initialSelection: _lang,
            dropdownMenuEntries: Languages.defaultLanguages.map((Language motherlang) {
              return DropdownMenuEntry<Language>(value: motherlang, label: motherlang.name);
            }).toList(),
            onSelected: (value) {
              setState(() {
                _lang = value!;
                widget.userLanguages!(UserLanguages(main: FFLanguage(_lang.isoCode, _lang.name), additional: _ffLanguages));
              });
            },
          ),
          SizedBox(
            height: 10,
          ),
          FilterChip(
            shape: CupertinoTheme.of(context).brightness == Brightness.dark ? null : RoundedRectangleBorder(side: const BorderSide(width: 0.5, color: Colors.grey), borderRadius: BorderRadius.circular(45)),
            backgroundColor: Theme.of(context).colorScheme.primary,
            selectedColor: Theme.of(context).colorScheme.primary,
            label: Text(
              _lang.name,
              style: TextStyle(color: Colors.white),
            ),
            onSelected: (_) {},
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Weitere Sprachen',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          DropdownMenu<Language>(
            width: 300,
            initialSelection: _selectedLanguages.first,
            dropdownMenuEntries: Languages.defaultLanguages.map((Language lang) {
              return DropdownMenuEntry<Language>(
                value: lang,
                label: lang.name,
              );
            }).toList(),
            onSelected: (value) {
              setState(() {
                _selectedLanguage = value!;
                if (!_selectedLanguages.contains(_selectedLanguage)) {
                  _selectedLanguages.add(_selectedLanguage);
                  _ffLanguages.add(FFLanguage(_selectedLanguage.isoCode, _selectedLanguage.name));
                  widget.userLanguages!(UserLanguages(main: FFLanguage(_lang.isoCode, _lang.name), additional: _ffLanguages));
                }
              });
            },
          ),
          SizedBox(
            height: 20,
          ),
          Wrap(
            spacing: 8.0,
            children: _selectedLanguages.map((Language lang) {
              return Chip(
                deleteIconColor: Colors.white,
                onDeleted: () {
                  setState(() {
                    _selectedLanguages.remove(lang);
                    _ffLanguages.remove(FFLanguage(lang.isoCode, lang.name));
                    widget.userLanguages!(UserLanguages(main: FFLanguage(_lang.isoCode, _lang.name), additional: _ffLanguages));
                  });
                },
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 0.5, color: Colors.grey),
                  borderRadius: BorderRadius.circular(45),
                ),
                backgroundColor: Theme.of(context).colorScheme.primary,
                //selectedColor: Theme.of(context).colorScheme.primary,
                label: Text(
                  lang.name,
                  style: TextStyle(color: Colors.white),
                ),
                //onSelected: (value) {},
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
