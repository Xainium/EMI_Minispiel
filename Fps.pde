class Fps{
 float lTime;

Fps(){
  lTime = millis();
}
float lastFrameTime(){ //gibt die Zeit zum letzten Frame in mSekunden wieder
  float aTime = millis();
  float result = aTime - lTime ;
  lTime = aTime;
  return result / 100;

}

}
