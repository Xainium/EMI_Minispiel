class TextAnimation{
  private int background;
  private int frames;
  private PVector pos;
  private int size;
  private String text;
  private boolean isSubText;
  private String subText;
  private int sizeSubText;
  private PFont font;
  private int textPos = 1;
  private  int timeToNextFrame = 40;
  private boolean finished = false;

  TextAnimation(PVector pos_in, String text_in,int timeToNextFrame_in, int size_in, PFont font_in, char background_in){
     pos = pos_in.copy();
     text = new String(text_in);
     timeToNextFrame = timeToNextFrame_in;
     size = size_in;
     frames =frameCount;
     font =font_in;
     background = background_in;
     isSubText = false;
   }
   TextAnimation(PVector pos_in, String text_in, int size_in, String subText_in,int sizeSubText_in, int timeToNextFrame_in,  PFont font_in, char background_in){
      pos = pos_in.copy();
      text = new String(text_in);
      subText = new String(subText_in);
      sizeSubText = sizeSubText_in;
      timeToNextFrame = timeToNextFrame_in;
      size = size_in;
      frames =frameCount;
      font =font_in;
      background = background_in;
      isSubText = true;
    }

  void setString(String text_in){
    text = new String(text_in);
  }
  void nextFrame(){
    if(frames + timeToNextFrame <= frameCount){
     updateSprite();
     frames = frameCount;
    }
  }

  boolean updateSprite(){
    background(background);
    textFont(font);
    textAlign(CENTER,CENTER);
    textSize(size);

    if(finished){
      fill(0);
      text(text,pos.x,pos.y);

    } else{
      String tempS = text.substring(0,textPos);
      fill(0);
      text(tempS,pos.x,pos.y);
      textPos++;
      if(textPos > text.length()){
        finished =true;
      }
    }
    return finished;
  }

}
