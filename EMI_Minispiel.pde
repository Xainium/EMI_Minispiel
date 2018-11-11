boolean isMenu = true;
char background = 255;
//Jedes Element im Array steht dafür ob eine Taste gedrückt wurde
boolean[] keys;
//Objekte
Menu menu;
Player[] p = new Player[2];

void setup(){
  background(background);
  size(800,600);
//Player initialisieren
  p[0] = new Player(50,height/2);
  p[0].editColor(char(0), char(0), char(255));
  p[1] = new Player(width -50, height/2);
  p[1].editColor(char(255),char(0),char(0));
//Menü initialisieren
  menu = new Menu(background, width, height);
  keys = new boolean[8];
  for(int i=0; i < keys.length; i++){
    keys[i] = false;
  }
}

void draw(){
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
  collision();
  p[0].render();
  p[0].updateShots();
  p[1].render();
  p[1].updateShots();
  }

}

void collision(){
  int j;
  for(int i=0; i < p.length; ++i){
    if(i == p.length -1){
      j = 0;
    } else{
      j = i+1;
    }

    float dist = p[i].pos.dist(p[j].pos);
    if(dist < p[i].radius){
      background(0);
/*
      PVector nDirection = new PVector();
      nDirection = p[i].lastVel.copy();
      nDirection.mult(-2*p[i].speed);
      p[i].pos.add(nDirection);

      nDirection = p[j].lastVel.copy();
      nDirection.mult(-2*p[j].speed);
      p[j].pos.add(nDirection);
*/
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
