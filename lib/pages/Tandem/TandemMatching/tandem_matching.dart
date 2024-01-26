import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vs_femalefellows/blocs/TandemBloc/tandem_bloc.dart';
import 'package:vs_femalefellows/models/user_model.dart';
import 'package:vs_femalefellows/pages/Tandem/TandemMatching/tandem_userCard.dart';

class TandemMatching extends StatefulWidget {
  const TandemMatching({super.key});

  @override
  State<TandemMatching> createState() => _TandemMatchingState();
}

class _TandemMatchingState extends State<TandemMatching> {
  PageController? _pageController;

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.9);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        toolbarHeight: 40,
        leading: BackButton(),
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
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
  }

  ListView _tandemsList(BuildContext context, List<FFUser> tandems) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: SvgPicture.asset(
                  'lib/images/tandem-matching.svg',
                  width: 50,
                  height: 50,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Deine Tandem-Matches',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              Divider(
                thickness: 5,
                indent: 0,
                endIndent: 250,
                color: Colors.white,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 35,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 240,
                    child: Row(
                      children: [
                        Text(
                          'Stuttgart',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  IconButton(
                    alignment: Alignment.bottomRight,
                    onPressed: null,
                    icon: Icon(
                      Icons.filter_alt,
                      size: 35,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                thickness: 5,
                indent: 0,
                endIndent: 0,
                color: Colors.white,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 650,
                child: PageView.builder(
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return TandemUserCard(user: tandems[index]);
                  },
                  itemCount: tandems.length,
                ),
              ),
              Text(
                'Von diesen Matching-Vorschägen kannst du dir eine passende Tandem-Partnerinnen aussuchen und anfragen. Die Matches basieren auf eurem Wohnort und Alter. Wähle den Vorschlag aus, der am besten zu dir passt, und lasst eure gemeinsame Reise beginnen!',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Denk daran, du hast 24 Stunden Zeit, um dich für einen Vorschlag zu entscheiden, bevor du die Antwort deiner Tandem-Partnerin erhälst. Viel Spaß beim Kennenlernen und Entdecken neuer Freundschaften!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  )),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
