import 'package:flutter/material.dart';
import 'package:vs_femalefellows/pages/Tandem/Activitys/tandem_item_activ.dart';
import 'package:vs_femalefellows/pages/Tandem/Activitys/tandem_item_art.dart';
import 'package:vs_femalefellows/pages/Tandem/Activitys/tandem_item_cinema.dart';
import 'package:vs_femalefellows/pages/Tandem/Activitys/tandem_item_city.dart';
import 'package:vs_femalefellows/pages/Tandem/Activitys/tandem_item_coffee.dart';
import 'package:vs_femalefellows/pages/Tandem/Activitys/tandem_item_cooking.dart';
import 'package:vs_femalefellows/pages/Tandem/Activitys/tandem_item_creative.dart';
import 'package:vs_femalefellows/pages/Tandem/Activitys/tandem_item_digital.dart';
import 'package:vs_femalefellows/pages/Tandem/Activitys/tandem_item_exchange.dart';
import 'package:vs_femalefellows/pages/Tandem/Activitys/tandem_item_german.dart';
import 'package:vs_femalefellows/pages/Tandem/Activitys/tandem_item_green.dart';
import 'package:vs_femalefellows/pages/Tandem/Activitys/tandem_item_music.dart';
import 'package:vs_femalefellows/pages/Tandem/Activitys/tandem_item_picnic.dart';

class ActivitysCarousel extends StatelessWidget {
  const ActivitysCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 1000,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ItemCoffee(),
          ItemPicnic(),
          ItemMusic(),
          ItemCreative(),
          ItemGreen(),
          ItemGerman(),
          ItemCooking(),
          ItemExchange(),
          ItemActiv(),
          ItemCinema(),
          ItemArt(),
          ItemCity(),
          ItemDigital(),
        ],
      ),
    );
  }
}
