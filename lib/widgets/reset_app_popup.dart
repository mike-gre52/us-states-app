import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/user_map.dart';
import '../database/database.dart';
import '../database/json_encoder.dart';
import '../database/json_decoder.dart';

class ResetPopup extends StatefulWidget {
  @override
  _ResetPopup createState() => _ResetPopup();
}

class _ResetPopup extends State<ResetPopup> {
  @override
  Widget build(BuildContext context) {
    final firstId = UniqueKey().toString();
    List<UserMap> usermap = [
      UserMap(
        'New Map',
        firstId,
        [
          {
            'stateName': ['AK'],
            'stateStatus': ['unvisited'],
            'stateRating': [0],
            'stateTags': [],
          }
        ],
      ),
    ];

    final userMaps = Provider.of<UserMaps>(context);
    return CupertinoAlertDialog(
      title: const Text('Warning'),
      content: const Text(
          'Are you sure you want to delete all data. This is permanent.'),
      actions: [
        CupertinoDialogAction(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        CupertinoDialogAction(
          child: const Text('Submit'),
          onPressed: () {
            Navigator.pop(context);
            MapDatabase().writeToDatabase(
                JsonEncoder().toJson(UserMaps('AK', firstId, usermap)));
            MapDatabase().readFile().then((value) => {
                  userMaps.updateUserMaps(JsonDecoder().toUserMaps(value)),
                });
          },
        ),
      ],
    );
  }
}
