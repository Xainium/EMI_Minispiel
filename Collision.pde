static class Collision{

  static boolean pointInRect(PVector point, PVector posR, int rWidth, int rHeight){
    return (point.x >= posR.x && point.x <= posR.x + rWidth && point.y >= posR.y && point.y <= posR.y + rHeight); //<>//
  }
  static boolean pointInCircle(PVector point, PVector posC, int cRad){
    return (PVector.dist(point,posC) <= cRad);
  }
  static boolean circleAndcircle(PVector pos0, int rad0, PVector pos1, int rad1){
    if(pos0.dist(pos1) <= rad0/2 + rad1/2){
      return true;
    }
    return false;
  }
  static int pointInCircleAndRect(PVector point, PVector posR, int rWidth, int rHeight, PVector posC, int cRad){
    if(pointInRect(point,posR,rWidth,rHeight)){ //<>//
      if(pointInCircle(point,posC,cRad)){
        return 2;
      } else{
        return 1;
      }
    }else{
      return 0;
    }
  }
  static boolean circleAndRectangle(PVector posC, int cRad, PVector posR, int rWidth, int rHeight){ //posC == Position des Kreises (circle), posR == Position des Rechtecks (rect)

  PVector posC0 = new PVector(posC.x-cRad,posC.y-cRad);
  boolean collision = false;
  if(rectangleAndRectangle(posC0,cRad*2,cRad*2,posR, rWidth, rHeight)){
    collision = true;
    if(((posR.x > posC.x && posR.y > posC.y)) && pointInCircleAndRect(posR,posC0,2*cRad,2*cRad,posC,cRad) == 1){ //<>//
      if((posR.x+rWidth >= posC.x + cRad && posR.y + rHeight >= posC.y +cRad)){
        collision = false;;
      }
    }
    if((posR.x+rWidth < posC.x && posR.y > posC.y)&& (pointInCircleAndRect(new PVector(posR.x+rWidth,posR.y),posC0,2*cRad,2*cRad,posC,cRad) == 1)){
      if((posR.x <= posC.x-cRad && posR.y + rHeight >= posC.y +cRad)){
        collision = false;;
      }
    }

    if((posR.x+rWidth < posC.x && posR.y +rHeight < posC.y)&& (pointInCircleAndRect(new PVector(posR.x + rWidth, posR.y + rHeight),posC0,2*cRad,2*cRad,posC,cRad) == 1)){
      if((posR.x <= posC.x-cRad && posR.y <= posC.y - cRad)){
         collision = false;;
      }
    }

    if((posR.x < posC.x && posR.y +rHeight < posC.y)&& (pointInCircleAndRect(new PVector(posR.x, posR.y + rHeight),posC0,2*cRad,2*cRad,posC,cRad) == 1)){
      if((posR.x + rWidth >= posC.x + cRad && posR.y <= posC.y - cRad)){
         collision = false;;
      }
    }

  }
    return collision;
}

  static boolean rectangleAndRectangle (PVector pos0, int rWidth0, int rHeight0,PVector pos1, int rWidth1, int rHeight1){

    return pos0.x <= pos1.x + rWidth1  &&
           pos1.x <= pos0.x + rWidth0  &&
           pos0.y <= pos1.y + rHeight1 &&
           pos1.y <= pos0.y + rHeight0;
  }
}
