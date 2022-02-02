import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:us_states_app/widgets/text_pop_up.dart';

import '../widgets/add_tag_popup.dart';
import './stars_widget.dart';
import '../models/user_map.dart';
import '../database/state_name_lookup_table.dart';
import '../database/database.dart';
import '../database/json_encoder.dart';

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

    String displayedTags;
    Widget tagsDisplay = Text('');

    if (currentTags.length < 2 && currentTags.length > 0) {
      displayedTags = '${currentTags[0]}';
      tagsDisplay = Row(
        children: [
          Text(
            displayedTags,
            style: const TextStyle(fontSize: 16),
          ),
          GestureDetector(
            child: const Icon(
              Icons.delete_outline,
              size: 18,
              color: Color.fromRGBO(74, 74, 74, 1.0),
            ),
            onTap: () {
              userMaps.deleteStateTag(
                  currentStateSelected, currentTags[0], currentId);
              MapDatabase().writeToDatabase(JsonEncoder().toJson(userMaps));
            },
          ),
        ],
      );
    } else if (currentTags.length == 0) {
      displayedTags = 'add tag';
      tagsDisplay = GestureDetector(
        child: Text(
          displayedTags,
          style: const TextStyle(fontSize: 16),
        ),
        onTap: () {
          showDialog(
            context: context,
            builder: (_) => addTagPopup(),
            barrierDismissible: true,
          );
        },
      );
    } else {
      displayedTags = '${currentTags[0]} ';
      final displayedTags2 = ', ${currentTags[1]}';
      tagsDisplay = Row(
        children: [
          Text(
            displayedTags,
            style: const TextStyle(fontSize: 14),
          ),
          GestureDetector(
            child: const Icon(
              Icons.delete_outline,
              size: 18,
              color: Color.fromRGBO(74, 74, 74, 1.0),
            ),
            onTap: () {
              userMaps.deleteStateTag(
                  currentStateSelected, currentTags[0], currentId);
              MapDatabase().writeToDatabase(JsonEncoder().toJson(userMaps));
            },
          ),
          Text(
            displayedTags2,
            style: const TextStyle(fontSize: 14),
          ),
          GestureDetector(
            child: const Icon(
              Icons.delete_outline,
              size: 18,
              color: Color.fromRGBO(74, 74, 74, 1.0),
            ),
            onTap: () {
              userMaps.deleteStateTag(
                  currentStateSelected, currentTags[1], currentId);
              MapDatabase().writeToDatabase(JsonEncoder().toJson(userMaps));
            },
          ),
        ],
      );
    }

    final flagWidth = width * 0.375;
    final flagHeight = flagWidth / 1.5;
    return Container(
      //margin: EdgeInsets.only(top: height * 0.025),
      height: height * 0.375,
      width: double.infinity,
      decoration: const BoxDecoration(color: Color.fromRGBO(229, 229, 229, 1.0)
          //borderRadius: BorderRadius.only(
          //topRight: Radius.circular(25.0),
          //topLeft: Radius.circular(25.0),
          //),
          ),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(left: 25, top: 25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: 100,
                            maxWidth: width * 0.5,
                            minHeight: 30,
                            maxHeight: 80,
                          ),
                          child: AutoSizeText(
                            fullStateName()
                                .getFullStateName(currentStateSelected),
                            style: const TextStyle(
                              height: 1,
                              fontSize: 35,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            GestureDetector(
                              child: const Icon(
                                Icons.bookmark_add_outlined,
                                color: Color.fromRGBO(25, 49, 120, 0.9),
                              ),
                              onTap: () {
                                if (currentTags.length < 2) {
                                  showDialog(
                                    context: context,
                                    builder: (_) => addTagPopup(),
                                    barrierDismissible: true,
                                  );
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (_) => textPopup('2 Tag Max',
                                        'You may only add two tags for a given state'),
                                    barrierDismissible: true,
                                  );
                                }
                              },
                            ),
                            tagsDisplay,
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.person_outline,
                              color: Color.fromRGBO(64, 156, 74, 0.9),
                            ),
                            Text(
                              fullStateName()
                                  .getStatePopulation(currentStateSelected),
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: Color.fromRGBO(179, 23, 18, 0.5),
                            ),
                            Text(
                              fullStateName()
                                  .getStateCapital(currentStateSelected),
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      StarsWidget(),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        height: flagHeight,
                        width: flagWidth,
                        child: Image.asset(fullStateName()
                            .getStateImage(currentStateSelected)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: height * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CupertinoButton(
                      child: Container(
                        height: 60,
                        width: 140,
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 1,
                              blurRadius: 4,
                            )
                          ],
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                          color: const Color.fromRGBO(64, 156, 74, 0.9),
                        ),
                        child: const Center(
                          child: Text(
                            'Mark as Selected',
                            style: TextStyle(
                              color: Color.fromRGBO(240, 240, 240, 0.9),
                              fontFamily: 'SairaCondensed',
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        userMaps.updateStateStatus(
                            currentId, currentStateSelected, 'visited');
                        MapDatabase()
                            .writeToDatabase(JsonEncoder().toJson(userMaps));
                      },
                    ),
                    GestureDetector(
                      child: const Text(
                        'Unselect State',
                        style: TextStyle(fontSize: 18),
                      ),
                      onTap: () {
                        userMaps.updateStateStatus(
                            currentId, currentStateSelected, 'unvisited');
                        MapDatabase()
                            .writeToDatabase(JsonEncoder().toJson(userMaps));
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
