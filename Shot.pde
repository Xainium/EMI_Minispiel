class Shot{
  PVector pos = new PVector();
  PVector direction = new PVector();
  int speed = 30;
  static final int diameter = 10;
  static final int rad = diameter/2;

  Shot(){
    pos.x = -1;
    pos.y = -1;
    direction.x = 0;
    direction.y = 0;
  }

  void move(float lastFrameTime){
    if(direction.x != 0 && direction.y != 0){

        pos.x += (direction.x * 0.70710678)*speed* lastFrameTime;
        pos.y += (direction.y * 0.70710678)*speed * lastFrameTime;
    } else{
      pos.x += (direction.x*speed)* lastFrameTime;
      pos.y += (direction.y*speed) * lastFrameTime;
    }
  }
  void render(int r, int g, int b){
    fill(r,g,b);
    rect(pos.x, pos.y, diameter, diameter);
  }
}
