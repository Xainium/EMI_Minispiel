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
  PowerUp() {
    setRandomPowerUp(null);
  }

  PowerUp(String tempPowerUpType) {
    if ((tempPowerUpType == "positive") || (tempPowerUpType == "negativ")) {
      setRandomPowerUp(tempPowerUpType);
    } else {
      powerUpChoose = tempPowerUpType;
    }
  }

  // Funktion um Random ein PowerUp zu generieren. Als Parameter kann übergeben werden ob das PowerUp positiv oder negativ sien soll.
  void setRandomPowerUp(String tempPowerUpType) {
    int powerUpOption; //Funktionsvariable um das Richtige Element aus den PowerUpTabellen zu ziehen
    if (tempPowerUpType == "positive") {
      powerUpOption = int(random(0, powerUpOptionsPositive.length - 0.0001));
      powerUpChoose = powerUpOptionsPositive[powerUpOption];
    } else if (tempPowerUpType == "negativ") {
      powerUpOption = int(random(0, powerUpOptionsNegativ.length - 0.0001));
      powerUpChoose = powerUpOptionsNegativ[powerUpOption];
    } else {
      powerUpOption = int(random(0, powerUpOptionsPositive.length + powerUpOptionsNegativ.length - 0.0001));
      println(powerUpOption);
      if (powerUpOption > powerUpOptionsPositive.length - 1) {
        powerUpOption = powerUpOption - powerUpOptionsPositive.length;
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
        break;
      case "normal":
        powerUpEffectPotency = tempDifficulty;
        break;
      case "hard":
        if (tempDifficulty >= 3) {
          powerUpEffectPotency = tempDifficulty - 2;
        } else if (tempDifficulty >= 2) {
          powerUpEffectPotency = tempDifficulty - 1;
        } else {
          powerUpEffectPotency = tempDifficulty;
        }
        break;
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

  void powerUpAcitvation(Player p) {
    switch (powerUpChoose) {
      case "armor":
        p.armor += powerUpEffectPotency;
        break;
      case "life":
        p.life += powerUpEffectPotency;
        break;
      case "speed":
        p.speed += powerUpEffectPotency;
        break;
      case "shotSpeed":
        p.shotSpeed += powerUpEffectPotency;
        break;
      case "shotBounce":
        p.shotBounce = true;
        break;
      case "shotHighCapacity":
        p.shotCapacity += powerUpEffectPotency;
        break;
      case "slowness":
        p.speed -= powerUpEffectPotency;
        break;
      case "lifeSickness":
        p.life -= powerUpEffectPotency;
        break;
      case "playerColorSwitch":
        //char temp[] = p.getColor();
        break;
      case "shotLowCapacity":
        p.shotCapacity -= powerUpEffectPotency;
        break;
    }
  }
}
