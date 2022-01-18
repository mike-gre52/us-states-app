import 'package:flutter/material.dart';

class MapSpacer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;

    final containerHeight = height * 0.45;
    final containerWidth = width * 0.975;
    final spacerWidth = (containerWidth / 11) - 5;
    final spacerHeight = (containerHeight * 0.70) / 8;

    return Container(
      margin: const EdgeInsets.only(right: 5, bottom: 5),
      height: spacerWidth,
      width: spacerWidth,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(204, 204, 204, 1.0),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
