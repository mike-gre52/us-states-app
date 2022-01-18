import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/user_map.dart';

class MapTile extends StatefulWidget {
  String state;

  MapTile(this.state);

  @override
  State<MapTile> createState() => _MapTileState();
}

class _MapTileState extends State<MapTile> {
  @override
  Widget build(BuildContext context) {
    final userMaps = Provider.of<UserMaps>(context);
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;

    final containerHeight = height * 0.45;
    final containerWidth = width * 0.975;
    final tileWidth = (containerWidth / 11) - 5;
    final tileHeight = (containerHeight * 0.70) / 8;

    final currentMapId = userMaps.currentId;

    List<Map<String, List>> selectedStates =
        userMaps.getStatesSelected(currentMapId);
    bool shouldColorChange = false;

    for (var i = 0; i < selectedStates.length; i++) {
      if (selectedStates[i]['stateName']![0] == widget.state) {
        if (selectedStates[i]['stateStatus']![0] == 'visited') {
          shouldColorChange = true;
        } else {
          shouldColorChange = false;
        }
        //print(selectedStates[i]['stateName']);

      }
    }

    final tileColor = shouldColorChange
        ? Colors.green
        : const Color.fromRGBO(179, 37, 32, 0.5);
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(right: 5, bottom: 5),
        height: tileWidth,
        width: tileWidth,
        decoration: BoxDecoration(
          //border: Border.all(width: 1),

          color: tileColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            widget.state,
          ),
        ),
      ),
      onTap: () {
        userMaps.currentStateSelected = widget.state;
        userMaps.addSelectedState(
          widget.state,
          'visited',
          currentMapId,
        );
        setState(() {});
      },
    );
  }
}
