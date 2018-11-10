class powerUp {
  PVector pos = new PVector(); //Powerpos
  int difficulty; //Schwierigkeit
  String levelDifficulty; //Powerspawn Negativ + Postiv oder eins von beiden
  String[] powerUpOptionsPositive = new String[]{"armor", "life", "speed", "shotSpeed", "shotBounce"}; //Positive Powerups
  String[] powerUpOptionsNegativ = new String[]{"slowness", "lifeSickness", "playerColorSwitch"}; //Negative Powerups;
  String powerupChoose; //Powerup das gewählt wurde

  //Funktion zum auswwerten der Übergebenen Parameter
  void powerUp(int tempP1X, int tempP1Y, int tempP2X, int tempP2Y, int tempDifficulty, String tempLevelDifficulty) {
    difficulty = tempDifficulty;
    levelDifficulty = tempLevelDifficulty;
  }
  
  PVector setPos() {
    PVector pos = new PVector();
    do {
      pos.x = random(0, width);
      pos.y = random(0, height);
    } while (false); //Vervollständige

    return pos;
  }

  PVector getPos() {
    return pos;
  }
}
