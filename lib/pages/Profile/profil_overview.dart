import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:femalefellows/components/female_fellows_button.dart';
import 'package:femalefellows/models/user_model.dart';
import 'package:go_router/go_router.dart';

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
            Icons.person,
            size: 20,
          ),
          title: Text(
            '${widget.userstate.firstname ?? ''} ${widget.userstate.lastname ?? ''}',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          subtitle: Text(
            widget.userstate.aboutMe ?? '',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
        widget.userstate.notification != null ?
        ListTile(
          leading: Icon(
            Icons.phone,
            size: 20,
          ),
          title: Text(
            widget.userstate.notification!.phonenumber,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ) : SizedBox.shrink(),
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
        widget.userstate.address != null ?
        ListTile(
          leading: Icon(
            Icons.location_on_outlined,
            size: 20,
          ),
          title: Text(
            '${widget.userstate.address?.street ?? ''},\n${widget.userstate.address?.zipCode ?? ''} ${widget.userstate.address?.city ?? ''}',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ) : SizedBox.shrink(),
        widget.userstate.localOrNewcomer != null
            ? ListTile(
                leading: Icon(
                  Icons.person,
                  size: 20,
                ),
                title: Text(
                  widget.userstate.localOrNewcomer.toString().split('.')[1],
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              )
            : SizedBox.shrink(),
        SizedBox(
          height: 20,
        ),
        FFButton(onTap: () => context.go('/profile/editProfile', extra: widget.userstate), text: 'Profil vervollständigen'),
      ],
    );
  }
}
