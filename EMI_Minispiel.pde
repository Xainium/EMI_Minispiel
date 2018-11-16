//import der Soundlibary zum Abspielen von Backgroundmusic und anderen Sounds
import processing.sound.*;
//Sound wird deklariert
// SoundFile backGroundMusic;
// String backGroundMusicPath = "sound/background";
// File backGroundMusicPathFile;
// String[] backGroundMusicList;

GameSoundEffect backGroundMusic = new GameSoundEffect();

boolean isMenu = true;
boolean gameRunning = false;
char background = 255;
//Jedes Element im Array steht dafür ob eine Taste gedrückt wurde
boolean[] keys;
//Objekte
Menu menu;
Fps fps;
Player[] p = new Player[2];
PowerUp[] pU = new PowerUp[1];

void setup(){
  background(background);
  size(800,600);
  fps = new Fps();
  //Menü initialisieren
  menu = new Menu(background, width, height);
  keys = new boolean[8];
  for(int i=0; i < keys.length; i++){
    keys[i] = false;
  }

  // //BackGroundMusic Initialisiert
  // backGroundMusicPathFile = new File(sketchPath("/" + backGroundMusicPath));
  // backGroundMusicList = backGroundMusicPathFile.list();
  // //println(backGroundMusicList);
  // backGroundMusic = new SoundFile(this, backGroundMusicPath + "/" + backGroundMusicList[int(random(0, backGroundMusicList.length - 1))]);
  // backGroundMusic.amp(0.05);
  // //backGroundMusic.play();
  backGroundMusic = new GameSoundEffect("sound/background");
  backGroundMusic.setVolume(0.125);
  // backGroundMusic.soundStart();
}

void draw(){
  float lastFrameTime = fps.lastFrameTime();
  // music();
  backGroundMusic.soundStart();
  //Ist das Menü aktiv?
  if(isMenu){
    cursor();
    menu.render();
  } else{
      //Hauptspiel
    gameRunning = isGameOver();
  if(gameRunning){
    noCursor();
    //Abfrage welche Tasten gedrückt wurden
    movePlayer(lastFrameTime);
    //zeichne und Update die Spieler
    background(background);
    collisionPlayerAndPlayer();
    collisionPlayerAndShots();
    p[0].render(new PVector(0,0));
    p[0].updateShots(lastFrameTime);
    p[1].render(new PVector(width-p[1].life*30,0));
    p[1].updateShots(lastFrameTime);
    //render von Single PowerUps
    pU[0].render();
  } else{
    cursor();
  }
}
}
void startNewGame(){
  //Player initialisieren
  p[0] = new Player(50,height/2);
  p[0].setColor(char(0), char(0), char(255));
  p[0].lastVel = new PVector(1,0);
  p[1] = new Player(width -50, height/2);
  p[1].setColor(char(255),char(0),char(0));
  p[1].lastVel = new PVector(-1,0);
  //PowerUp Single
  pU[0] = new PowerUp();
  pU[0].setPowerUpEffectPotency(3, "normal");
  pU[0].setPos();
  pU[0].setPowerUpImage();
}
boolean isGameOver(){
  for(int i= 0; i <p.length; ++i){
    if(p[i].life <= 0){
      gameRunning = false;
      gameOver(++i);
      return false;
    }
  }

  return true;
}
void gameOver(int player){

  background(background);
  for(int i=0; i < width; i+=20){
    line(0,height,i,0);
  }
  for(int j=0; j < width; j+=20){
    line(0,height,width,j);
  }

  fill(100);
  textAlign(CENTER,CENTER);
  textSize(100);
  text("Game Over",width/2,height/2-60-25);
  textSize(60);
  textAlign(CENTER,CENTER);
  text("Spieler " + (player-1) +" hat verloren!",width/2,height/2+60-15);
}
void movePlayer(float lastFrameTime){
  //Spieler Eins //Keys 0-3
  boolean playerInput = true;
  //Wird 'W' (und 'A' oder 'D' gedrückt)
  if(keys[0]){
    if(keys[1]){
      p[0].moveXY(-1,-1, lastFrameTime);
    } else if(keys[3]){
      p[0].moveXY(1,-1,lastFrameTime);
    } else{
      p[0].moveXY(0,-1,lastFrameTime);
    }
      //Wird 'S' (und 'A' oder 'D' gedrückt)
      } else if(keys[2]){
        if(keys[1]){
          p[0].moveXY(-1,1, lastFrameTime);
        } else if(keys[3]){
          p[0].moveXY(1,1, lastFrameTime);
        } else{
          p[0].moveXY(0,1, lastFrameTime);
          }
    //Es wurden weder 'W' noch 'S' gedückt
    } else if(keys[1]){ //wurde nur 'A' gedrückt
        p[0].moveXY(-1,0, lastFrameTime);
    } else if(keys[3]){ //wurde nur 'D' gedrückt
        p[0].moveXY(1,0, lastFrameTime);
      } else{
        playerInput= false;
      }
      p[0].isMoving = playerInput;

  //Spieler Zwei //Keys 4-7
  playerInput = true;
  if(keys[4]){ // wurde 'O' (und 'K' oder 'Ö' gedrückt)
    if(keys[5]){
      p[1].moveXY(-1,-1, lastFrameTime);
    } else if(keys[7]){
      p[1].moveXY(1,-1, lastFrameTime);
    } else{
      p[1].moveXY(0,-1, lastFrameTime);
    }
      //Wird 'L' (und 'K' oder 'Ö' gedrückt)
      } else if(keys[6]){
        if(keys[5]){
          p[1].moveXY(-1,1, lastFrameTime);
        } else if(keys[7]){
          p[1].moveXY(1,1, lastFrameTime);
        } else{
          p[1].moveXY(0,1, lastFrameTime);
          }
    //Es wurden weder 'O' noch 'l' gedückt
    } else if(keys[5]){ //wurde nur 'K' gedrückt
        p[1].moveXY(-1,0, lastFrameTime);
    } else if(keys[7]){ //wurde nur 'Ö' gedrückt
        p[1].moveXY(1,0, lastFrameTime);
      } else{
        playerInput = false;
      }
      p[1].isMoving = playerInput;

}

