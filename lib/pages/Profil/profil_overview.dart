import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:vs_femalefellows/components/female_fellows_button.dart';
import 'package:vs_femalefellows/models/user_model.dart';

class ProfilOverview extends StatefulWidget {
  const ProfilOverview({super.key, required this.userstate});
  final FFUser userstate;
  @override
  State<ProfilOverview> createState() => _ProfilOverviewState();
}

class _ProfilOverviewState extends State<ProfilOverview> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              /*      Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.phone,
                      size: 20,
                    ),
                    SizedBox(width: 20,),
                    Text(
                      widget.userstate.firstname ?? '',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
                     Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.phone,
                      size: 20,
                    ),
                    SizedBox(width: 20,),
                    Text(
                      widget.userstate.firstname ?? '',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ), */
              ListTile(
                leading: Icon(
                  Icons.phone,
                  size: 20,
                ),
                title: Text(
                  widget.userstate.firstname ?? '',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.mail,
                  size: 20,
                ),
                title: Text(
                  widget.userstate.email ?? '',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.cake,
                  size: 20,
                ),
                title: Text(
                  formatDate(
                    widget.userstate.birthday!.toDate(),
                    <String>[d, '. ', MM, ' ', yyyy],
                  ),
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.location_on_outlined,
                  size: 20,
                ),
                title: Text(
                  '${widget.userstate.address?.street ?? ''},\n${widget.userstate.address?.zipCode ?? ''}${widget.userstate.address?.city ?? ''}',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.person,
                  size: 20,
                ),
                title: Text(
                  widget.userstate.localOrNewcomer.toString(),
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FFButton(onTap: null, text: 'Profil vervollständigen')
            ],
          ),
        ),
      ],
    );
  }
}