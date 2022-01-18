import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/user_map.dart';

class StateSlideUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _tagController = TextEditingController();

    final userMaps = Provider.of<UserMaps>(context);
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;

    final currentId = userMaps.currentId;
    final currentStateSelected = userMaps.currentStateSelected;

    var currentTags = userMaps.getStateTags(currentStateSelected, currentId);
    return Container(
      //margin: EdgeInsets.only(top: height * 0.025),
      height: height * 0.5,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(201, 201, 201, 0.9),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25.0),
          topLeft: Radius.circular(25.0),
        ),
      ),
      child: Column(
        children: <Widget>[
          Text(currentStateSelected),
          Text('Status: ${userMaps.getStateStatus(
            currentStateSelected,
            currentId,
          )}'),
          Text('Tags$currentTags'),
          CupertinoTextField(
            controller: _tagController,
            onSubmitted: (tagName) {
              userMaps.addStateTag(currentStateSelected, tagName, currentId);
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: CupertinoButton(
                    child: const Text('Cancel'), onPressed: () {}),
              ),
              CupertinoButton(child: const Text('Done'), onPressed: () {})
            ],
          ),
        ],
      ),
    );
  }
}
