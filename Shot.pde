class Shot{
  PVector pos = new PVector();
  PVector direction = new PVector();
  int speed = 4;

  Shot(){
    pos.x = -1;
    pos.y = -1;
    direction.x = 0;
    direction.y = 0;
  }

  void move(){
    if(direction.x != 0 || direction.y != 0){
        pos.x += direction.x*speed;
        pos.y += direction.y*speed;
    } else{
      pos.x += speed;
    }

  }
}
