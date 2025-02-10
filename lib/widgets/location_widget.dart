import 'package:femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:femalefellows/helper_functions.dart';
import 'package:femalefellows/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:femalefellows/generated/l10n.dart';

class LocationWidget extends StatefulWidget {
  const LocationWidget({super.key, required this.textColor});

  final Color textColor;

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  String locationmessage = 'Ort angeben';

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => _getCurrentLocation(),
      icon: Icon(
        Icons.location_on_outlined,
        color: widget.textColor,
        size: 35,
      ),
      label: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).eventsPageGetLocation,
            style: TextStyle(
              color: widget.textColor,
              fontSize: 20,
            ),
          ),
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is AuthenticatedUser) {
                return Text(
                  state.userProfile!.location != null
                      ? '${state.userProfile!.address!.zipCode} ${state.userProfile!.location!.name!} (100km Radius)'
                      : locationmessage,
                  style: TextStyle(fontSize: 12, color: widget.textColor),
                );
              } else {
                return Text(
                  '$locationmessage (100km Radius)',
                  style: TextStyle(fontSize: 12, color: widget.textColor),
                );
              }
            },
          )
        ],
      ),
    );
  }

  void _getCurrentLocation() async {
    var location = await HelperFunctions.getCurrentLocation();
    setState(() {
      locationmessage = '${location.latitude},${location.latitude}';
    });
    if (context.read<AuthenticationBloc>().state is AuthenticatedUser) {
      final FFUser profile =
          (context.read<AuthenticationBloc>().state as AuthenticatedUser)
              .userProfile!;
      context.read<AuthenticationBloc>().add(
            UpdateUserProfileEvent(
              userId: (context.read<AuthenticationBloc>().state
                      as AuthenticatedUser)
                  .user!
                  .uid,
              latitude: location.latitude,
              longitude: location.longitude,
              userProfile: profile,
            ),
          );
    }
  }
}
