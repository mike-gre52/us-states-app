import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/choose_map_screen.dart';

class loadMapsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;

    return Container(
      margin: EdgeInsets.only(top: height * 0.05),
      height: height * 0.075,
      width: width * 0.75,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(height * 0.03),
      ),
      child: CupertinoButton(
        child: const Text(
          'Load Map',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pushReplacementNamed(ChooseMapScreen.routeName);
        },
      ),
    );
  }
}
