import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user_map.dart';

class MapCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userMaps = Provider.of<UserMaps>(context);

    return Text(
      '${userMaps.getNumberOfStatesSelected(userMaps.currentId)} / 51',
      style: TextStyle(fontSize: 25),
    );
  }
}
