class powerUp {
  PVector pos = new PVector(); //Powerpos
  int difficulty; //Schwierigkeit
  String levelDifficulty; //Powerspawn Negativ + Postiv oder eins von beiden
  String[] powerUpOptionsPositive = new String[]{"armor", "life", "speed", "shotSpeed", "shotBounce"}; //Positive Powerups
  String[] powerUpOptionsNegativ = new String[]{"slowness", "lifeSickness", "playerColorSwitch"}; //Negative Powerups;
  String powerUpChoose; //Powerup das gewählt wurde

  //Funktion zum auswwerten der Übergebenen Parameter
  void powerUp(int tempDifficulty, String tempLevelDifficulty, String tempPowerUpType, String tempPowerUpChoose) {
    difficulty = tempDifficulty;
    levelDifficulty = tempLevelDifficulty;

    if (tempPowerUpChoose != null) {
      powerUpChoose = tempPowerUpChoose;
    } else {
      if (tempPowerUpType != null) {
        powerUpChoose = randomPowerUp(tempPowerUpType);
      } else {
        powerUpChoose = randomPowerUp();
      }
    }
  }

  String setrRandomPowerUp(String tempPowerUpType) {
    if (tempPowerUpType != null) {

    } else {

    }
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

  void powerUpEffect(powerUpChoose) {
    switch
  }
}
