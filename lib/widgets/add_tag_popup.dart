import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/user_map.dart';
import '../database/database.dart';
import '../database/json_encoder.dart';

class addTagPopup extends StatefulWidget {
  @override
  _addTagPopup createState() => _addTagPopup();
}

class _addTagPopup extends State<addTagPopup> {
  final tagNameController = TextEditingController();

  @override
  void dispose() {
    tagNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userMaps = Provider.of<UserMaps>(context);
    return CupertinoAlertDialog(
      title: const Text('Add State Tag \n (10 character max)'),
      content: CupertinoTextField(
        controller: tagNameController,
        placeholder: 'Ex: Vacation, Home, Work',
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
            final tagName = tagNameController.text;
            if (tagName.characters.length > 10) {
              return;
            }
            userMaps.addStateTag(
                userMaps.currentStateSelected, tagName, userMaps.currentId);
            MapDatabase().writeToDatabase(JsonEncoder().toJson(userMaps));
          },
        ),
      ],
    );
  }
}
