import 'package:flutter/material.dart';
import 'package:us_states_app/widgets/map_key_widget.dart';

import 'map_layout.dart';

class MapGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;

    return Column(
      children: [
        Container(
          //margin: EdgeInsets.only(top: height * 0.1),
          height: height * 0.45,
          width: width * 0.975,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 6),
              ),
            ],
            //Color.fromRGBO(237, 231, 209, 0.9)
            color: const Color.fromRGBO(204, 204, 204, 1),
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: height * 0.01),
                child: MapLayout(),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15),
                height: height * 0.05,
                width: double.infinity,
                color: const Color.fromRGBO(204, 204, 204, 1.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    MapKey('Visited', Colors.green),
                    MapKey('Unvisited', const Color.fromRGBO(179, 37, 32, 0.5)),
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
