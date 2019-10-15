class GameController {
  GameController._privateConstructor();

  static final GameController _instance = GameController._privateConstructor();

  factory GameController(){
    return _instance;
  }

  int totalNum; // 0
  int spyNum; // 1
  bool hasWhite; // 2

  List<String> answer = new List(2);

  List<int> playerList;

  void gameStart() async{
    // Init players role.
    playerList = new List(totalNum);
    playerList.setAll(0, [0]);
    if(hasWhite) {
      playerList[0] = 2;
      playerList.setRange(1, spyNum, [1]);
    } else {
      playerList.setRange(0, spyNum-1, [1]);
    }
    playerList.shuffle();
    // Players role init finished.


    // Get a question.

    // Somehow get a question finished.
  }
}