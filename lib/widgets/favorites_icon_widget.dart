import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vs_femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:vs_femalefellows/models/events.dart';
import 'package:vs_femalefellows/models/user_model.dart';
import 'package:vs_femalefellows/pages/Authentication/Login/login.dart';

class FavoritesIconWidget extends StatelessWidget {
  FavoritesIconWidget({
    super.key,
    required this.event,
  });

  final Event event;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (BuildContext context, AuthenticationState state) {
        if (state is AuthenticatedUser) {
          if (state.userProfile != null && event.id != null) {
            return IconButton(
              onPressed: () async {
                _updateFavorites(state.userProfile!, event.id!, context);
              },
              icon: (state.userProfile!.favorites.contains(event.id))
                  ? Icon(
                      Icons.favorite,
                    )
                  : Icon(
                      Icons.favorite_outline,
                    ),
            );
          } else {
            return SizedBox.shrink();
          }
        } else {
          return IconButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage())),
            icon: Icon(
              Icons.favorite_outline,
            ),
          );
        }
      },
    );
  }

  void _updateFavorites(FFUser userProfile, String eventId, BuildContext context) async {
    List<String> favorites = List.empty(growable: true);
    favorites.addAll(userProfile.favorites);
    if (favorites.contains(eventId)) {
      favorites.remove(eventId);
    } else {
      favorites.add(eventId);
    }
    userProfile.favorites = favorites;
    HapticFeedback.heavyImpact();

    if (BlocProvider.of<AuthenticationBloc>(context).state is AuthenticatedUser) {
      context.read<AuthenticationBloc>().add(UpdateUserProfileEvent((BlocProvider.of<AuthenticationBloc>(context).state as AuthenticatedUser).user!.uid, userProfile: userProfile));
    }
  }
}
