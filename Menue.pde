class Menu{
//übergebene Variabeln
  char cbackground;
  int screenWidth;
  int screenHeight;
//neue Variabeln
  PImage backgroundImage;
  boolean mainMenuVisible = true;
  boolean settingsVisible = false;
  boolean isMusic = true;
  int rectWidth = 400;
  int rectHeight = 100;
  PVector bStart = new PVector(200,100);
  PVector bSettings = new PVector(200,250);
  PVector bMusic = new PVector(200,250);
  PVector bQuit = new PVector(200,400);
  PVector bBack = new PVector(200,400);
  int pressedColorPlayer1 = 0;
  int pressedColorPlayer2 = 0;

//Konstruktor
  Menu(char cbackground_in, int screenWidth_in, int screenHeight_in){
    cbackground = cbackground_in;
    screenWidth = screenWidth_in;
    screenHeight = screenHeight_in;
    backgroundImage = loadImage("img/menu/menuBackground.jpeg");
    //bBack = new PVector(screenWidth-120, screenHeight-100);
  }
//Überprüfe ob Spieler Button gedrückt hat
  int checkPress(int mouse_x, int mouse_y){
    if(mainMenuVisible){
      if(mouse_x > bStart.x && mouse_x < bStart.x + rectWidth
         && mouse_y > bStart.y && mouse_y < bStart.y + rectHeight){

        return 1; //Es wurde Start geklickt
        }

        if(mouse_x > bSettings.x && mouse_x < bSettings.x + rectWidth
          && mouse_y > bSettings.y && mouse_y < bSettings.y + rectHeight){

          mainMenuVisible = false;
          settingsVisible = true;
          return 2; //Es wurde Settings geklickt
        }

        if(mouse_x > bQuit.x && mouse_x < bQuit.x + rectWidth
            && mouse_y > bQuit.y && mouse_y < bQuit.y + rectHeight){

        return 3; //Es wurde Quit geklickt
        }

        return -1;
    } else if(settingsVisible){
      if(Collision.pointInRect(new PVector(mouse_x,mouse_y), bMusic,rectWidth,rectHeight)){
        isMusic = !isMusic;
      }
      if(Collision.pointInRect(new PVector(mouse_x,mouse_y), bBack,rectWidth,rectHeight)){
        mainMenuVisible = true;
        settingsVisible = false;
      }
    return -1;
    }
    return -1;
  }
//zeichne aktuelles Munü
  void render(){
    image(backgroundImage,0,0);
    if(mainMenuVisible){

      fill(100, 150, 255);
      rect(bStart.x,bStart.y,rectWidth,rectHeight,10);
      fill(220);
      textFont(retroFont);
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

    } else if(settingsVisible){

      fill(100, 150, 255);
      rect(bMusic.x,bMusic.y,rectWidth,rectHeight,10);
      fill(220);
      textFont(retroFont);
      textSize(70);
      textAlign(LEFT,CENTER);
      if(isMusic){
        text("Music        On",bMusic.x+20, bMusic.y + 45);
      } else{
        text("Music        Off",bMusic.x+20, bMusic.y + 45);
      }


      fill(100, 150, 255);
      rect(bQuit.x,bQuit.y,rectWidth,rectHeight,10);
      fill(220);
      textFont(retroFont);
      textSize(70);
      textAlign(CENTER,CENTER);
      text("Back",bQuit.x + 200, bQuit.y + 45);

    }
  }
}
