
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:who_is_spy/game_controller.dart';
import 'package:who_is_spy/play_page.dart';

class ConfigPage extends StatefulWidget {
  ConfigPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  int totalNum = 6;
  int spyNum = 2;
  bool hasWhite = false;
  static const int MIN_PLAYER = 5;
  List<int> minSpyNum = [0,1,1,1,1,1,
                          2,2,2,2,
                          3,3,3,3,
                          4,4,5];

  TextEditingController _totalController, _spyController;

  @override
  void initState() {
    super.initState();
    // _totalController = new TextEditingController(text: totalNum.toString());
    // _spyController = new TextEditingController(text: minSpyNum[totalNum-1].toString());
    // _totalController.addListener(() {
      // totalNum = int.parse(_totalController.text);
      // _spyController.value = TextEditingValue(text: minSpyNum[totalNum-1].toString());
    // });
  }


  void addTotalNum() {
    setState(() {
      totalNum += 1;
      totalNum = min(totalNum, minSpyNum.length);
      spyNum = max(spyNum, minSpyNum[totalNum]);
    });
  }

  void reduceTotalNum() {
    setState(() {
      totalNum -= 1;
      totalNum = max(totalNum, MIN_PLAYER);
      spyNum = min(spyNum, minSpyNum[totalNum]);
    });
  }

  void addSpyNum() {
    setState(() {
      spyNum += 1;
      spyNum = min(totalNum-1, spyNum);
    });
  }

  void reduceSpyNum() {
    setState(() {
      spyNum -= 1;
      spyNum = max(1, spyNum);
    });
  }

  void toggleHasWhiteBoard(bool value) {
    setState(() {
      hasWhite = value;
      spyNum = min(hasWhite?totalNum-2:totalNum-1, spyNum);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text('選擇人數'),
          Row(
            children: <Widget>[
              Text('總人數'),
              Text('$totalNum'),
              RawMaterialButton(
                onPressed: addTotalNum,
                child: const Text(
                  '+',
                  style: TextStyle(fontSize: 20)
                ),
                constraints: BoxConstraints(minHeight: 50, minWidth: 50),
              ),
              RawMaterialButton(
                onPressed: reduceTotalNum,
                child: const Text(
                  '-',
                  style: TextStyle(fontSize: 20)
                ),
                constraints: BoxConstraints(minHeight: 50, minWidth: 50),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text('臥底人數'),
              Text('$spyNum'),
              RawMaterialButton(
                onPressed: addSpyNum,
                child: const Text(
                  '+',
                  style: TextStyle(fontSize: 20)
                ),
                constraints: BoxConstraints(minHeight: 50, minWidth: 50),
              ),
              RawMaterialButton(
                onPressed: reduceSpyNum,
                child: const Text(
                  '-',
                  style: TextStyle(fontSize: 20)
                ),
                constraints: BoxConstraints(minHeight: 50, minWidth: 50),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text('加入白板'),
              Checkbox(onChanged: toggleHasWhiteBoard, value: hasWhite,),
            ],
          ),
          RaisedButton(
            onPressed: () {
              GameController().totalNum = totalNum;
              GameController().spyNum = spyNum;
              GameController().hasWhite = hasWhite;
              GameController().gameStart();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PlayPage()),
              );
            },
            child: const Text(
              '開始遊戲',
              style: TextStyle(fontSize: 20)
            ),
          ),
        ],
      )
  );
  }
}