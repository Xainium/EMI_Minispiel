class Player{
//Farbe des Spielers
  Color c;
//Übergebene Variabel
  PVector pos = new PVector();
//static Variabel
  static final int diameter = 30;
  static final int rad = 15;
//neue Variabeln
  boolean isMoving = false;
  int life = 5;
  int speed = 25;
  int armor = 0;
  int shotSpeed = 0;
  int shotCapacity = 0;
  boolean shotBounce = false;
  PVector lastVel = new PVector();
  Shot[] shots;
  int sSize = 0;

//Konstruktor
Player(int x, int y){
  c = new Color();
  pos.x = x;
  pos.y = y;
  shots = new Shot[8];
  for(int i=0; i < shots.length; i++){
    shots[i] = new Shot();
  }
}

void setColor(char r_in, char g_in, char b_in){
  c.r = r_in;
  c.g = g_in;
  c.b = b_in;
}

Color getColor() {
  return c;
}

void moveXY(int x, int y, float lastFrameTime){
  PVector tempPos = new PVector(); //Spielfeld Begrenzung, Spieler können nicht mehr außerhalb des Spielfeldes

  tempPos.x = pos.x + (speed*x)*lastFrameTime; //Temporäre position um erst zu überprüfen ob nicht Spielfeld Überrschritten wird
  tempPos.y = pos.y + (speed*y)*lastFrameTime; //Temporäre position um erst zu überprüfen ob nicht Spielfeld Überrschritten wird
  if ((tempPos.x <= width - rad) && (tempPos.x >= rad)) { //Abfrage ob Linker oder Rechter Rand erreicht -15 Spielerballgröße
    pos.x = tempPos.x; //"Globaler" Wert wird geändert Spielerballposition
  }
  if ((tempPos.y <= height - rad) && (tempPos.y >= rad)) { //Abfrage ob oberer oder unterere Rand erreicht -15 Spielerballgröße
    pos.y = tempPos.y; //"Golbaler" wert wird verändert Spielerballposition
  }

  lastVel.x = x;
  lastVel.y = y;
}

void render(PVector lifeBar){
  fill(c.r,c.g,c.b);
  ellipse(pos.x, pos.y, diameter, diameter);
  rect(lifeBar.x,lifeBar.y,life*30,30);
}


//Ein neuer Schuss
void shoot(){
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
void updateShots(float lastFrameTime){
  for(int i=0; i < shots.length; i++){
    if(shots[i].pos.x != -1 && shots[i].pos.y != -1){
      shots[i].move(lastFrameTime);
      if(shots[i].pos.x > width || shots[i].pos.x < 0 || shots[i].pos.y > height || shots[i].pos.y < 0){
        shots[i].pos.x = -1;
        shots[i].pos.y = -1;
      } else{
        //zeichne für jeden Schuss ein Viereck
        shots[i].render(c.r,c.g,c.b);
      }

    }
  }
}

}
