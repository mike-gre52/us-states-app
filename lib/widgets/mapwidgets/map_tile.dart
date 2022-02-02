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
    final tileWidth = width / 12;
    final tileHeight = height / 28;

    final currentMapId = userMaps.currentId;
    final currestStateSelected = userMaps.currentStateSelected;
    bool shouldHighlight = false;

    if (currestStateSelected == widget.state) {
      shouldHighlight = true;
    }

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

    var tileLength;
    if (tileWidth < tileHeight) {
      tileLength = tileWidth;
    } else {
      tileLength = tileHeight;
    }
    final tileColor = shouldColorChange
        ? const Color.fromRGBO(64, 156, 74, 0.9)
        : const Color.fromRGBO(179, 23, 18, 0.5);
    final border = shouldHighlight ? Border.all(width: 0.5) : null;
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 20,
        minHeight: 20,
        maxHeight: 60,
        maxWidth: 60,
      ),
      child: GestureDetector(
        child: Container(
          margin: const EdgeInsets.only(right: 5, bottom: 5),
          height: tileHeight,
          width: tileHeight,
          decoration: BoxDecoration(
            border: border,
            color: tileColor,
            borderRadius: BorderRadius.circular(1),
          ),
          child: Center(
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                widget.state,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                  //color: Color.fromRGBO(36, 36, 36, 1.0),
                ),
              ),
            ),
          ),
        ),
        onTap: () {
          userMaps.currentStateSelected = widget.state;
          userMaps.addSelectedState(
            widget.state,
            'unvisited',
            currentMapId,
            null,
          );
          setState(() {});
        },
      ),
    );
  }
}
