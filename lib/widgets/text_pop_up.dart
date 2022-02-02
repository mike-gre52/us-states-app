import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/user_map.dart';
import '../database/database.dart';
import '../database/json_encoder.dart';

class textPopup extends StatefulWidget {
  var title;
  var subtitle;

  textPopup(this.title, this.subtitle);

  @override
  _textPopup createState() => _textPopup();
}

class _textPopup extends State<textPopup> {
  @override
  Widget build(BuildContext context) {
    final userMaps = Provider.of<UserMaps>(context);
    return CupertinoAlertDialog(
      title: Text(widget.title),
      content: Text(widget.subtitle),
    );
  }
}
