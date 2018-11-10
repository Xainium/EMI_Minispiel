class Menu{
  char background;
  boolean mainMenu = true;
  float y = height /5;
  float x = width/2 - 50;
  int rectWidth = 400;
  int rectHeight = 100;
  PVector bStart = new PVector(200,100);
  PVector bSettings = new PVector(200,250);
  PVector bQuit = new PVector(200,400);
  PVector bBack = new PVector(width-75, height-75);

  Menu(char background_in){
    background = background_in;
  }

  int checkPress(int mouse_x, int mouse_y){
    if(mainMenu){
      print(mouse_x + ", " + mouseX + " mouse_X und mouseX\n");
      if(mouse_x > bStart.x && mouse_x < bStart.x + rectWidth
         && mouse_y > bStart.y && mouse_y < bStart.y + rectHeight){

        return 1;
        }

        if(mouse_x > bSettings.x && mouse_x < bSettings.x + rectWidth
          && mouse_y > bSettings.y && mouse_y < bSettings.y + rectHeight){

          mainMenu = false;
        }

        if(mouse_x > bQuit.x && mouse_x < bQuit.x + rectWidth
            && mouse_y > bQuit.y && mouse_y < bQuit.y + rectHeight){

        return 3;
        }

        return -1;
    } else{
      if(mouse_x > bBack.x && mouse_x < bBack.x + 75
         && mouse_y > bBack.y && mouse_y < bBack.y + 75){
           mainMenu = true;
           background(background);
    }
    return -1;
  }
}
  void render(){
    if(mainMenu){
      background(background);
      fill(100, 150, 255);
      rect(bStart.x,bStart.y,rectWidth,rectHeight,10);
      fill(220);
      textSize(70);
      textAlign(CENTER,CENTER);
      text("Start",bStart.x + 200, bStart.y + 45);

      fill(100, 150, 255);
      rect(bSettings.x,bSettings.y,rectWidth,rectHeight,10);
      fill(220);
      textSize(70);
      textAlign(CENTER,CENTER);
      text("Settings",bSettings.x + 200, bSettings.y + 45);

      fill(100,150,255);
      rect(bQuit.x,bQuit.y,rectWidth,rectHeight,10);
      fill(220);
      textSize(70);
      textAlign(CENTER,CENTER);
      text("Quit",bQuit.x + 200, bQuit.y + 45);
    } else{
      rect(bBack.x, bBack.y,75,75);
    }
  }
}
