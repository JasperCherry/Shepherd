class Bird { 

  int phase3;
  float xpos;
  float ypos;
  boolean directionR;
  float speed;
  float targetX;
  float targetY;
  float brakeTime; // makes a bird stop moving its wings from time to time

  Bird() { 

    if (round(random(0, 1))==0) {
      xpos=round(random(-500, -100));
      directionR=true;
    } else {
      xpos=round(random(1100, 1500));
      directionR=false;
    }

    ypos=round(random(100, 500));

    targetX=xpos;
    targetY=ypos;

    speed=1;
    brakeTime=0;
    phase3=0;
  }

  void display() {      /////////////////////////////////////////////////// display method
    imageMode(CENTER);

    if (brakeTime<200) {

      if (targetX<xpos) {
        if (phase3<=5) {
          image(bird[0], xpos, ypos);
          phase3++;
        } else if (phase3<=10) {
          image(bird[1], xpos, ypos);
          phase3++;
        } else if (phase3<=15) {
          image(bird[2], xpos, ypos);
          phase3++;
          if (phase3==16) {  
            phase3=0;
          }
        }
      } else {
        if (phase3<=5) {
          image(bird[3], xpos, ypos);
          phase3++;
        } else if (phase3<=10) {
          image(bird[4], xpos, ypos);
          phase3++;
        } else if (phase3<=15) {
          image(bird[5], xpos, ypos);
          phase3++;
          if (phase3==16) {  
            phase3=0;
          }
        }
      }
    } else if (brakeTime>=200) {

      if (targetX<xpos) {
        image(bird[0], xpos, ypos);
      } else {
        image(bird[3], xpos, ypos);
      }
    }

    brakeTime++;
    if (brakeTime==400) {
      brakeTime=0;
    }
  }//////////////////////////////////////////////////////////// end of display

  void drive() {  ///////////////////////////////////////////////////////// drive method

    //// picking a new target destination if previous has been reached  
    if (xpos==targetX&&ypos==targetY) {  
      // then it has to be outside the map
      if (directionR) {
        targetX=round(random(1100, 1500));
        directionR=false;
      } else {
        targetX=round(random(-500, -100));
        directionR=true;
      }

      targetY=round(random(100, 500));
    }

    ///// movement and last position

    if (xpos<targetX) {
      xpos=xpos+speed;
    }
    if (xpos>targetX) {
      xpos=xpos-speed;
    }
    if (ypos<targetY) {
      ypos=ypos+speed;
    }
    if (ypos>targetY) {
      ypos=ypos-speed;
    }

    //////////////////////////////////////////////////////////////// end of drive
  }
}
/////////////// end of bird class