boolean isMenu = true;
char background = 255;
//Jedes Element im Array steht dafür ob eine Taste gedrückt wurde
boolean[] keys;
//Objekte
Menu menu;
Player p1;
Player p2;

void setup(){
  background(background);
  size(800,600);
//Player initialisieren
  p1 = new Player(50,height/2);
  p1.editColor(char(0), char(0), char(255));
  p2 = new Player(width -50, height/2);
  p2.editColor(char(255),char(0),char(0));
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
  if(key == 'ö'){
    keys[6]=true;
  }
  if(key == 'l'){
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
