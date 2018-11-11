class Player{
//Farbe des Spielers
  char r = 0;
  char g = 0;
  char b = 0;
//Übergebene Variabel
  PVector pos = new PVector();
//neue Variabeln
  int life = 5;
  int speed = 4;
  PVector lastVel = new PVector();
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
void editColor(char r_in, char g_in, char b_in){
  r = r_in;
  g = g_in;
  b = b_in;
}
void moveXY(int x, int y){
  pos.x += speed*x;
  pos.y += speed*y;
  lastVel = pos.copy();
}

void render(){
  fill(r,g,b);
  ellipse(pos.x, pos.y, 30, 30);

}
//Ein neuer Schuss
void shoot(){
  if(sSize == shots.length){
    sSize = 1;
  }else{
     sSize++;
  }
  shots[sSize-1].x = pos.x;
  shots[sSize-1].y = pos.y;
}


//wenn schonmal geschossen wurde üperprüfe alle Schüsse
void updateShots(){
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
