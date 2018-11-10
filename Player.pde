class Player{

  PVector pos = new PVector();
  int live = 5;
  int vel = 4;
  PVector[] shots;
  int sSize = 0;

Player(int x, int y){
  pos.x = x;
  pos.y = y;
  shots = new PVector[8];
  for(int i=0; i < shots.length; i++){
    shots[i] = new PVector(-1,-1);
  }

}
void moveX(int x){
  pos.x += vel*x;
}

void moveY(int y){
  pos.y += vel*y;
}

void render(){
  ellipse(pos.x, pos.y, 30, 30);
}

void shoot(){
  if(sSize == shots.length){
    sSize = 1;
  }else{
     sSize++;
  }
  shots[sSize-1].x = pos.x;
  shots[sSize-1].y = pos.y;
}



void updateShots(){
  for(int i=0; i < shots.length; i++){
    if(shots[i].x != -1 && shots[i].y != -1){
      shots[i].x ++;
      if(shots[i].x > width){
        shots[i].x = -1;
        shots[i].y = -1;
      }
      rect(shots[i].x,shots[i].y,10,10);
    }


  }
}

}
