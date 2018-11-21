static class Collision{

  static boolean circleAndcircle(PVector pos0, int rad0, PVector pos1, int rad1){
    if(pos0.dist(pos1) <= rad0/2 + rad1/2){
      return true;
    }
    return false;
  }

  static boolean circleAndRectangle(PVector posC, int cRad, PVector posR, int rWidth, int rHeight){ //posC == Position des Kreises (circle), posR == Position des Rechtecks (rect)
    for(float x = posR.x; x <= posR.x + rWidth; ++x){
      if(dist(x, posR.y, posC.x, posC.y) <= cRad){
        return true;
      }
    }

    for(float y = posR.y; y <= posR.y + rHeight; ++y){
      if(dist(posR.x, y, posC.x, posC.y) <= cRad){
        return true;
      }
    }

    for(float x = posR.x; x <= posR.x + rWidth; ++x){
      if(dist(x, posR.y + rHeight, posC.x, posC.y) <= cRad){
        return true;
      }
    }

    for(float y = posR.y; y <= posR.y + rHeight; ++y){
      if(dist(posR.x + rWidth, y, posC.x, posC.y) <= cRad){
        return true;
      }
    }
    return false;
  }

  static boolean rectangleAndRectangle(PVector pos0, int rWidth0, int rHeight0,PVector pos1, int rWidth1, int rHeight1){
    if( (pos0.x >= pos1.x ) && (pos0.x + rWidth0 <= pos1.x + rWidth1) &&  (pos0.y >= pos1.y) && (pos0.y + rHeight0 <= pos1.y + rHeight1) ){
      return true;
    }
    return false;
  }
}
