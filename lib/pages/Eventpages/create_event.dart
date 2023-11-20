import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vs_femalefellows/blocs/EventBloc/event_bloc.dart';
import 'package:vs_femalefellows/components/female_fellows_button.dart';
import 'package:vs_femalefellows/components/text_bar.dart';
import 'package:vs_femalefellows/provider/controller.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

// Variablen
bool? _sport = false;
bool? _tandem = false;
bool? _outdoor = false;

class _CreateEventState extends State<CreateEvent> {
  @override
  Widget build(BuildContext context) {
    print(Controller.dateController);
    return Scaffold(
      body: ListView(children: [
        SizedBox(
          height: 50,
        ),
        TextBar(
            controller: Controller.dateController,
            hintText: 'Datum',
            obscureText: false,
            onChange: null,
            validator: null),
        SizedBox(
          height: 50,
        ),
        TextBar(
            controller: Controller.hostController,
            hintText: 'Host',
            obscureText: false,
            onChange: null,
            validator: null),
        SizedBox(
          height: 50,
        ),
        TextBar(
            controller: Controller.eventTitleController,
            hintText: 'Title',
            obscureText: false,
            onChange: null,
            validator: null),
        SizedBox(
          height: 50,
        ),
        TextBar(
            controller: Controller.contactPersonController,
            hintText: 'Contactperson',
            obscureText: false,
            onChange: null,
            validator: null),
        SizedBox(
          height: 50,
        ),
        TextBar(
            controller: Controller.materialController,
            hintText: 'Material',
            obscureText: false,
            onChange: null,
            validator: null),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: TextField(
            maxLength: 150,
            maxLines: 5,
            controller: Controller.descriptionController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black87),
                // borderRadius: BorderRadius.only(topLeft:Radius.circular(20),),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              fillColor: Theme.of(context).colorScheme.surface,
              filled: true,
              hintText: 'Description',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Categorys:',
            style: TextStyle(fontSize: 20),
          ),
        ),
        CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.only(left: 40),
            title: Text('Sport'),
            value: _sport,
            onChanged: (value) {
              setState(() {
                _sport = value ?? false;
              });
            }),
        CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.only(left: 40),
            title: Text('Tandem'),
            value: _tandem,
            onChanged: (value) {
              setState(() {
                _tandem = value ?? false;
              });
            }),
        CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.only(left: 40),
            title: Text('Outdoor'),
            value: _outdoor,
            onChanged: (value) {
              setState(() {
                _outdoor = value ?? false;
              });
            }),
        SizedBox(
          height: 20,
        ),
        BlocBuilder<EventBloc, EventState>(
          builder: (context, state) {
            return FFButton(
              text: 'Create Event',
              onTap: () {
                context.read<EventBloc>().add(NewEvent(
                      date: Controller.dateController.text,
                      eventDescription: Controller.descriptionController.text,
                      host: Controller.hostController.text,
                      eventTitle: Controller.eventTitleController.text,
                      contactPerson: Controller.contactPersonController.text,
                      material: Controller.materialController.text,
                      sport: _sport,
                      outdoor: _outdoor,
                      tandem: _tandem,
                    ));
              },
            );
          },
        ),
        SizedBox(
          height: 50,
        ),
      ]),
    );
  }
}
