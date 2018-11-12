class PowerUp {
  PVector pos = new PVector(); //Powerpos
  static final int iconRad = 50;
  int difficulty; //Schwierigkeit
  int powerUpEffectPotency; //Die Wirksamkeit/potenz/Stärke des PowerUps
  String levelDifficulty; //Powerspawn Negativ + Postiv oder eins von beiden
  String[] powerUpOptionsPositive = new String[]{"armor", "life", "speed", "shotSpeed", "shotBounce", "shotHighCapacity"}; //Positive Powerups
  String[] powerUpOptionsNegativ = new String[]{"slowness", "lifeSickness", "playerColorSwitch", "shotLowCapacity"}; //Negative Powerups; //playerColorSwitch später vllt. playerIconSwitch
  String powerUpChoose; //Powerup das gewählt wurde
  PImage powerUpImg; //Img Variable zum laden des PowerUpsImg

  //Funktion zum auswwerten der Übergebenen Parameter und setzen des PowerUpStatus
  PowerUp(String tempPowerUpType, String tempPowerUpChoose) {
    if (tempPowerUpChoose != null) {
      powerUpChoose = tempPowerUpChoose;
    } else if (tempPowerUpType != null) {
      setRandomPowerUp(tempPowerUpType);
    } else {
      setRandomPowerUp(null);
    }
  }

  // Funktion um Random ein PowerUp zu generieren. Als Parameter kann übergeben werden ob das PowerUp positiv oder negativ sien soll.
  void setRandomPowerUp(String tempPowerUpType) {
    int powerUpOption; //Funktionsvariable um das Richtige Element aus den PowerUpTabellen zu ziehen
    if (tempPowerUpType == "positive") {
      powerUpOption = int(random(0, powerUpOptionsPositive.length - 1));
      powerUpChoose = powerUpOptionsPositive[powerUpOption];
    } else if (tempPowerUpType == "negativ") {
      powerUpOption = int(random(0, powerUpOptionsNegativ.length - 1));
      powerUpChoose = powerUpOptionsNegativ[powerUpOption];
    } else {
      powerUpOption = int(random(0, powerUpOptionsPositive.length + powerUpOptionsNegativ.length - 1));
      if (powerUpOption >= powerUpOptionsPositive.length - 1) {
        powerUpOption -= powerUpOptionsPositive.length - 1;
        powerUpChoose = powerUpOptionsNegativ[powerUpOption];
      } else {
        powerUpChoose = powerUpOptionsPositive[powerUpOption];
      }
    }
  }

  //Gibt den PowerUp Effekt zurück
  String getPowerUpChoose() {
    return powerUpChoose;
  }

  //Setzt die PowerUp Effekt Stärke/Potenz
  void setPowerUpEffectPotency(int tempDifficulty, String tempLevelDifficulty) {
    int tempPowerUpEffectPotency;
    switch (tempLevelDifficulty) {
      case "easy":
        powerUpEffectPotency = tempDifficulty + 2;
      case "normal":
        powerUpEffectPotency = tempDifficulty;
      case "hard":
        if (tempDifficulty >= 3) {
          powerUpEffectPotency = tempDifficulty - 2;
        } else if (tempDifficulty >= 2) {
          powerUpEffectPotency = tempDifficulty - 1;
        } else {
          powerUpEffectPotency = tempDifficulty;
        }
    }
  }

  //Gibt die PowerUp Effekt Stärke/Potenz zurück
  int getPowerUpEffectPotency() {
    return powerUpEffectPotency;
  }

  //Setzt Position den PowerUps
  void setPos() {
    do {
      pos.x = random(50, width - 50);
      pos.y = random(50, height - 50);
    } while (false); //Vervollständige
  }

  //Gibt die Position des PowerUps zurück
  PVector getPos() {
    return pos;
  }

  //Grafik für PowerUp wird geladen
  void setPowerUpImage() {
    String tempPowerUpImg = "img/powerup/" + powerUpChoose + ".png";
    powerUpImg = loadImage(tempPowerUpImg);
  }

  //Render Funktion für das Objekt auf dem Spielfeld
  void render() {
    imageMode(CENTER);
    image(powerUpImg, pos.x, pos.y, iconRad, iconRad);
  }
}
