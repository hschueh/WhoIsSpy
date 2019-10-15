class GameController {
  GameController._privateConstructor();

  static final GameController _instance = GameController._privateConstructor();

  factory GameController(){
    return _instance;
  }

  int totalNum; // 0
  int spyNum; // 1
  bool hasWhite; // 2

  static const List<String> ROLE = ["一般人", "臥底", "白板仔"];

  List<String> answer = new List(3);// [2]固定是哭夭白板仔用的
  List<int> playerList;
  List<bool> playerStateList; // true: alive, false: dead
  List<int> rolesLeft = new List(4);

  void gameStart() async{
    // Init players role.
    playerList = new List(totalNum);
    playerList.fillRange(0, playerList.length, 0);
    if(hasWhite) {
      playerList[playerList.length-1] = 2;
    }
    playerList.fillRange(0, spyNum, 1);
    playerList.shuffle();
    playerStateList = new List(totalNum);
    playerStateList.fillRange(0, playerStateList.length, true);
    rolesLeft[0] = totalNum - spyNum - (hasWhite?1:0);
    rolesLeft[1] = spyNum;
    rolesLeft[2] = hasWhite?1:0;
    rolesLeft[3] = totalNum;
    // Players role init finished.

    // Get a question.
    answer[0] = "中秋節";
    answer[1] = "端午節";
    answer[2] = "白板笑你";
    // Somehow get a question finished.
  }

  void killPlayer(int index) {
    if(!playerStateList[index])
      return; // already dead
    playerStateList[index] = false;
    rolesLeft[playerList[index]] -= 1;
    rolesLeft[3] -= 1;
    if(rolesLeft[3] <= 3) {
      if(rolesLeft[2] > 0) {
        // white board wins;
        print("white board wins");
      } else if(rolesLeft[1] > 0) {
        // spy win;
        print("spy win");
      } else {
        // normal guys win;
        print("normal guys win");
      }
    } else if(rolesLeft[1] == 0) {
      if(rolesLeft[2] > 0) {
        // white board wins;
        print("white board wins");
      } else {
        // normal guys win;
        print("normal guys win");
      }
    }
    // do nothing
    print("Still playing. ${rolesLeft[0]}, ${rolesLeft[1]}, ${rolesLeft[2]}, ${rolesLeft[3]}");
  }
}