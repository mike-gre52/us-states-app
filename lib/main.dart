import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/choose_map_screen.dart';
import '../screens/select_states_screen.dart';
import './models/user_map.dart';
import './database/json_decoder.dart';
import './database/database.dart';
import './database/json_encoder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: UserMaps('AK', firstId, usermap),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'SairaCondensed',
        ),
        home: MyHomePage(),
        routes: {
          SelectStatesScreen.routeName: (ctx) => SelectStatesScreen(),
          ChooseMapScreen.routeName: (ctx) => ChooseMapScreen(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //const MyHomePage({Key? key, required this.title}) : super(key: key);

  //final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String? loadedData;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      final userMaps = Provider.of<UserMaps>(context, listen: false);
      print('running');
      final iD = UniqueKey().toString();
      List<UserMap> userMap = [
        UserMap(
          'New Map',
          iD,
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
      //MapDatabase().writeToDatabase(JsonEncoder().toJson(UserMaps('AK', iD, userMap)));

      MapDatabase().readFile().then((value) => {
            if (value != null)
              {
                //print(value),
                userMaps.updateUserMaps(JsonDecoder().toUserMaps(value)),
              }
            else
              {
                //print('null'),
                MapDatabase().writeToDatabase(
                    JsonEncoder().toJson(UserMaps('AK', iD, userMap))),
                //userMaps.updateUserMaps(UserMaps('AK', iD, userMap)),
              }
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SelectStatesScreen();
  }
}
