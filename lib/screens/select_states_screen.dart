import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:us_states_app/widgets/state_slideup_widget.dart';

import './choose_map_screen.dart';
import '../widgets/mapwidgets/map_grid.dart';

class SelectStatesScreen extends StatelessWidget {
  static const routeName = '/SelectedStatesScreen';

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(229, 229, 229, 1.0),
      appBar: AppBar(
        title: const Text(
          'Maps',
          style: TextStyle(
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
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SafeArea(
                child: MapGrid(),
              ),
              //loadMapsButton(),
              StateSlideUp()
            ],
          ),
        ),
      ),
    );
  }
}
