import 'dart:convert';

import '../models/user_map.dart';

class JsonEncoder {
  //UserMaps userMaps;
  //UserMapsList(this.userMaps);

  String toJson(UserMaps userMaps) {
    final userMap = userMaps.maps;

    Map<String, dynamic> jsonString = {
      'stateSelected': userMaps.currentStateSelected,
      'currentId': userMaps.currentId,
      'userMap': [
        for (int i = 0; i < userMap.length; i++)
          {
            'mapTitle': userMap[i].title,
            'mapId': userMap[i].id,
            'stateInformation': [
              for (int y = 0; y < userMap[i].statesInfoList.length; y++)
                {
                  'stateName':
                      userMap[i].statesInfoList[y]['stateName']![0].toString(),
                  'stateStatus': userMap[i]
                      .statesInfoList[y]['stateStatus']![0]
                      .toString(),
                  'stateRating': userMap[i]
                      .statesInfoList[y]['stateRating']![0]
                      .toString(),
                  'stateTags': [
                    if (userMap[i].statesInfoList[y]['stateTags']!.isNotEmpty)
                      for (int x = 0;
                          x < userMap[i].statesInfoList[y]['stateTags']!.length;
                          x++)
                        {
                          'stateTag':
                              '${userMap[i].statesInfoList[y]['stateTags']![x]}'
                        }
                  ]
                }
            ]
          }
      ]
    };

    print('saved');
    return json.encode(jsonString);
  }
}
