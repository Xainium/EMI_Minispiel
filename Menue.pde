class Menu{
//übergebene Variabeln
  char cbackground;
  int screenWidth;
  int screenHeight;
//neue Variabeln
  PImage backgroundImage;
  boolean mainMenuVisible = true;
  boolean settingsVisible = false;
  int rectWidth = 400;
  int rectHeight = 100;
  PVector bStart = new PVector(200,100);
  PVector bSettings = new PVector(200,250);
  PVector bQuit = new PVector(200,400);
  PVector bBack;
  int pressedColorPlayer1 = 0;
  int pressedColorPlayer2 = 0;

//Konstruktor
  Menu(char cbackground_in, int screenWidth_in, int screenHeight_in){
    cbackground = cbackground_in;
    screenWidth = screenWidth_in;
    screenHeight = screenHeight_in;
    backgroundImage = loadImage("img/menu/menuBackground.jpeg");
    bBack = new PVector(screenWidth-75, screenHeight-75);
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
      if(mouse_x > bBack.x && mouse_x < bBack.x + 75
         && mouse_y > bBack.y && mouse_y < bBack.y + 75){
           mainMenuVisible = true;
           settingsVisible = false;

        } else if(mouse_x > 50 && mouse_x < 50 + 300
           && mouse_y > 200 && mouse_y < 200 + 100){
             if(pressedColorPlayer1 < 3){
               pressedColorPlayer1++;
             } else{
               pressedColorPlayer1 = 0;
             }

           } else if(mouse_x > screenWidth- 350 && mouse_x < screenWidth- 50
              && mouse_y > 200 && mouse_y < 200 + 100){
                if(pressedColorPlayer2 < 3){
                  pressedColorPlayer2++;
                } else{
                  pressedColorPlayer2 = 1;
                }

              }
    return -1;
    }
    return -1;
  }
//zeichne aktuelles Munü
  void render(){
    if(mainMenuVisible){
      image(backgroundImage,0,0);
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
      background(background);
      switch(pressedColorPlayer1){
        case 0:
          fill(100,150,255);
          break;
        case 1:
          fill(60,215,225);
          break;
        case 2:
          fill(155,230,85);
          break;
        case 3:
          fill(215,85,230);
          break;
      }

      rect(50,200,300,100);
      fill(225);
      textSize(50);
      textAlign(CENTER,CENTER);
      text("Spieler Eins",50 + 150,200 + 40);

      switch(pressedColorPlayer2){
        case 0:
          fill(100,150,255);
          break;
        case 1:
          fill(60,215,225);
          break;
        case 2:
          fill(155,230,85);
          break;
        case 3:
          fill(215,85,230);
          break;
      }
      rect(screenWidth- 350,200,300,100);
      fill(225);
      textSize(50);
      textAlign(CENTER,CENTER);
      text("Spieler Zwei",screenWidth- 350 + 150,200 + 40);

      fill(100,150,255);
      rect(bBack.x, bBack.y,75,75);

    }
  }
}
