import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/user_map.dart';
import '../database/database.dart';
import '../database/json_encoder.dart';

class StarsWidget extends StatefulWidget {
  @override
  _StarsWidgetState createState() => _StarsWidgetState();
}

class _StarsWidgetState extends State<StarsWidget> {
  @override
  Widget build(BuildContext context) {
    final userMaps = Provider.of<UserMaps>(context);
    final stateName = userMaps.currentStateSelected;
    final stateId = userMaps.currentId;

    var stateRating = int.parse(userMaps.getStateRating(stateName, stateId));
//if(stateRating > 1) const Icon(Icons.star_rounded, : Icon(Icons.star_border_rounded,

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        //Star 1
        (stateRating as int >= 1)
            ? GestureDetector(
                child: const Icon(
                  Icons.star_rounded,
                  size: 25,
                  color: Color.fromRGBO(199, 149, 48, 1.0),
                ),
                onTap: () {
                  userMaps.updateStateRating(stateName, '1', stateId);
                  MapDatabase().writeToDatabase(JsonEncoder().toJson(userMaps));
                },
              )
            : GestureDetector(
                child: const Icon(
                  Icons.star_border_rounded,
                  size: 25,
                  color: Color.fromRGBO(199, 149, 48, 1.0),
                ),
                onTap: () {
                  userMaps.updateStateRating(stateName, '1', stateId);
                  MapDatabase().writeToDatabase(JsonEncoder().toJson(userMaps));
                },
              ),
        // ),
        //Star 2
        (stateRating as int >= 2)
            ? GestureDetector(
                child: const Icon(
                  Icons.star_rounded,
                  size: 25,
                  color: Color.fromRGBO(199, 149, 48, 1.0),
                ),
                onTap: () {
                  userMaps.updateStateRating(stateName, '2', stateId);
                  MapDatabase().writeToDatabase(JsonEncoder().toJson(userMaps));
                },
              )
            : GestureDetector(
                child: const Icon(
                  Icons.star_border_rounded,
                  size: 25,
                  color: Color.fromRGBO(199, 149, 48, 1.0),
                ),
                onTap: () {
                  userMaps.updateStateRating(stateName, '2', stateId);
                  MapDatabase().writeToDatabase(JsonEncoder().toJson(userMaps));
                },
              ),
        //Star 3
        (stateRating as int >= 3)
            ? GestureDetector(
                child: const Icon(
                  Icons.star_rounded,
                  size: 25,
                  color: Color.fromRGBO(199, 149, 48, 1.0),
                ),
                onTap: () {
                  userMaps.updateStateRating(stateName, '3', stateId);
                  MapDatabase().writeToDatabase(JsonEncoder().toJson(userMaps));
                },
              )
            : GestureDetector(
                child: const Icon(
                  Icons.star_border_rounded,
                  size: 25,
                  color: Color.fromRGBO(199, 149, 48, 1.0),
                ),
                onTap: () {
                  userMaps.updateStateRating(stateName, '3', stateId);
                  MapDatabase().writeToDatabase(JsonEncoder().toJson(userMaps));
                },
              ),
        //Star 4
        (stateRating as int >= 4)
            ? GestureDetector(
                child: const Icon(
                  Icons.star_rounded,
                  size: 25,
                  color: Color.fromRGBO(199, 149, 48, 1.0),
                ),
                onTap: () {
                  userMaps.updateStateRating(stateName, '4', stateId);
                  MapDatabase().writeToDatabase(JsonEncoder().toJson(userMaps));
                },
              )
            : GestureDetector(
                child: const Icon(
                  Icons.star_border_rounded,
                  size: 25,
                  color: Color.fromRGBO(199, 149, 48, 1.0),
                ),
                onTap: () {
                  userMaps.updateStateRating(stateName, '4', stateId);
                  MapDatabase().writeToDatabase(JsonEncoder().toJson(userMaps));
                },
              ),
        //Star 5
        (stateRating as int >= 5)
            ? GestureDetector(
                child: const Icon(
                  Icons.star_rounded,
                  size: 25,
                  color: Color.fromRGBO(199, 149, 48, 1.0),
                ),
                onTap: () {
                  userMaps.updateStateRating(stateName, '5', stateId);
                  MapDatabase().writeToDatabase(JsonEncoder().toJson(userMaps));
                },
              )
            : GestureDetector(
                child: const Icon(
                  Icons.star_border_rounded,
                  size: 25,
                  color: Color.fromRGBO(199, 149, 48, 1.0),
                ),
                onTap: () {
                  userMaps.updateStateRating(stateName, '5', stateId);
                  MapDatabase().writeToDatabase(JsonEncoder().toJson(userMaps));
                },
              ),
      ],
    );
  }
}
