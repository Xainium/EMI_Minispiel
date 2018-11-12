class Player{
//Farbe des Spielers
  char r = 0;
  char g = 0;
  char b = 0;
//Übergebene Variabel
  PVector pos = new PVector();
//statische Variabel
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
void editColor(char r_in, char g_in, char b_in){
  r = r_in;
  g = g_in;
  b = b_in;
}
void moveXY(int x, int y){
  pos.x += speed*x;
  pos.y += speed*y;
  lastVel.x = x;
  lastVel.y = y;
  print("lastVel: " + lastVel.x + ", "+ lastVel.y + "\n");
}

void render(){
  fill(r,g,b);
  ellipse(pos.x, pos.y, rad, rad);

}
//Ein neuer Schuss
void shoot(){
  if(sSize == shots.length){
    sSize = 1;
  }else{
     sSize++;
  }
  print("pos X/Y: "+ pos.x +" + " + pos.y + "\n");
  shots[sSize-1].pos.x = pos.x;
  shots[sSize-1].pos.y = pos.y;
  print("lastVel X/Y: "+ lastVel.x +" + " + lastVel.y +"\n");
  shots[sSize-1].direction.x = lastVel.x;
  shots[sSize-1].direction.y = lastVel.y;
}


//wenn schonmal geschossen wurde üperprüfe alle Schüsse
void updateShots(){
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
