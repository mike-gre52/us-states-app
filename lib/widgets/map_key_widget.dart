import 'package:flutter/material.dart';

class MapKey extends StatelessWidget {
  final String keyName;
  final Color keyColor;

  MapKey(this.keyName, this.keyColor);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: 15,
          width: 15,
          margin: EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
            color: keyColor,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        Text(': $keyName')
      ],
    );
  }
}
