import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final String tagName;

  Tag(this.tagName);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      height: 25,
      width: 50,
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
    );
  }
}
