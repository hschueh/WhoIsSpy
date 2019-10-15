import 'package:flutter/material.dart';
import 'package:who_is_spy/game_controller.dart';

class PlayPage extends StatefulWidget {
  PlayPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PlayPageState createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  bool isPeekStage = true;
  bool isRevealed = false;
  int peekTurn = 0;
  @override
  Widget build(BuildContext context) {
    if(isPeekStage) {
      return Scaffold(
        body: Center(
          child:GestureDetector(
            onDoubleTap: () {
                setState(() {
                  isRevealed = !isRevealed;
                  if(!isRevealed)
                    peekTurn += 1;
                    
                  if(peekTurn == GameController().totalNum)
                    isPeekStage = false;
                });
              },
            child: Text(isRevealed?GameController().answer[GameController().playerList[peekTurn]]:"請 $peekTurn 號玩家請雙擊"),
          )
        )
      );
    } else {
      return Scaffold(
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: generateGrid()
        )
      );
    }
  }

  List<Widget> generateGrid() {
    List<Widget> ret = new List<Widget>(GameController().playerList.length);
    for(int i = 0; i < GameController().playerList.length; ++i) {
      ret[i] = GestureDetector(
        onTap: () {
          if(GameController().playerStateList[i]) {
            GameController().killPlayer(i);
            setState((){});
          } else
            print("$i Already dead.");
        },
        child: Container(
          color: GameController().playerStateList[i]?Colors.yellow[50]:Colors.grey,
          child: Center(
            child: Text('$i號'+(GameController().playerStateList[i]?"":"${GameController.ROLE[GameController().playerList[i]]}")),
          )
        )
      );
    }
    return ret;
  }
}