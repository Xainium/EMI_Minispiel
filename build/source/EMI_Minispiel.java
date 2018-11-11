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
Player p1;
Player p2;

public void setup(){
  background(background);
  
//Player initialisieren
  p1 = new Player(50,height/2);
  p1.editColor(PApplet.parseChar(0), PApplet.parseChar(0), PApplet.parseChar(255));
  p2 = new Player(width -50, height/2);
  p2.editColor(PApplet.parseChar(255),PApplet.parseChar(0),PApplet.parseChar(0));
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
    background(background);
    if(keys[0]){
      p1.moveY(-1);
    }
    if(keys[1]){
      p1.moveX(-1);
    }
    if(keys[2]){
      p1.moveY(1);
    }
    if(keys[3]){
      p1.moveX(1);
    }
    if(keys[4]){
      p2.moveY(-1);
    }
    if(keys[5]){
      p2.moveX(-1);
    }
    if(keys[6]){
      p2.moveX(1);
    }
    if(keys[7]){
      p2.moveY(1);
    }
//zeichne und Update die Spieler
  p1.render();
  p1.updateShots();
  p2.render();
  p2.updateShots();
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
  if(key == 'ö'){
    keys[6]=true;
  }
  if(key == 'l'){
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
  if(key == 'ö'){
    keys[6]=false;
  }
  if(key == 'l'){
   keys[7]=false;
 }
//Schuss von Spieler Eins
 if(key == 'c'){
   p1.shoot();
 }
//Schuss von Spieler Zwei
 if(key == '-'){
   p2.shoot();
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
//neue Variabeln
  int life = 5;
  int vel = 4;
  PVector[] shots;
  int sSize = 0;

//Konstruktor
Player(int x, int y){
  pos.x = x;
  pos.y = y;
  shots = new PVector[8];
  for(int i=0; i < shots.length; i++){
    shots[i] = new PVector(-1,-1);
  }

}
public void editColor(char r_in, char g_in, char b_in){
  r = r_in;
  g = g_in;
  b = b_in;
}
public void moveX(int x){
  pos.x += vel*x;
}

public void moveY(int y){
  pos.y += vel*y;
}

public void render(){
  fill(r,g,b);
  ellipse(pos.x, pos.y, 30, 30);

}
//Ein neuer Schuss
public void shoot(){
  if(sSize == shots.length){
    sSize = 1;
  }else{
     sSize++;
  }
  shots[sSize-1].x = pos.x;
  shots[sSize-1].y = pos.y;
}


//wenn schonmal geschossen wurde üperprüfe alle Schüsse
public void updateShots(){
  for(int i=0; i < shots.length; i++){
    if(shots[i].x != -1 && shots[i].y != -1){
      shots[i].x ++;
      if(shots[i].x > width){
        shots[i].x = -1;
        shots[i].y = -1;
      }
//zeichne für jeden Schuss ein Viereck
      fill(r,g,b);
      rect(shots[i].x,shots[i].y,10,10);
    }
  }
}

}
class powerUp {
  PVector pos = new PVector(); //Powerpos
  int difficulty; //Schwierigkeit
  String levelDifficulty; //Powerspawn Negativ + Postiv oder eins von beiden
  String[] powerUpOptionsPositive = new String[]{"armor", "life", "speed", "shotSpeed", "shotBounce"}; //Positive Powerups
  String[] powerUpOptionsNegativ = new String[]{"slowness", "lifeSickness", "playerColorSwitch"}; //Negative Powerups;
  String powerUpChoose; //Powerup das gewählt wurde

  //Funktion zum auswwerten der Übergebenen Parameter
  public void powerUp(int tempDifficulty, String tempLevelDifficulty, String tempPowerUpType, String tempPowerUpChoose) {
    difficulty = tempDifficulty;
    levelDifficulty = tempLevelDifficulty;

    if (tempPowerUpChoose != null) {
      powerUpChoose = tempPowerUpChoose;
    } else {
      if (tempPowerUpType != null) {
        //powerUpChoose = randomPowerUp(tempPowerUpType);
      } else {
        //powerUpChoose = randomPowerUp();
      }
    }
  }

  public String setrRandomPowerUp(String tempPowerUpType) {
    if (tempPowerUpType != null) {

    } else {

    }
    return "Noch einzufügen";
  }



  public PVector setPos() {
    PVector pos = new PVector();
    do {
      pos.x = random(0, width);
      pos.y = random(0, height);
    } while (false); //Vervollständige

    return pos;
  }

  public PVector getPos() {
    return pos;
  }

  public void powerUpEffect(String powerUpChoose) {
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
