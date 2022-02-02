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
  var currentStateSelected;
  var currentId;
  List<UserMap> _userMaps = [
    UserMap(
      'New Map',
      UniqueKey().toString(),
      [],
    ),
  ];

  UserMaps(this.currentStateSelected, this.currentId, this._userMaps);

  List<UserMap> get maps {
    return [..._userMaps];
  }

  updateUserMaps(UserMaps newUserMaps) {
    currentStateSelected = newUserMaps.currentStateSelected;
    currentId = newUserMaps.currentId;
    _userMaps = newUserMaps._userMaps;
    notifyListeners();
  }

  String getUserMapName(String mapId) {
    final userMap = _userMaps.firstWhere((map) => map.id == mapId);
    return userMap.title;
  }

  String getNumberOfStatesSelected(String mapId) {
    var statesVisitedCounter = 0;
    final userMap = _userMaps.firstWhere((map) => map.id == mapId);
    for (var i = 0; i < userMap.statesInfoList.length; i++) {
      if (userMap.statesInfoList[i]['stateStatus']![0] == 'visited') {
        statesVisitedCounter++;
      }
    }
    return statesVisitedCounter.toString();
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

  List getStateTags(String stateName, String mapId) {
    final userMap = _userMaps.firstWhere((map) => map.id == mapId);
    for (var i = 0; i < userMap.statesInfoList.length; i++) {
      if (userMap.statesInfoList[i]['stateName']![0].toString() == stateName) {
        //print(selectedStates[i]['stateName']);
        return userMap.statesInfoList[i]['stateTags']!;
      }
    }
    return [];
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

  deleteStateTag(String stateName, String tagName, String mapId) {
    final userMap = _userMaps.firstWhere((map) => map.id == mapId);
    for (var i = 0; i < userMap.statesInfoList.length; i++) {
      if (userMap.statesInfoList[i]['stateName']?[0].toString() == stateName) {
        print(userMap.statesInfoList[i]['stateTags']);
        userMap.statesInfoList[i]['stateTags']!.remove(tagName);
        print(userMap.statesInfoList[i]['stateTags']);
        notifyListeners();
      }
    }
  }

  addUserMap() {
    _userMaps.add(
      UserMap(
        'New Map',
        UniqueKey().toString(),
        [],
      ),
    );
    notifyListeners();
  }

  deleteUserMap(String mapId) {
    if (_userMaps.length > 1) {
      _userMaps.removeWhere((userMap) => userMap.id == mapId);
      notifyListeners();
    }
  }

  int getUserMapsCount() {
    return _userMaps.length;
  }

  changeUserMapName(String mapId, String newTitle) {
    final userMap = _userMaps.firstWhere((userMap) => userMap.id == mapId);
    userMap.title = newTitle;
    notifyListeners();
  }

  List<Map<String, List>> getStatesSelected(String mapId) {
    final userMap = _userMaps.firstWhere((map) => map.id == mapId);
    return userMap.statesInfoList;
  }

  updateStateRating(String stateName, String stateRating, String mapId) {
    final userMap = _userMaps.firstWhere((map) => map.id == mapId);
    for (var i = 0; i < userMap.statesInfoList.length; i++) {
      if (userMap.statesInfoList[i]['stateName']![0] == stateName) {
        userMap.statesInfoList[i]['stateRating']![0] = stateRating;
        notifyListeners();
      }
    }
  }

  String getStateRating(String stateName, String mapId) {
    final userMap = _userMaps.firstWhere((map) => map.id == mapId);
    for (var i = 0; i < userMap.statesInfoList.length; i++) {
      if (userMap.statesInfoList[i]['stateName']![0] == stateName) {
        return userMap.statesInfoList[i]['stateRating']![0].toString();
      }
    }
    return '0';
  }

  addSelectedState(
      String stateName, String stateStatus, String mapId, String? stateRating) {
    final userMap = _userMaps.firstWhere((map) => map.id == mapId);
    for (var i = 0; i < userMap.statesInfoList.length; i++) {
      if (userMap.statesInfoList[i]['stateName']![0] == stateName) {
        notifyListeners();
        return;
      }
    }

    var rating;
    if (stateRating != null) {
      rating = stateRating;
    } else {
      rating = 0;
    }
    Map<String, List> newState = {
      'stateName': [stateName],
      'stateStatus': [stateStatus],
      'stateRating': [rating],
      'stateTags': [],
    };
/*
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
*/

    userMap.statesInfoList.add(newState);
    notifyListeners();
  }

  updateStateStatus(String mapId, String stateName, String stateStatus) {
    final userMap = _userMaps.firstWhere((map) => map.id == mapId);
    for (var i = 0; i < userMap.statesInfoList.length; i++) {
      if (userMap.statesInfoList[i]['stateName']![0] == stateName) {
        userMap.statesInfoList[i]['stateStatus']![0] = stateStatus;
        notifyListeners();
        return;
      }
    }
  }

  int count() {
    return _userMaps.length;
  }
}
