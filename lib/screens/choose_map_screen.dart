import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:us_states_app/screens/select_states_screen.dart';

import '../models/user_map.dart';

class ChooseMapScreen extends StatelessWidget {
  static const routeName = '/ChooseMapScreen';

  @override
  Widget build(BuildContext context) {
    final allMaps = Provider.of<UserMaps>(context);
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(229, 229, 229, 1.0),
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
                    Container(
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
                      child: Row(
                        children: [
                          Text('map ID: ${allMaps.maps[i].id}'),
                          CupertinoButton(
                            child: const Icon(
                              Icons.edit,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              allMaps.currentId = allMaps.maps[i].id;
                              Navigator.of(context).pushReplacementNamed(
                                SelectStatesScreen.routeName,
                              );
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
