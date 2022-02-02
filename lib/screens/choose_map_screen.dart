import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../widgets/delete_map_popup.dart';
import '../widgets/reset_app_popup.dart';
import '../widgets/text_pop_up.dart';
import './select_states_screen.dart';
import '../widgets/change_map_name_popup.dart';
import '../models/user_map.dart';
import '../database/database.dart';
import '../database/json_encoder.dart';

class ChooseMapScreen extends StatelessWidget {
  static const routeName = '/ChooseMapScreen';

  @override
  Widget build(BuildContext context) {
    final allMaps = Provider.of<UserMaps>(context);
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;

    final numberOfMaps = allMaps.getUserMapsCount();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(229, 229, 229, 1.0),
          leading: CupertinoButton(
            child: const Icon(
              Icons.delete_forever,
              color: Colors.black,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => ResetPopup(),
                barrierDismissible: true,
              );
            },
          ),
          title: const Text(
            'Maps',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          actions: <Widget>[
            CupertinoButton(
              child: const Icon(
                Icons.add,
                color: Colors.black,
              ),
              onPressed: () {
                allMaps.addUserMap();
                MapDatabase().writeToDatabase(JsonEncoder().toJson(allMaps));
              },
            )
          ],
        ),
        body: Container(
          color: const Color.fromRGBO(229, 229, 229, 1.0),
          child: SafeArea(
            child: Container(
              child: ListView.builder(
                itemCount: allMaps.count(),
                itemBuilder: (_, i) => Column(
                  children: [
                    GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        height: height * 0.1,
                        width: width * 0.9,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(204, 204, 204, 1.0),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: const Offset(0, 0),
                              ),
                            ]),
                        child: Container(
                          margin: const EdgeInsets.only(right: 25, left: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                //margin: const EdgeInsets.only(right: 50),
                                child: Text(
                                  '${allMaps.maps[i].title}',
                                  style: (TextStyle(
                                    fontSize: 20,
                                  )),
                                ),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    child: const Icon(
                                      Icons.edit,
                                      color: Colors.black,
                                    ),
                                    onTap: () {
                                      allMaps.currentId = allMaps.maps[i].id;
                                      showDialog(
                                        context: context,
                                        builder: (_) => MapNamePopup(),
                                        barrierDismissible: true,
                                      );
                                    },
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 15),
                                    child: GestureDetector(
                                      child: const Icon(
                                        Icons.delete,
                                        color: Colors.black,
                                      ),
                                      onTap: () {
                                        final thisMapId = allMaps.maps[i].id;
                                        if (numberOfMaps > 1) {
                                          showDialog(
                                            context: context,
                                            builder: (_) =>
                                                deleteMapPopup(thisMapId),
                                            barrierDismissible: true,
                                          );
                                        } else {
                                          showDialog(
                                            context: context,
                                            builder: (_) => textPopup('Notice',
                                                'You cannot delete a map when only one is remaining'),
                                            barrierDismissible: true,
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        allMaps.currentId = allMaps.maps[i].id;
                        Navigator.of(context).pushReplacementNamed(
                          SelectStatesScreen.routeName,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
