import 'package:flutter/material.dart';

class UserMapStatesSelected with ChangeNotifier {
  List<Map<String, Object>> _statesSelected = [];
  List<Map<String, Object>> get statesSelected {
    return [..._statesSelected];
  }
}

class UserMap {
  String title;
  String id;
  List<Map<String, List>> statesInfoList;

  UserMap(
    this.title,
    this.id,
    this.statesInfoList,
  );
}

class UserMaps with ChangeNotifier {
  var currentStateSelected = 'AK';
  var currentId = '1';
  final List<UserMap> _userMaps = [
    UserMap(
      'New Map',
      '1',
      [],
    ),
  ];

  List<UserMap> get maps {
    return [..._userMaps];
  }

  String getStateStatus(String stateName, String mapId) {
    final userMap = _userMaps.firstWhere((map) => map.id == mapId);
    for (var i = 0; i < userMap.statesInfoList.length; i++) {
      if (userMap.statesInfoList[i]['stateName']![0].toString() == stateName) {
        return userMap.statesInfoList[i]['stateStatus']![0].toString();
      }
    }
    return 'unvisited';
  }

  Object getStateTags(String stateName, String mapId) {
    final userMap = _userMaps.firstWhere((map) => map.id == mapId);
    for (var i = 0; i < userMap.statesInfoList.length; i++) {
      if (userMap.statesInfoList[i]['stateName']![0].toString() == stateName) {
        //print(selectedStates[i]['stateName']);
        return userMap.statesInfoList[i]['stateTags']!;
      }
    }
    return '';
  }

  addStateTag(String stateName, String tagName, String mapId) {
    final userMap = _userMaps.firstWhere((map) => map.id == mapId);
    for (var i = 0; i < userMap.statesInfoList.length; i++) {
      if (userMap.statesInfoList[i]['stateName']?[0].toString() == stateName) {
        userMap.statesInfoList[i]['stateTags']?.add(tagName);
        notifyListeners();
      }
    }
  }

  addUserMap() {
    _userMaps.add(
      UserMap(
        'New Map',
        (_userMaps.length + 1).toString(),
        [],
      ),
    );
    notifyListeners();
  }

  List<Map<String, List>> getStatesSelected(String mapId) {
    final userMap = _userMaps.firstWhere((map) => map.id == mapId);
    return userMap.statesInfoList;
  }

  addSelectedState(String stateName, String stateStatus, String mapId) {
    final userMap = _userMaps.firstWhere((map) => map.id == mapId);
    Map<String, List> newState = {
      'stateName': [stateName],
      'stateStatus': [stateStatus],
      'stateTags': [],
    };

    for (var i = 0; i < userMap.statesInfoList.length; i++) {
      if (userMap.statesInfoList[i]['stateName']![0] == stateName) {
        if (userMap.statesInfoList[i]['stateStatus']![0] == 'unvisited') {
          userMap.statesInfoList[i]['stateStatus']![0] = 'visited';
        } else if (userMap.statesInfoList[i]['stateStatus']![0] == 'visited') {
          userMap.statesInfoList[i]['stateStatus']![0] = 'unvisited';
        }
        notifyListeners();
        return;
      }
    }
    userMap.statesInfoList.add(newState);
    notifyListeners();
  }

  int count() {
    return _userMaps.length;
  }
}
