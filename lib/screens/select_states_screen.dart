import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../database/database.dart';
import '../database/json_decoder.dart';
import '../database/json_encoder.dart';
import '../widgets/state_slideup_widget.dart';
import './choose_map_screen.dart';
import '../widgets/mapwidgets/map_grid.dart';
import '../models/user_map.dart';

class SelectStatesScreen extends StatelessWidget {
  static const routeName = '/SelectedStatesScreen';

  @override
  Widget build(BuildContext context) {
    final userMaps = Provider.of<UserMaps>(context);

    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(229, 229, 229, 1.0),
      appBar: AppBar(
        title: Text(
          userMaps.getUserMapName(userMaps.currentId),
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color.fromRGBO(229, 229, 229, 1.0),
        leading: CupertinoButton(
          child: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context)
                .pushReplacementNamed(ChooseMapScreen.routeName);
          },
        ),
        /*
        actions: <Widget>[
          CupertinoButton(
            child: const Icon(
              Icons.replay_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              //MapDatabase().writeToDatabase(JsonEncoder().toJson(userMaps));
              //UserMapsList().toJson(userMaps);
              MapDatabase().readFile().then((value) => {
                    userMaps.updateUserMaps(JsonDecoder().toUserMaps(value)),
                  });
            },
          ),
          CupertinoButton(
            child: const Icon(
              Icons.check,
              color: Colors.black,
            ),
            onPressed: () {
              MapDatabase().writeToDatabase(JsonEncoder().toJson(userMaps));
            },
          )
        ], 
        */
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Container(
                color: const Color.fromRGBO(225, 225, 225, 1.0),
                child: Column(
                  children: [
                    MapGrid(),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      //alignment: Alignment.,
                      child: StateSlideUp(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
