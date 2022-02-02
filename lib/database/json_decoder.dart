import 'dart:convert';

import '../models/user_map.dart';

class JsonDecoder {
  UserMaps toUserMaps(String jsonString) {
    var decodedJson = UserMaps('', '', []);

    final jsonPairs = json.decode(jsonString);

    decodedJson.currentStateSelected = jsonPairs['stateSelected'];
    decodedJson.currentId = jsonPairs['currentId'];

    jsonPairs['userMap'].forEach(
      (value) => decodedJson.addUserMap(),
    );

    var userMap = decodedJson.maps;

    for (int i = 0; i < userMap.length; i++) {
      print(jsonPairs['userMap'][i]['mapTitle']);
      userMap[i].title = jsonPairs['userMap'][i]['mapTitle'];
      userMap[i].id = jsonPairs['userMap'][i]['mapId'];
      for (int y = 0;
          y < jsonPairs['userMap'][i]['stateInformation'].length;
          y++) {
        final stateName =
            jsonPairs['userMap'][i]['stateInformation'][y]['stateName'];
        final stateStatus =
            jsonPairs['userMap'][i]['stateInformation'][y]['stateStatus'];
        final stateRating =
            jsonPairs['userMap'][i]['stateInformation'][y]['stateRating'];

        decodedJson.addSelectedState(
            stateName, stateStatus, userMap[i].id, stateRating);

        if (jsonPairs['userMap'][i]['stateInformation'][y]['stateTags'] !=
            null) {
          for (int x = 0;
              x <
                  jsonPairs['userMap'][i]['stateInformation'][y]['stateTags']
                      .length;
              x++) {
            var tagText = jsonPairs['userMap'][i]['stateInformation'][y]
                ['stateTags'][x]['stateTag'];
            decodedJson.addStateTag(
                stateName, tagText.toString(), userMap[i].id);
          }
        }
      }

      ;
    }
    return decodedJson;
  }
}
