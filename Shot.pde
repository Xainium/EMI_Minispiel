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

  void move(){
    if(direction.x != 0 || direction.y != 0){
        pos.x += direction.x*speed;
        pos.y += direction.y*speed;
    } else{
      pos.x += speed;
    }
  }
  void render(int r, int g, int b){
    fill(r,g,b);
    rect(pos.x, pos.y, rad, rad);
  }
}
