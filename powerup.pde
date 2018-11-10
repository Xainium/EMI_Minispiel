class powerUp {
  int[] s = new int[]{0,1};
//  s = new int[]{0,1};
  int posX; //posX (width)
  int posY; //posY (height) von Powerup
  int p1X, p1Y, p2X, p2Y; //Spieler Postionen
  int difficulty; //Schwierigkeit
  String levelDifficulty; //Powerspawn Negativ + Postiv oder eins von beiden
  String[] powerUpOptionsPositive; //[0][i]Positive und [1][i]Negative Powerups
  String[] powerUpOptionsNegativ;
  String powerupChoose; //Powerup das gewählt wurde

  //Funktion zum auswwerten der Übergebenen Parameter
  void powerUp(int tempP1X, int tempP1Y, int tempP2X, int tempP2Y, int tempDifficulty, String tempLevelDifficulty) {
    p1X = tempP1X;
    p1Y = tempP1Y;
    p2X = tempP2X;
    p2Y = tempP2Y;
    difficulty = tempDifficulty;
    levelDifficulty = tempLevelDifficulty;
  }

//  powerUpOptionsPositive = {"armor", "life", "speed", "shotSpeed", "shotBounce"}; //Positive Powerups
  //powerUpOptionsNegativ = {"slowness", "lifeSickness", "playerColorSwitch"}; //Negative Powerups

  PVector position(){
    PVector pos = new PVector();
    do {
      pos.x = random(0, width);
      posX = random(0, height);
    } while (false); //Vervollständige

    return pos;
  }
}
