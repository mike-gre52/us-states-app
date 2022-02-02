import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/user_map.dart';
import '../database/database.dart';
import '../database/json_encoder.dart';

class MapNamePopup extends StatefulWidget {
  @override
  _MapNamePopupState createState() => _MapNamePopupState();
}

class _MapNamePopupState extends State<MapNamePopup> {
  final mapNameController = TextEditingController();

  @override
  void dispose() {
    mapNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userMaps = Provider.of<UserMaps>(context);
    return CupertinoAlertDialog(
      title: const Text('Enter Map Name'),
      content: CupertinoTextField(
        controller: mapNameController,
        placeholder: 'Map Name',
      ),
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
            final newName = mapNameController.text;
            if (newName.characters.length == 0) {
              return;
            }
            userMaps.changeUserMapName(userMaps.currentId, newName);
            MapDatabase().writeToDatabase(JsonEncoder().toJson(userMaps));
          },
        ),
      ],
    );
  }
}
