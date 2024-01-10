import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:vs_femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:vs_femalefellows/pages/Eventpages/EventComponents/color_artbar.dart';
import 'package:vs_femalefellows/pages/Eventpages/EventOverview/all_events_page.dart';
import 'package:vs_femalefellows/pages/Eventpages/CreateEvent/create_event.dart';
import 'package:vs_femalefellows/pages/Eventpages/EventSignup/event_not_authenticated.dart';
import 'package:vs_femalefellows/pages/Eventpages/EventOverview/favorite_events.page.dart';
import 'package:vs_femalefellows/pages/Eventpages/EventOverview/signedup_events_page.dart';
import 'package:vs_femalefellows/provider/controller.dart';
import 'package:vs_femalefellows/provider/firestore/firestore_event.dart';

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

//DateRange Picker //
  DateTimeRange dateRange = DateTimeRange(start: DateTime.now(), end: DateTime.now());
  Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(context: context, initialDateRange: dateRange, firstDate: DateTime.now(), lastDate: DateTime(2025));
    if (newDateRange == null) return;
    setState(() {
      dateRange = newDateRange;
    });
  }

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissonns are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permisson are permantly denied, we cannot request Location');
    }
    return await Geolocator.getCurrentPosition();
  }

  String locationmessage = 'Current Location';
  late String lat;
  late String long;

  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
    return Scaffold(
      floatingActionButton: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticatedUser && state.tokenResult != null && state.tokenResult!.claims != null && state.tokenResult!.claims!.containsKey('role') && state.tokenResult!.claims!.containsValue('ADMINISTRATOR')) {
            return FloatingActionButton(
              heroTag: CreateEvent,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateEvent()));
              },
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
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Color.fromRGBO(241, 80, 60, 1),
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              decoration: BoxDecoration(color: Color.fromRGBO(241, 80, 60, 1), borderRadius: BorderRadius.only(bottomRight: Radius.circular(60))),
              height: 215,
              width: 1000,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 26,
                      width: 40,
                      decoration: BoxDecoration(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35),
                    child: Image.asset(
                      'lib/images/Mask group.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  /* Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: FloatingActionButton(
                      heroTag: EventNotAuthenticatedState,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => EventNotAuthenticatedState()));
                      },
                      backgroundColor: Colors.black,
                      mini: true,
                      child: Icon(Icons.add),
                    ),
                  ), */

                  //TODO only for Event creating//
                  /////////////////
                  ///////////
                  //////
                  ///
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
            ),
            Artbar(colorleft: Colors.red, colorright: Colors.white),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  TextButton.icon(
                    onPressed: () {
                      _getCurrentLocation().then((value) {
                        lat = '${value.latitude}';
                        long = '${value.longitude}';
                        setState(() {
                          locationmessage = '$lat,$long';
                        });
                      });
                    },
                    icon: Icon(
                      Icons.location_on_outlined,
                      color: Theme.of(context).colorScheme.primary,
                      size: 35,
                    ),
                    label: Column(
                      children: [
                        Text(
                          'Dein Standort',
                          style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 20),
                        ),
                        Text(
                          locationmessage,
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  TextButton.icon(
                    onPressed: pickDateRange,
                    icon: Icon(
                      Icons.date_range,
                      color: Theme.of(context).colorScheme.primary,
                      size: 30,
                    ),
                    label: Column(
                      children: [
                        Text(
                          'Datum wählen',
                          style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 20),
                        ),
                        Text(
                          '${start.day}.${start.month} bis ${end.day}.${end.month}',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                children: [
                  SizedBox(
                    width: 270,
                    child: SearchBar(
                      hintText: 'Suche nach',
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
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.filter_alt,
                          size: 35,
                          color: Theme.of(context).colorScheme.primary,
                        )),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            /*********************************************************************************************************/
            SizedBox(
              child: TabBar(
                controller: _tabController,
                tabs: [
                  Tab(
                    text: 'Alle',
                  ),
                  Tab(
                    text: 'Angemeldet',
                  ),
                  Tab(
                    text: 'Favoriten',
                  ),
                ],
              ),
            ),
            MultiBlocProvider(
              providers: [
                BlocProvider<AllEventsStore>(
                  create: (BuildContext context) => AllEventsStore(),
                ),
                BlocProvider<SubscribedEventsStore>(
                  create: (BuildContext context) => SubscribedEventsStore(),
                ),
                BlocProvider<FavoriteEventStore>(
                  create: (BuildContext context) => FavoriteEventStore((BlocProvider.of<AuthenticationBloc>(context))),
                ),
              ],
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

            /*********************************************************************************************************/
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: null,
                child: Text(
                  'Mehr Events anzeigen',
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
                      'Events vorschlagen',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Divider(
                      endIndent: 320,
                      thickness: 4,
                      color: Colors.white,
                    ),
                    Text(
                      'Du kannst dein eigenes Events organisieren oder\nEvents von anderen Organisationen vorschlagen.',
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Image(image: AssetImage('lib/images/idea.png')),
                    SizedBox(
                      height: 20,
                    ),
                    Image(image: AssetImage('lib/images/share.png')),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
