import 'package:date_format/date_format.dart';

class GermanLocale implements DateLocale {
  GermanLocale();

  @override
  final List<String> monthsShort = const <String>['Jan', 'Feb', 'Mär', 'Apr', 'Mai', 'Jun', 'Jul', 'Aug', 'Sep', 'Okt', 'Nov', 'Dez'];

  @override
  final List<String> monthsLong = const <String>['Januar', 'Februar', 'März', 'April', 'Mai', 'Juni', 'Juli', 'August', 'September', 'Oktober', 'November', 'Dezember'];

  @override
  final List<String> daysShort = const <String>['Mo', 'Di', 'Mi', 'Do', 'Fr', 'Sa', 'So'];

  final List<String> daysShortFromSunday = const <String>['So', 'Mo', 'Di', 'Mi', 'Do', 'Fr', 'Sa'];

  @override
  final List<String> daysLong = const <String>['Montag', 'Dienstag', 'Mittwoch', 'Donnerstag', 'Freitag', 'Samstag', 'Sonntag'];

  @override
  // TODO: implement am
  String get am => throw UnimplementedError();

  @override
  // TODO: implement pm
  String get pm => throw UnimplementedError();
}
