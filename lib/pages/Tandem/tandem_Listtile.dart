import 'package:flutter/material.dart';

class TandemFAQListTileWidget extends StatefulWidget {
  const TandemFAQListTileWidget({
    super.key,
    required this.faqTitle,
  });
  final String faqTitle;

  @override
  State<TandemFAQListTileWidget> createState() => _TandemListTileState();
}

class _TandemListTileState extends State<TandemFAQListTileWidget> {
  bool _toogle = false;

  void _toggleFAQ() {
    setState(() {
      _toogle = !_toogle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(widget.faqTitle),
          trailing: IconButton(
              alignment: Alignment.centerRight,
              onPressed: _toggleFAQ,
              icon: Icon(
                _toogle ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                size: 30,
                color: Theme.of(context).colorScheme.primary,
              )),
        ),
        Divider(
          thickness: 3,
          indent: 0,
          endIndent: 20,
          color: Theme.of(context).colorScheme.primary,
        ),
      ],
    );
  }
}
