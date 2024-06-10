import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:femalefellows/helper_functions.dart';
import 'package:femalefellows/models/user_model.dart';
import 'package:femalefellows/pages/Event/CreateEvent/create_event.dart';
import 'package:femalefellows/pages/Event/EventComponents/color_artbar.dart';
import 'package:femalefellows/pages/Event/EventOverview/all_events_page.dart';
import 'package:femalefellows/pages/Event/EventOverview/favorite_events.page.dart';
import 'package:femalefellows/pages/Event/EventOverview/signedup_events_page.dart';
import 'package:femalefellows/provider/controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EventOverview extends StatefulWidget {
  const EventOverview({
    super.key,
  });

  @override
  State<EventOverview> createState() => _EventOverviewState();
}

class _EventOverviewState extends State<EventOverview> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  DateTimeRange dateRange = DateTimeRange(start: DateTime.now(), end: DateTime.now());
  Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(context: context, initialDateRange: dateRange, firstDate: DateTime.now(), lastDate: DateTime(2025));
    if (newDateRange == null) return;
    setState(() {
      dateRange = newDateRange;
    });
  }

  String locationmessage = 'Ort angeben';
  late String _lat;
  late String _long;

  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).colorScheme.onTertiary,
        toolbarHeight: 0,
      ),
      floatingActionButton: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticatedUser && state.tokenResult != null && state.tokenResult!.claims != null && HelperFunctions.isAdmin(state.tokenResult!.claims)) {
            return FloatingActionButton(
              heroTag: CreateEvent,
              onPressed: () => context.go('/events/createEvent'),
              foregroundColor: Colors.white,
              backgroundColor: Theme.of(context).colorScheme.tertiary,
              mini: true,
              child: Icon(Icons.add),
            );
          } else {
            return SizedBox.shrink();
          }
        },
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Stack(
            children: [
              Container(
                height: 215,
                width: 1000,
                decoration: BoxDecoration(color: Color.fromRGBO(241, 80, 60, 1), borderRadius: BorderRadius.only(bottomRight: Radius.circular(60))),
              ),
              Positioned(bottom: 0, right: 0, child: Image.asset('lib/images/Mask group.png')),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 130,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Text(
                      'Events',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 5,
                    indent: 40,
                    endIndent: 310,
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
          Artbar(colorleft: Colors.red, colorright: Colors.white),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
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
                      if (BlocProvider.of<AuthenticationBloc>(context).state is AuthenticatedUser) {
                        final FFUser profile = (BlocProvider.of<AuthenticationBloc>(context).state as AuthenticatedUser).userProfile!;
                        context.read<AuthenticationBloc>().add(
                              UpdateUserProfileEvent(
                                (BlocProvider.of<AuthenticationBloc>(context).state as AuthenticatedUser).user!.uid,
                                latitude: value.latitude,
                                longitude: value.longitude,
                                userProfile: profile,
                              ),
                            );
                      }
                    });
                  },
                  icon: Icon(
                    Icons.location_on_outlined,
                    color: Theme.of(context).colorScheme.primary,
                    size: 35,
                  ),
                  label: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.eventsPageGetLocation,
                        style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 20),
                      ),
                      BlocBuilder<AuthenticationBloc, AuthenticationState>(
                        builder: (context, state) {
                          if (state is AuthenticatedUser) {
                            return Text(
                              state.userProfile!.location != null ? '${state.userProfile!.address!.zipCode} ${state.userProfile!.location!.name!}' : locationmessage,
                              style: TextStyle(fontSize: 12),
                            );
                          } else {
                            return Text(
                              locationmessage,
                              style: TextStyle(fontSize: 12),
                            );
                          }
                        },
                      )
                    ],
                  ),
                ),
                Flexible(
                  child: TextButton.icon(
                    onPressed: pickDateRange,
                    icon: Icon(
                      Icons.date_range,
                      color: Theme.of(context).colorScheme.primary,
                      size: 30,
                    ),
                    label: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.eventsPageAllFilter,
                          style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 20),
                        ),
                        Text(
                          '${start.day}.${start.month} bis ${end.day}.${end.month}',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          //TODO activate on later version, if implemented
          /* Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: SizedBox(
                    child: SearchBar(
                      hintText: AppLocalizations.of(context)!
                          .eventsPageAllSearchFieldPlaceholder,
                      controller: Controller.searchbarController,
                      onTap: null,
                      leading: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: const Icon(
                          Icons.search,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.filter_alt,
                        size: 35,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ), */
          SizedBox(
            height: 40,
          ),
          /*********************************************************************************************************/
          SizedBox(
            child: TabBar(
              controller: _tabController,
              tabs: [
                Tab(
                  text: AppLocalizations.of(context)!.eventsPageAllDefaultSection,
                ),
                Tab(
                  text: AppLocalizations.of(context)!.eventsPageAllSectionTwo,
                ),
                Tab(
                  text: AppLocalizations.of(context)!.eventsPageAllSectionThree,
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.maxFinite,
            height: 700,
            child: TabBarView(
              controller: _tabController,
              children: [
                AllEvents(),
                SingedUpEvents(),
                FavoritEvents(),
              ],
            ),
          ),
          /* MultiBlocProvider(
                  providers: [
                    /* BlocProvider<AllEventsStore>(
                      create: (BuildContext context) => AllEventsStore(),
                    ), */
                    /* BlocProvider<SubscribedEventsStore>(
                      lazy: false,
                      create: (BuildContext context) => SubscribedEventsStore(BlocProvider.of<AuthenticationBloc>(context)),
                    ), */
                    /* BlocProvider<FavoriteEventStore>(
                      lazy: false,
                      create: (BuildContext context) => FavoriteEventStore(BlocProvider.of<AuthenticationBloc>(context)),
                    ), */
                  ],
                  child: Expanded(
                    child: SizedBox(
                      width: double.maxFinite,
                      height: 400,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          AllEvents(),
                          SingedUpEvents(),
                          FavoritEvents(),
                        ],
                      ),
                    ),
                  ),
                ), */

          /*********************************************************************************************************/
          SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: null,
              child: Text(
                AppLocalizations.of(context)!.eventsPageAllButtonOne,
                style: TextStyle(color: Colors.black, fontSize: 17),
              )),
          SizedBox(
            height: 20,
          ),
          Artbar(colorleft: Colors.white, colorright: Theme.of(context).colorScheme.primary),
          Container(
            width: 700,
            height: 350,
            color: Theme.of(context).colorScheme.primary,
            child: Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.eventsPageAllTitle,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Divider(
                    endIndent: 320,
                    thickness: 4,
                    color: Colors.white,
                  ),
                  Text(
                    AppLocalizations.of(context)!.eventsPageAllSubtitle,
                    style: TextStyle(fontSize: 13, color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20))),
                            height: 60,
                            width: 60,
                            child: Icon(
                              Icons.wb_incandescent_sharp,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          GestureDetector(
                            onTap: () => _openMail('mailto:events@femalefellows.com'),
                            child: SizedBox(
                              width: 170,
                              child: Text(
                                AppLocalizations.of(context)!.eventsPageAllMailtoButtonOne,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20))),
                            height: 60,
                            width: 60,
                            child: Icon(
                              Icons.calendar_month,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          GestureDetector(
                            onTap: () => _openMail('mailto:events@femalefellows.com'),
                            child: SizedBox(
                              width: 170,
                              child: Text(
                                AppLocalizations.of(context)!.eventsPageAllMailtoButtonTwo,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> _openMail(String mail) async {
    await launchUrl(Uri.parse(mail));
  }
}
