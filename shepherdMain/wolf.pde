class Wolf { 

  boolean display;
  int movePhase=0;
  float xpos;
  float ypos;
  float lastMoveX;
  float lastMoveY;
  float speed;
  float targetX;
  float targetY;
  boolean exist;

  // footprints variables

  float[] footprintsX = new float[20];
  float[] footprintsY = new float[20];
  float[] footprintsT = new float[20];
  int stamp=0;
  int currentStamp=0;

  Wolf(float tempXpos, float tempYpos, float tempSpeed) { 

    display=true;
    xpos = tempXpos;
    ypos = tempYpos;
    lastMoveX = xpos;
    lastMoveY = ypos;
    speed = tempSpeed;
    targetX=xpos;
    targetY=ypos;
    exist=false;
  }

  void showFootprints() {
    // footprints
    stamp++;
    if (stamp%10==0) {
      stamp=0;
      if (targetX!=xpos||targetY!=ypos) { // if object is moving
        footprintsX[currentStamp]=xpos;
        footprintsY[currentStamp]=ypos;
        footprintsT[currentStamp]=200;
        currentStamp++;
      }
      if (currentStamp==20) {
        currentStamp=0;
      }
    }

    for (int i=0; i<20; i++) {
      stroke(0, 0, 0);
      strokeWeight(0);

      fill(0, footprintsT[i]);
      if (stamp==0&&footprintsT[i]>0) {
        footprintsT[i]-=10;
      }
      ellipseMode(CENTER);
      ellipse(footprintsX[i], footprintsY[i]+15, 6, 3);
    }
  }

  void display() {

    imageMode(CENTER);

    // animation display

    if ( (((targetX-xpos)*(targetX-xpos))<4) && (((targetY-ypos)*(targetY-ypos))<4) ) {

      if (xpos<lastMoveX) {
        image(wolf[5], xpos, ypos);
      } else {
        image(wolf[0], xpos, ypos);
      }
    } else if (targetX<xpos) {

      if (movePhase<=4) {
        image(wolf[5], xpos, ypos);
        movePhase++;
      } else if (movePhase<=8) {
        image(wolf[6], xpos, ypos);
        movePhase++;
      } else if (movePhase<=12) {
        image(wolf[7], xpos, ypos);
        movePhase++;
      } else if (movePhase<=16) {
        image(wolf[8], xpos, ypos);
        movePhase++;
      } else if (movePhase<=20) {
        image(wolf[9], xpos, ypos);
        movePhase++;
      }
      if (movePhase==21) {  
        movePhase=0;
      }
    } else if (targetX>xpos) {

      if (movePhase<=4) {
        image(wolf[0], xpos, ypos);
        movePhase++;
      } else if (movePhase<=8) {
        image(wolf[1], xpos, ypos);
        movePhase++;
      } else if (movePhase<=12) {
        image(wolf[2], xpos, ypos);
        movePhase++;
      } else if (movePhase<=16) {
        image(wolf[3], xpos, ypos);
        movePhase++;
      } else if (movePhase<=20) {
        image(wolf[4], xpos, ypos);
        movePhase++;
      }
      if (movePhase==21) {  
        movePhase=0;
      }
    } else if (targetY!=ypos&&xpos>lastMoveX) {

      if (movePhase<=4) {
        image(wolf[0], xpos, ypos);
        movePhase++;
      } else if (movePhase<=8) {
        image(wolf[1], xpos, ypos);
        movePhase++;
      } else if (movePhase<=12) {
        image(wolf[2], xpos, ypos);
        movePhase++;
      } else if (movePhase<=16) {
        image(wolf[3], xpos, ypos);
        movePhase++;
      } else if (movePhase<=20) {
        image(wolf[4], xpos, ypos);
        movePhase++;
      }
      if (movePhase==21) {  
        movePhase=0;
      }
    } else if (targetY!=ypos&&xpos<lastMoveX) {

      if (movePhase<=4) {
        image(wolf[5], xpos, ypos);
        movePhase++;
      } else if (movePhase<=8) {
        image(wolf[6], xpos, ypos);
        movePhase++;
      } else if (movePhase<=12) {
        image(wolf[7], xpos, ypos);
        movePhase++;
      } else if (movePhase<=16) {
        image(wolf[8], xpos, ypos);
        movePhase++;
      } else if (movePhase<=20) {
        image(wolf[9], xpos, ypos);
        movePhase++;
      }
      if (movePhase==21) {  
        movePhase=0;
      }
    }//////////////// end of animation display
  }//// end of display method

  void drive() {

    //// picking a new target destination if previous has been reached  
    if (xpos==targetX&&ypos==targetY) {  
      // then it has to be inside the map
      if (xpos+moveX<0||xpos+moveX>1000||ypos+moveY<0||ypos+moveY>600 ) {
        // do nothing if the target is out of map
      } else {
        targetX=xpos+moveX;
        targetY=ypos+moveY;
      }
    }

    //////// collision with trees
    for (int i=0; i<40; i++) {
      if (xpos<treeArr[i].xpos+45&&
        xpos>treeArr[i].xpos-45&&
        ypos<treeArr[i].ypos+115&&
        ypos>treeArr[i].ypos+25) {

        targetX=lastMoveX;
        targetY=lastMoveY;
      }
    }

    //////// collision with water
    for (int i=0; i<10; i++) {
      if (xpos<waterArr[i].xpos+45&&
        xpos>waterArr[i].xpos-45&&
        ypos<waterArr[i].ypos+35&&
        ypos>waterArr[i].ypos-55) {

        targetX=lastMoveX;
        targetY=lastMoveY;
      }
    }

    ///// movement and last position
    if (exist) {
      if (xpos<targetX) {
        xpos=xpos+speed; 
        lastMoveX=xpos-1;
      }
      if (xpos>targetX) {
        xpos=xpos-speed;
        lastMoveX=xpos+1;
      }
      if (ypos<targetY) {
        ypos=ypos+speed; 
        lastMoveY=ypos-1;
      }
      if (ypos>targetY) {
        ypos=ypos-speed;
        lastMoveY=ypos+1;
      }
    }
  }///////// end of drive
}
/////////////// end of wolf class