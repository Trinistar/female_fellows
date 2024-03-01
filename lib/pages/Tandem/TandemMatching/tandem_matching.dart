import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vs_femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:vs_femalefellows/blocs/TandemBloc/tandem_bloc.dart';
import 'package:vs_femalefellows/helper_functions.dart';
import 'package:vs_femalefellows/models/enums.dart';
import 'package:vs_femalefellows/models/user_model.dart';
import 'package:vs_femalefellows/pages/Tandem/TandemMatching/tandem_userCard.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TandemMatching extends StatefulWidget {
  const TandemMatching({super.key});

  @override
  State<TandemMatching> createState() => _TandemMatchingState();
}

class _TandemMatchingState extends State<TandemMatching> {
  PageController? _pageController;
  late String _lat;
  late String _long;
  String locationmessage = 'Ort angeben';
  late TandemTypeFilter _tandemTypeFilter;

  @override
  void initState() {
    _tandemTypeFilter = TandemTypeFilter.all;
    _pageController = PageController(viewportFraction: 0.9);
    if (context.read<AuthenticationBloc>().state is AuthenticatedUser &&
        (context.read<AuthenticationBloc>().state as AuthenticatedUser)
                .userProfile!
                .tandemTypeFilter !=
            null) {
      _tandemTypeFilter =
          (context.read<AuthenticationBloc>().state as AuthenticatedUser)
              .userProfile!
              .tandemTypeFilter!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          backgroundColor: Theme.of(context).colorScheme.primary,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: CircleAvatar(
              radius: 30,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: SvgPicture.asset(
                'lib/images/tandem-matching.svg',
                width: 50,
                height: 50,
              ),
            ),
            backgroundColor: Theme.of(context).colorScheme.primary,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () => context.push('/tandem/tandemInfo'),
                  child: SvgPicture.asset(
                    'lib/images/info-icon.svg',
                    width: 50,
                    height: 50,
                  ),
                ),
              )
            ],
          ),
          body: BlocBuilder<TandemBloc, TandemState>(
            builder: (context, state) {
              if (state is TandemLocalsLoaded) {
                return _tandemsList(context, state.tandems);
              } else if (state is TandemNewcomersLoaded) {
                return _tandemsList(context, state.tandems);
              } else {
                return SizedBox.shrink();
              }
            },
          ),
        );
      },
    );
  }

  ListView _tandemsList(BuildContext context, List<FFUser> tandems) {
    return ListView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Text(
                AppLocalizations.of(context)!.tandemMatchingOverviewTitle,
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                thickness: 5,
                indent: 0,
                endIndent: 250,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  TextButton.icon(
                    onPressed: () {
                      HelperFunctions.getCurrentLocation().then((value) {
                        _lat = '${value.latitude}';
                        _long = '${value.longitude}';
                        setState(() {
                          locationmessage = '$_lat,$_long';
                        });
                        if (BlocProvider.of<AuthenticationBloc>(context).state
                            is AuthenticatedUser) {
                          final FFUser profile =
                              (BlocProvider.of<AuthenticationBloc>(context)
                                      .state as AuthenticatedUser)
                                  .userProfile!;
                          context.read<AuthenticationBloc>().add(
                              UpdateUserProfileEvent(
                                  (BlocProvider.of<AuthenticationBloc>(context)
                                          .state as AuthenticatedUser)
                                      .user!
                                      .uid,
                                  latitude: value.latitude,
                                  longitude: value.longitude,
                                  userProfile: profile));
                        }
                      });
                    },
                    icon: Icon(
                      Icons.location_on_outlined,
                      color: Colors.white,
                      size: 35,
                    ),
                    label: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.eventsPageGetLocation,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        BlocBuilder<AuthenticationBloc, AuthenticationState>(
                          builder: (context, state) {
                            if (state is AuthenticatedUser) {
                              return Text(
                                state.userProfile!.location != null
                                    ? '${state.userProfile!.address!.zipCode} ${state.userProfile!.location!.name!}'
                                    : locationmessage,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              );
                            } else {
                              return Text(
                                locationmessage,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              );
                            }
                          },
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      alignment: Alignment.bottomRight,
                      onPressed: null,
                      icon: Icon(
                        Icons.filter_alt,
                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                thickness: 5,
                indent: 0,
                endIndent: 0,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                AppLocalizations.of(context)!.tandemMatchingOverviewFilterTitle,
                style: TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Center(
                child: CustomSlidingSegmentedControl<TandemTypeFilter>(
                  initialValue: _tandemTypeFilter,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.white),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(45),
                  ),
                  thumbDecoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.white),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(45),
                  ),
                  children: <TandemTypeFilter, Widget>{
                    TandemTypeFilter.all: Text(
                      AppLocalizations.of(context)!
                          .tandemMatchingOverviewFilterOptionOne,
                      style: _tandemTypeFilter == TandemTypeFilter.all
                          ? null
                          : TextStyle(color: Colors.white),
                    ),
                    TandemTypeFilter.nearby: Text(
                      AppLocalizations.of(context)!
                          .tandemMatchingOverviewFilterOptionTwo,
                      style: _tandemTypeFilter == TandemTypeFilter.all
                          ? TextStyle(color: Colors.white)
                          : null,
                    ),
                  },
                  onValueChanged: (TandemTypeFilter? value) {
                    setState(() {
                      _tandemTypeFilter = value!;
                      if (context.read<AuthenticationBloc>().state
                          is AuthenticatedUser) {
                        var user = context.read<AuthenticationBloc>().state
                            as AuthenticatedUser;
                        user.userProfile!.tandemTypeFilter = _tandemTypeFilter;
                        (context.read<AuthenticationBloc>()
                          ..add(UpdateUserProfileEvent(user.user!.uid,
                              userProfile: user.userProfile!)));
                      }
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: 650,
              child: tandems.isNotEmpty
                  ? PageView.builder(
                      controller: _pageController,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return TandemUserCard(otherUserProfile: tandems[index]);
                      },
                      itemCount: tandems.length,
                    )
                  : Text(
                      AppLocalizations.of(context)!.tandemMatchingFailure,
                      style: TextStyle(
                          color: Colors.white, fontStyle: FontStyle.italic),
                      textAlign: TextAlign.center,
                    ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                AppLocalizations.of(context)!.tandemMatchingOverviewBody1,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                  AppLocalizations.of(context)!.tandemMatchingOverviewBody2,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  )),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ],
    );
  }
}