// void music() {
//   if (!(backGroundMusic.isPlaying())) {
//     println(!(backGroundMusic.isPlaying()));
//     String tempMusic;
//     tempMusic = backGroundMusicList[int(random(0, backGroundMusicList.length - 0.0001))];
//     backGroundMusic = new SoundFile(this, backGroundMusicPath + "/" + tempMusic);
//     backGroundMusic.amp(0.05);
//     println(tempMusic);
//     backGroundMusic.play();
//   }
// }

void collisionPlayerAndPlayer(){
  while(p[0].pos.dist(p[1].pos) <= 2*Player.rad){
    print("muss verschoben werden " + (p[0].pos.x + Player.rad) + " ist gleich " + (p[1].pos.x - Player.rad) + "\n");
    if(p[0].isMoving)
      p[0].pos.x += p[0].lastVel.x * -1;
      p[0].pos.y += p[0].lastVel.y * -1;

    if(p[1].isMoving){
      p[1].pos.x += p[1].lastVel.x * -1;
      p[1].pos.y += p[1].lastVel.y * -1;
    }
  }
//  print("muss nicht mehr verschoben werden \n");
}
void collisionPlayerAndShots(){
  for (int i=0; i < p[1].shots.length; ++i){
    if(!p[1].shots[i].pos.equals(new PVector(-1,-1))){
      if(p[0].pos.dist(p[1].shots[i].pos) <= Player.rad + Shot.rad){
              p[0].life--;
              p[1].shots[i].pos.x = -1;
              p[1].shots[i].pos.y = -1;
      }
    }
  }
  for (int i=0; i < p[0].shots.length; ++i){
    if(!p[0].shots[i].pos.equals(new PVector(-1,-1))){
      if(p[1].pos.dist(p[0].shots[i].pos) <= Player.rad + Shot.rad){
        p[1].life--;
        p[0].shots[i].pos.x = -1;
        p[0].shots[i].pos.y = -1;
      }
    }
  }
}

void mouseReleased(){
  if(isMenu){
    int result;
    //Welcher Teil Im Menü wird angeklickt
    result = menu.checkPress(mouseX, mouseY);
    if(result != -1){
      switch (result){
        case 1: // der Start Button wurde geklickt
          isMenu = false;
          gameRunning = true;
          startNewGame();
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
  } else if(!gameRunning){
    isMenu = true;
    gameRunning = false;
    startNewGame();
  }
}

void keyPressed(){
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

void keyReleased(){
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
