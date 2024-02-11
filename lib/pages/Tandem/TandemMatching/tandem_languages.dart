import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:language_picker/languages.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class TandemLanguages extends StatefulWidget {
  const TandemLanguages({
    super.key,
  });

  @override
  State<TandemLanguages> createState() => _TandemLanguagesState();
}

class _TandemLanguagesState extends State<TandemLanguages> {
  List<Language> selectedLanguages = []; // Track selected languages
  late Language _selectedLanguage;
  late Language _lang;

  @override
  void initState() {
    _lang = Languages.german;
    _selectedLanguage = Languages.german;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: ListView(
        children: [
          Text(
            AppLocalizations.of(context)!.tandemMatchingAnmeldungOverlayTitle,
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
            AppLocalizations.of(context)!.tandemMatchingAnmeldungOverlayFilterOneTitle,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          DropdownMenu<Language>(
            width: 300,
            initialSelection: Languages.german,
            dropdownMenuEntries: Languages.defaultLanguages.map((Language motherlang) {
              return DropdownMenuEntry<Language>(value: motherlang, label: motherlang.name);
            }).toList(),
            onSelected: (value) {
              setState(() {
                _lang = value!;
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
            onSelected: (_) {
              setState(() {
                _lang = Languages.german;
              });
            },
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            AppLocalizations.of(context)!.tandemMatchingAnmeldungOverlayFilterThreePlaceholder,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          DropdownMenu<Language>(
            width: 300,
            initialSelection: Languages.german,
            dropdownMenuEntries: Languages.defaultLanguages.map((Language lang) {
              return DropdownMenuEntry<Language>(
                value: lang,
                label: lang.name,
              );
            }).toList(),
            onSelected: (value) {
              setState(() {
                _selectedLanguage = value!;
                if (!selectedLanguages.contains(_selectedLanguage)) {
                  selectedLanguages.add(_selectedLanguage);
                }
              });
            },
          ),
          SizedBox(
            height: 20,
          ),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: selectedLanguages.map((Language lang) {
              return FilterChip(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 0.5, color: Colors.grey),
                  borderRadius: BorderRadius.circular(45),
                ),
                backgroundColor: Theme.of(context).colorScheme.primary,
                selectedColor: Theme.of(context).colorScheme.primary,
                label: Text(
                  lang.name,
                  style: TextStyle(color: Colors.white),
                ),
                onSelected: (bool selected) {
                  setState(() {
                    selectedLanguages.remove(lang);
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
