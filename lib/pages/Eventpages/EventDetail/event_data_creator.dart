import 'package:flutter/material.dart';

class ParticipantsData extends StatelessWidget {
  const ParticipantsData({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1000,
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Table(
          border: TableBorder.all(),
          columnWidths: const <int, TableColumnWidth>{0: FlexColumnWidth()},
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: <TableRow>[
            TableRow(children: <Widget>[
              Container(
                alignment: Alignment.center,
                color: Colors.grey,
                height: 50,
                child: Text('Teilnehmer',style: TextStyle(color: Colors.white),),
              ),
              Container(
                alignment: Alignment.center,
                color: Colors.grey,
                height: 50,
                   child: Text('Kinder',style: TextStyle(color: Colors.white),),
              ),
              Container(
                alignment: Alignment.center,
                color: Colors.grey,
                height: 50,
                   child: Text('Dolmetcher',style: TextStyle(color: Colors.white),),
              ),
                  Container(
                alignment: Alignment.center,
                color: Colors.grey,
                height: 50,
                   child: Text('Fotoeinwilligung',style: TextStyle(color: Colors.white),),
              ),
            ],
            ),
                TableRow(children: <Widget>[
              Container(
                alignment: Alignment.center,
                color: Colors.white,
                height: 50,
                child: Text('Teilnehmer'),
              ),
              Container(
                alignment: Alignment.center,
                color: Colors.white,
                height: 50,
                   child: Text('Kinder'),
              ),
              Container(
                alignment: Alignment.center,
                color: Colors.white,
                height: 50,
                   child: Text('Dolmetcher'),
              ),
                  Container(
                alignment: Alignment.center,
                color: Colors.white,
                height: 50,
                   child: Text('Fotoeinwilligung'),
              ),
            ],
            ),
          ],
        ),
      ),
    );
  }
}
