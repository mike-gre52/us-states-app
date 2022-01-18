import 'package:flutter/material.dart';

import 'map_spacer.dart';
import 'map_tile.dart';

class MapLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;

    final containerHeight = height * 0.45;
    final containerWidth = width * 0.975;
    final singleTileHeight = (containerWidth / 11) - 5;

    final columnWidth = (containerWidth / 11) - 1;
    final columnHeight = (singleTileHeight + 5) * 8;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //column #1
        Container(
          width: columnWidth,
          height: columnHeight,
          child: Column(
            children: [
              MapTile('AK'),
              MapSpacer(),
              MapTile('WA'),
              MapTile('OR'),
              MapTile('CA'),
              MapSpacer(),
              MapSpacer(),
              MapTile('HI'),
            ],
          ),
        ),
        //column #2
        Container(
          width: columnWidth,
          height: columnHeight,
          child: Column(
            children: [
              MapSpacer(),
              MapSpacer(),
              MapTile('ID'),
              MapTile('NV'),
              MapTile('UT'),
              MapTile('AZ'),
            ],
          ),
        ),
        //column #3
        Container(
          width: columnWidth,
          height: columnHeight,
          child: Column(
            children: [
              MapSpacer(),
              MapSpacer(),
              MapTile('MT'),
              MapTile('WY'),
              MapTile('CO'),
              MapTile('NM'),
            ],
          ),
        ),
        //column #4
        Container(
          width: columnWidth,
          height: columnHeight,
          child: Column(
            children: [
              MapSpacer(),
              MapSpacer(),
              MapTile('ND'),
              MapTile('SD'),
              MapTile('NE'),
              MapTile('KS'),
              MapTile('OK'),
              MapTile('TX'),
            ],
          ),
        ),
        //column #5
        Container(
          width: columnWidth,
          height: columnHeight,
          child: Column(
            children: [
              MapSpacer(),
              MapSpacer(),
              MapTile('MN'),
              MapTile('IA'),
              MapTile('MO'),
              MapTile('AR'),
              MapTile('LA'),
            ],
          ),
        ),
        //column #6
        Container(
          width: columnWidth,
          height: columnHeight,
          child: Column(
            children: [
              MapSpacer(),
              MapTile('WI'),
              MapTile('IL'),
              MapTile('IN'),
              MapTile('KY'),
              MapTile('TN'),
              MapTile('MS'),
            ],
          ),
        ),
        //column #7
        Container(
          width: columnWidth,
          height: columnHeight,
          child: Column(
            children: [
              MapSpacer(),
              MapSpacer(),
              MapTile('MI'),
              MapTile('OH'),
              MapTile('WV'),
              MapTile('NC'),
              MapTile('AI'),
            ],
          ),
        ),
        //column #8
        Container(
          width: columnWidth,
          height: columnHeight,
          child: Column(
            children: [
              MapSpacer(),
              MapSpacer(),
              MapSpacer(),
              MapTile('PA'),
              MapTile('VA'),
              MapTile('SC'),
              MapTile('GA'),
            ],
          ),
        ),
        //column #9
        Container(
          width: columnWidth,
          height: columnHeight,
          child: Column(
            children: [
              MapSpacer(),
              MapSpacer(),
              MapTile('NY'),
              MapTile('NJ'),
              MapTile('MD'),
              MapTile('DC'),
              MapSpacer(),
              MapTile('FL'),
            ],
          ),
        ),
        //column #10
        Container(
          width: columnWidth,
          height: columnHeight,
          child: Column(
            children: [
              MapSpacer(),
              MapTile('VT'),
              MapTile('MA'),
              MapTile('CT'),
              MapTile('DE'),
            ],
          ),
        ),
        //column #11
        Container(
          width: columnWidth,
          height: columnHeight,
          child: Column(
            children: [
              MapTile('ME'),
              MapTile('NH'),
              MapSpacer(),
              MapTile('RI'),
            ],
          ),
        ),
      ],
    );
  }
}
