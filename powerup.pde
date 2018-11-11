class powerUp {
  PVector pos = new PVector(); //Powerpos
  int difficulty; //Schwierigkeit
  String levelDifficulty; //Powerspawn Negativ + Postiv oder eins von beiden
  String[] powerUpOptionsPositive = new String[]{"armor", "life", "speed", "shotSpeed", "shotBounce"}; //Positive Powerups
  String[] powerUpOptionsNegativ = new String[]{"slowness", "lifeSickness", "playerColorSwitch"}; //Negative Powerups;
  String powerUpChoose; //Powerup das gewählt wurde

  //Funktion zum auswwerten der Übergebenen Parameter und setzen des PowerUpStatus
  void powerUp(int tempDifficulty, String tempLevelDifficulty, String tempPowerUpType, String tempPowerUpChoose) {
    difficulty = tempDifficulty;
    levelDifficulty = tempLevelDifficulty;

    if (tempPowerUpChoose != null) {
      powerUpChoose = tempPowerUpChoose;
    } else if (tempPowerUpType != null) {
      powerUpChoose = setRandomPowerUp(tempPowerUpType);
    } else {
      powerUpChoose = setRandomPowerUp(null);
    }
  }

  // Funktion um Random ein PowerUp zu generieren. Als Parameter kann übergeben werden ob das PowerUp positiv oder negativ sien soll.
  String setRandomPowerUp(String tempPowerUpType) {
    int powerUpOption;

    if (tempPowerUpType == "positive") {
      powerUpOption = int(random(0, powerUpOptionsPositive.length - 1));
      int intPowerUpOption = powerUpOption;
    } else if (tempPowerUpType == "negativ") {
      powerUpOption = int(random(0, powerUpOptionsNegativ.length - 1));
    } else {
      powerUpOption = int(random(0, powerUpOptionsPositive.length + powerUpOptionsNegativ.length - 1));
      if (powerUpOption >= powerUpOptionsPositive.length - 1) {
        powerUpOption -= powerUpOptionsPositive.length;
      } else {

      }
    }
    return powerUpOptionsPositive[powerUpOption];
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
