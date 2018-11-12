import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class EMI_Minispiel extends PApplet {

boolean isMenu = true;
char background = 255;
//Jedes Element im Array steht dafür ob eine Taste gedrückt wurde
boolean[] keys;
//Objekte
Menu menu;
Player[] p = new Player[2];
PowerUp[] pU = new PowerUp[1];

public void setup(){
  background(background);
  
//Player initialisieren
  p[0] = new Player(50,height/2);
  p[0].editColor(PApplet.parseChar(0), PApplet.parseChar(0), PApplet.parseChar(255));
  p[1] = new Player(width -50, height/2);
  p[1].editColor(PApplet.parseChar(255),PApplet.parseChar(0),PApplet.parseChar(0));
//PowerUp Single
  pU[0] = new PowerUp(null, null);
  pU[0].setPowerUpEffectPotency(3, "normal");
  pU[0].setPos();
  pU[0].setPowerUpImage();
//Menü initialisieren
  menu = new Menu(background, width, height);
  keys = new boolean[8];
  for(int i=0; i < keys.length; i++){
    keys[i] = false;
  }
}

public void draw(){
//Ist das Menü aktiv?
  if(isMenu){
    menu.render();
//Hauptspiel
  } else{
    //Abfrage welche Tasten gedrückt wurden
      //Spieler Eins //Keys 0-3
    //Wird 'W' (und 'A' oder 'D' gedrückt)
    if(keys[0]){
      if(keys[1]){
        p[0].moveXY(-1,-1);
      } else if(keys[3]){
        p[0].moveXY(1,-1);
      } else{
        p[0].moveXY(0,-1);
      }
        //Wird 'S' (und 'A' oder 'D' gedrückt)
        } else if(keys[2]){
          if(keys[1]){
            p[0].moveXY(-1,1);
          } else if(keys[3]){
            p[0].moveXY(1,1);
          } else{
            p[0].moveXY(0,1);
            }
      //Es wurden weder 'W' noch 'S' gedückt
      } else if(keys[1]){ //wurde nur 'A' gedrückt
          p[0].moveXY(-1,0);
      } else if(keys[3]){ //wurde nur 'D' gedrückt
          p[0].moveXY(1,0);
        }


    //Spieler Zwei //Keys 4-7
    if(keys[4]){ // wurde 'O' (und 'K' oder 'Ö' gedrückt)
      if(keys[5]){
        p[1].moveXY(-1,-1);
      } else if(keys[7]){
        p[1].moveXY(1,-1);
      } else{
        p[1].moveXY(0,-1);
      }
        //Wird 'L' (und 'K' oder 'Ö' gedrückt)
        } else if(keys[6]){
          if(keys[5]){
            p[1].moveXY(-1,1);
          } else if(keys[7]){
            p[1].moveXY(1,1);
          } else{
            p[1].moveXY(0,1);
            }
      //Es wurden weder 'O' noch 'l' gedückt
      } else if(keys[5]){ //wurde nur 'K' gedrückt
          p[1].moveXY(-1,0);
      } else if(keys[7]){ //wurde nur 'Ö' gedrückt
          p[1].moveXY(1,0);
        }
//zeichne und Update die Spieler
  background(background);
//  collisionPlayerAndPowerUp();
  p[0].render();
  p[0].updateShots();
  p[1].render();
  p[1].updateShots();

  //render von Single PowerUps
  pU[0].render();
  }
}

public void collisionPlayerAndPowerUp(){
  for(Player player : p){
    for(int i = 0; i < pU.length; ++i){
      for(int j = PApplet.parseInt(pU[i].pos.x) - PowerUp.iconRad; i <= PApplet.parseInt(pU[i].pos.x) + PowerUp.iconRad; ++j){
        for(int k = PApplet.parseInt(pU[i].pos.y) - PowerUp.iconRad; k <= PApplet.parseInt(pU[i].pos.y) + PowerUp.iconRad; ++k){
          if(new PVector(k,j).dist(player.pos) <= Player.rad/2){
            background(0);
          }
        }
      }
    }

  }
}

public void mouseReleased(){
  if(isMenu){
    int result;
    //Welcher Teil Im Menü wird angeklickt
    result = menu.checkPress(mouseX, mouseY);
    if(result != -1){
      switch (result){
        case 1: // der Start Button wurde geklickt
          isMenu = false;
          break;

        case 2: // der Settings Button wurde geklickt
          isMenu = true;
          break;

        case 3: // der Quit Button wurde geklickt
          isMenu = false;
          System.exit(0);
          break;
      }
    }
  }
}


public void keyPressed(){
  //Tasten von Spieler Eins
  if(key=='w'){
    keys[0]=true;
  }
  if(key=='a'){
    keys[1]=true;
  }
  if(key == 's'){
    keys[2]=true;
  }
  if(key == 'd'){
    keys[3]=true;
  }
  //Tasten von Spieler Zwei
  if(key == 'o'){
    keys[4]=true;
  }
  if(key == 'k'){
    keys[5]=true;
  }
  if(key == 'l'){
    keys[6]=true;
  }
  if(key == 'ö'){
    keys[7]=true;
  }

}


public void keyReleased(){
//Tasten von Spieler Eins
  if(key=='w'){
    keys[0]=false;
  }
  if(key=='a'){
    keys[1]=false;
  }
  if(key == 's'){
    keys[2]=false;
  }
  if(key == 'd'){
    keys[3]=false;
  }

//Tasten von Spieler Zwei
  if(key == 'o'){
    keys[4]=false;
  }
  if(key == 'k'){
    keys[5]=false;
  }
  if(key == 'l'){
   keys[6]=false;
 }
  if(key == 'ö'){
    keys[7]=false;
  }

//Schuss von Spieler Eins
 if(key == 'c'){
   p[0].shoot();
 }
//Schuss von Spieler Zwei
 if(key == '-'){
   p[1].shoot();
 }

}
class Menu{
//übergebene Variabeln
  char cbackground;
  int screenWidth;
  int screenHeight;
//neue Variabeln
  boolean mainMenuVisible = true;
  boolean settingsVisible = false;
  int rectWidth = 400;
  int rectHeight = 100;
  PVector bStart = new PVector(200,100);
  PVector bSettings = new PVector(200,250);
  PVector bQuit = new PVector(200,400);
  PVector bBack;
  int pressedColorPlayer1 = 0;
  int pressedColorPlayer2 = 0;

//Konstruktor
  Menu(char cbackground_in, int screenWidth_in, int screenHeight_in){
    cbackground = cbackground_in;
    screenWidth = screenWidth_in;
    screenHeight = screenHeight_in;

    bBack = new PVector(screenWidth-75, screenHeight-75);
  }
//Überprüfe ob Spieler Button gedrückt hat
  public int checkPress(int mouse_x, int mouse_y){
    if(mainMenuVisible){
      if(mouse_x > bStart.x && mouse_x < bStart.x + rectWidth
         && mouse_y > bStart.y && mouse_y < bStart.y + rectHeight){

        return 1; //Es wurde Start geklickt
        }

        if(mouse_x > bSettings.x && mouse_x < bSettings.x + rectWidth
          && mouse_y > bSettings.y && mouse_y < bSettings.y + rectHeight){

          mainMenuVisible = false;
          settingsVisible = true;
          return 2; //Es wurde Settings geklickt
        }

        if(mouse_x > bQuit.x && mouse_x < bQuit.x + rectWidth
            && mouse_y > bQuit.y && mouse_y < bQuit.y + rectHeight){

        return 3; //Es wurde Quit geklickt
        }

        return -1;
    } else if(settingsVisible){
      if(mouse_x > bBack.x && mouse_x < bBack.x + 75
         && mouse_y > bBack.y && mouse_y < bBack.y + 75){
           mainMenuVisible = true;
           settingsVisible = false;

        } else if(mouse_x > 50 && mouse_x < 50 + 300
           && mouse_y > 200 && mouse_y < 200 + 100){
             if(pressedColorPlayer1 < 3){
               pressedColorPlayer1++;
             } else{
               pressedColorPlayer1 = 0;
             }

           } else if(mouse_x > screenWidth- 350 && mouse_x < screenWidth- 50
              && mouse_y > 200 && mouse_y < 200 + 100){
                if(pressedColorPlayer2 < 3){
                  pressedColorPlayer2++;
                } else{
                  pressedColorPlayer2 = 1;
                }

              }
    return -1;
    }
    return -1;
  }
//zeichne aktuelles Munü
  public void render(){
    if(mainMenuVisible){
      background(cbackground);
      fill(100, 150, 255);
      rect(bStart.x,bStart.y,rectWidth,rectHeight,10);
      fill(220);
      textSize(70);
      textAlign(CENTER,CENTER);
      text("Start",bStart.x + 200, bStart.y + 45);

      fill(100, 150, 255);
      rect(bSettings.x,bSettings.y,rectWidth,rectHeight,10);
      fill(220);
      textSize(70);
      textAlign(CENTER,CENTER);
      text("Settings",bSettings.x + 200, bSettings.y + 45);

      fill(100,150,255);
      rect(bQuit.x,bQuit.y,rectWidth,rectHeight,10);
      fill(220);
      textSize(70);
      textAlign(CENTER,CENTER);
      text("Quit",bQuit.x + 200, bQuit.y + 45);

    } else if(settingsVisible){
      background(background);
      switch(pressedColorPlayer1){
        case 0:
          fill(100,150,255);
          break;
        case 1:
          fill(60,215,225);
          break;
        case 2:
          fill(155,230,85);
          break;
        case 3:
          fill(215,85,230);
          break;
      }

      rect(50,200,300,100);
      fill(225);
      textSize(50);
      textAlign(CENTER,CENTER);
      text("Spieler Eins",50 + 150,200 + 40);

      switch(pressedColorPlayer2){
        case 0:
          fill(100,150,255);
          break;
        case 1:
          fill(60,215,225);
          break;
        case 2:
          fill(155,230,85);
          break;
        case 3:
          fill(215,85,230);
          break;
      }
      rect(screenWidth- 350,200,300,100);
      fill(225);
      textSize(50);
      textAlign(CENTER,CENTER);
      text("Spieler Zwei",screenWidth- 350 + 150,200 + 40);

      fill(100,150,255);
      rect(bBack.x, bBack.y,75,75);

    }
  }
}
class Player{
//Farbe des Spielers
  char r = 0;
  char g = 0;
  char b = 0;
//Übergebene Variabel
  PVector pos = new PVector();
//static Variabel
  static final int rad = 30;
//neue Variabeln
  int life = 5;
  int speed = 4;
  PVector lastVel = new PVector();
  Shot[] shots;
  int sSize = 0;

//Konstruktor
Player(int x, int y){
  pos.x = x;
  pos.y = y;
  shots = new Shot[8];
  for(int i=0; i < shots.length; i++){
    shots[i] = new Shot();
  }

}

public void editColor(char r_in, char g_in, char b_in){
  r = r_in;
  g = g_in;
  b = b_in;
}

public void moveXY(int x, int y){
  PVector tempPos = new PVector(); //Spielfeld Begrenzung, Spieler können nicht mehr außerhalb des Spielfeldes
  tempPos.x = pos.x + speed*x; //Temporäre position um erst zu überprüfen ob nicht Spielfeld Überrschritten wird
  tempPos.y = pos.y + speed*y; //Temporäre position um erst zu überprüfen ob nicht Spielfeld Überrschritten wird
  if ((tempPos.x <= width - rad/2) && (tempPos.x >= rad/2)) { //Abfrage ob Linker oder Rechter Rand erreicht -15 Spielerballgröße
    pos.x = tempPos.x; //"Globaler" Wert wird geändert Spielerballposition
  }
  if ((tempPos.y <= height - rad/2) && (tempPos.y >= rad/2)) { //Abfrage ob oberer oder unterere Rand erreicht -15 Spielerballgröße
    pos.y = tempPos.y; //"Golbaler" wert wird verändert Spielerballposition
  }
  //pos.x += speed*x; //Kann gelöscht werden oder?
  //pos.y += speed*y; //Kann gelöscht werden oder?
  lastVel.x = x;
  lastVel.y = y;
}

public void render(){
  fill(r,g,b);
  ellipse(pos.x, pos.y, rad, rad);

}

//Ein neuer Schuss
public void shoot(){
  if(sSize == shots.length){
    sSize = 1;
  }else{
     sSize++;
  }
  shots[sSize-1].pos.x = pos.x;
  shots[sSize-1].pos.y = pos.y;
  shots[sSize-1].direction.x = lastVel.x;
  shots[sSize-1].direction.y = lastVel.y;
}

//wenn schonmal geschossen wurde üperprüfe alle Schüsse
public void updateShots(){
  for(int i=0; i < shots.length; i++){
    if(shots[i].pos.x != -1 && shots[i].pos.y != -1){
      shots[i].move();
      if(shots[i].pos.x > width || shots[i].pos.x < 0 || shots[i].pos.y > height || shots[i].pos.y < 0){
        shots[i].pos.x = -1;
        shots[i].pos.y = -1;
      }
//zeichne für jeden Schuss ein Viereck
      shots[i].render(r,g,b);
    }
  }
}

}
class Shot{
  PVector pos = new PVector();
  PVector direction = new PVector();
  int speed = 4;
  static final int rad = 10;

  Shot(){
    pos.x = -1;
    pos.y = -1;
    direction.x = 0;
    direction.y = 0;
  }

  public void move(){
    if(direction.x != 0 || direction.y != 0){
        pos.x += direction.x*speed;
        pos.y += direction.y*speed;
    } else{
      pos.x += speed;
    }
  }
  public void render(int r, int g, int b){
    fill(r,g,b);
    rect(pos.x, pos.y, rad, rad);
  }
}
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
  public void setRandomPowerUp(String tempPowerUpType) {
    int powerUpOption; //Funktionsvariable um das Richtige Element aus den PowerUpTabellen zu ziehen
    if (tempPowerUpType == "positive") {
      powerUpOption = PApplet.parseInt(random(0, powerUpOptionsPositive.length - 1));
      powerUpChoose = powerUpOptionsPositive[powerUpOption];
    } else if (tempPowerUpType == "negativ") {
      powerUpOption = PApplet.parseInt(random(0, powerUpOptionsNegativ.length - 1));
      powerUpChoose = powerUpOptionsNegativ[powerUpOption];
    } else {
      powerUpOption = PApplet.parseInt(random(0, powerUpOptionsPositive.length + powerUpOptionsNegativ.length - 1));
      if (powerUpOption >= powerUpOptionsPositive.length - 1) {
        powerUpOption -= powerUpOptionsPositive.length - 1;
        powerUpChoose = powerUpOptionsNegativ[powerUpOption];
      } else {
        powerUpChoose = powerUpOptionsPositive[powerUpOption];
      }
    }
  }

  //Gibt den PowerUp Effekt zurück
  public String getPowerUpChoose() {
    return powerUpChoose;
  }

  //Setzt die PowerUp Effekt Stärke/Potenz
  public void setPowerUpEffectPotency(int tempDifficulty, String tempLevelDifficulty) {
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
  public int getPowerUpEffectPotency() {
    return powerUpEffectPotency;
  }

  //Setzt Position den PowerUps
  public void setPos() {
    do {
      pos.x = random(50, width - 50);
      pos.y = random(50, height - 50);
    } while (false); //Vervollständige
  }

  //Gibt die Position des PowerUps zurück
  public PVector getPos() {
    return pos;
  }

  //Grafik für PowerUp wird geladen
  public void setPowerUpImage() {
    String tempPowerUpImg = "img/powerup/" + powerUpChoose + ".png";
    powerUpImg = loadImage(tempPowerUpImg);
  }

  //Render Funktion für das Objekt auf dem Spielfeld
  public void render() {
    imageMode(CENTER);
    image(powerUpImg, pos.x, pos.y, iconRad, iconRad);
  }
}
  public void settings() {  size(800,600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "EMI_Minispiel" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
