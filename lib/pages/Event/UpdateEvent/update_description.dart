import 'package:flutter/material.dart';
import 'package:vs_femalefellows/models/events.dart';
import 'package:vs_femalefellows/provider/controller.dart';

class UpdateDesciption extends StatefulWidget {
  const UpdateDesciption({super.key, required this.event});

  final Event event;

  @override
  State<UpdateDesciption> createState() => _UpdateDesciptionState();
}

class _UpdateDesciptionState extends State<UpdateDesciption> {
  @override
  void initState() {
    _setInputFields(widget.event);
    super.initState();
  }

  void _setInputFields(Event eventState) {
    Controller.descriptionController.text = eventState.description;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Über das Event',
            style: TextStyle(fontSize: 20),
          ),
          Divider(
            thickness: 5,
            endIndent: 320,
            color: Theme.of(context).colorScheme.primary,
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 150,
            width: 350,
            child: TextFormField(
              controller: Controller.descriptionController,
              maxLines: 6,
              decoration: InputDecoration(
                disabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                fillColor: Theme.of(context).colorScheme.surface,
                hintText: widget.event.description,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
