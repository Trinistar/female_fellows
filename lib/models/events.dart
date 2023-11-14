import 'package:vs_femalefellows/models/enums.dart';
import 'package:vs_femalefellows/models/event_materials.dart';

class Event {
  final EventCategory eventcategory;
  final String date;
  final String host;
  final String participants; //array
  final String eventTitle;
  final String location;
  final String eventDescription;
  final String contactPerson;
  final EventMaterial material;

  Event({
    required this.eventcategory,
    required this.date,
    required this.host,
    required this.participants,
    required this.eventTitle,
    required this.location,
    required this.eventDescription,
    required this.contactPerson,
    required this.material,
  });
}
