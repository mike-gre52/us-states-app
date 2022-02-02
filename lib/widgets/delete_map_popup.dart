import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/user_map.dart';
import '../database/database.dart';
import '../database/json_encoder.dart';

class deleteMapPopup extends StatefulWidget {
  var thisMapId;

  deleteMapPopup(this.thisMapId);

  @override
  _deleteMapPopup createState() => _deleteMapPopup();
}

class _deleteMapPopup extends State<deleteMapPopup> {
  @override
  Widget build(BuildContext context) {
    final userMaps = Provider.of<UserMaps>(context);
    return CupertinoAlertDialog(
      title: const Text('Warning'),
      content: const Text('Are you sure you want to delete this map?'),
      actions: [
        CupertinoDialogAction(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        CupertinoDialogAction(
          child: Text('Submit'),
          onPressed: () {
            Navigator.pop(context);
            userMaps.deleteUserMap(widget.thisMapId);
            MapDatabase().writeToDatabase(JsonEncoder().toJson(userMaps));
          },
        ),
      ],
    );
  }
}
