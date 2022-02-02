import 'package:flutter/material.dart';
import 'package:us_states_app/widgets/map_counter_widget.dart';
import 'package:us_states_app/widgets/map_key_widget.dart';

import 'map_layout.dart';

class MapGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;

    final singleTileHeight = (height / 28);
    final columnHeight = (singleTileHeight + 5) * 8;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: height * 0.01),
          height: columnHeight + (height * 0.07),
          width: width * 0.975,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(1),
                spreadRadius: 2,
                blurRadius: 4,
              ),
            ],
            color: const Color.fromRGBO(204, 204, 204, 1),
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: height * 0.01),
                child: MapLayout(),
              ),
              Container(
                margin: EdgeInsets.only(top: height * 0.01),
                height: height * 0.05,
                width: double.infinity,
                color: const Color.fromRGBO(204, 204, 204, 1.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    MapKey('Visited', const Color.fromRGBO(64, 156, 74, 0.9)),
                    MapKey('Unvisited', const Color.fromRGBO(179, 23, 18, 0.5)),
                    MapCounter(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
