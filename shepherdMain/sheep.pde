class Sheep { 

  float threatPos;
  float threatTar;
  boolean inSafe;// changes if the sheep is in the safe place
  boolean display;
  int movePhase=0;
  float xpos;
  float ypos;
  float lastMoveX;
  float lastMoveY;
  float speed;
  float targetX;
  float targetY;
  // if exist = false, object doesnt move, but picks target.
  boolean exist;
  // gives some time for sheep to move away from the tree or lake if it was hit,
  // it's avoiding the bug of getting stuck
  int hit=0;

  // footprints variables

  float[] footprintsX = new float[20];
  float[] footprintsY = new float[20];
  float[] footprintsT = new float[20];
  int stamp=0;
  int currentStamp=0;

  Sheep(float tempTargetX, float tempTargetY, float tempXpos, float tempYpos, float tempSpeed) { 

    exist=false;
    threatPos=150;
    threatTar=200;
    inSafe=false;
    display=true;
    targetX=tempTargetX;
    targetY=tempTargetY;
    xpos = tempXpos;
    ypos = tempYpos;
    lastMoveX = xpos;
    lastMoveY = ypos;
    speed = tempSpeed;
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
      noStroke();
      strokeWeight(0);

      fill(0, footprintsT[i]);
      if (stamp==0&&footprintsT[i]>0) {
        footprintsT[i]-=10;
      }
      ellipseMode(CENTER);
      ellipse(footprintsX[i], footprintsY[i]+16, 6, 3);
    }
  }

  void display() {
    if (inSafe) {
      tint(255, 150, 150, 255);
    } else {
      tint(255, 255);
    }

    imageMode(CENTER);
    //animation

    //  line(xpos,ypos,xpos,ypos+15); // check where it stands
    if (targetX<xpos) {
      if (movePhase<=6) {
        image(sheep[0], xpos, ypos);
        movePhase++;
      } else if (movePhase<=12) {
        image(sheep[1], xpos, ypos);
        movePhase++;
      } else if (movePhase<=18) {
        image(sheep[2], xpos, ypos);
        movePhase++;
      } else if (movePhase<=24) {
        image(sheep[3], xpos, ypos);
        movePhase++;
        if (movePhase==25) {  
          movePhase=0;
        }
      }
    } else {
      if (movePhase<=6) {
        image(sheep[4], xpos, ypos);
        movePhase++;
      } else if (movePhase<=12) {
        image(sheep[5], xpos, ypos);
        movePhase++;
      } else if (movePhase<=18) {
        image(sheep[6], xpos, ypos);
        movePhase++;
      } else if (movePhase<=24) {
        image(sheep[7], xpos, ypos);
        movePhase++;
        if (movePhase==25) {  
          movePhase=0;
        }
      }
    }

    tint(255, 255);
  }//// end of display

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

    // if dog or wolf is closer then 150 pixels
    // then object checks if its target is closer then 150px to dog or wolf and changes it if it is
    // and escapes

    if (hit==0) {
      for (int d=0; d<dogs.length; d++) {
        if (dist(xpos, ypos, dogs[d].xpos, dogs[d].ypos)<threatPos) {
          if (dist(targetX, targetY, dogs[d].xpos, dogs[d].ypos)<threatTar) {
            do {
              targetX=xpos+round(random(-200, 200));
              targetY=ypos+round(random(-200, 200));
            } while (targetX<0||targetX>1000||targetY<0||targetY>600); // checking the map
          }
        }
      }
      for (int d=0; d<wolfs.length; d++) {
        if (dist(xpos, ypos, wolfs[d].xpos, wolfs[d].ypos)<threatPos) {
          if (dist(targetX, targetY, wolfs[d].xpos, wolfs[d].ypos)<threatTar) {
            do {
              targetX=xpos+round(random(-200, 200));
              targetY=ypos+round(random(-200, 200));
            } while (targetX<0||targetX>1000||targetY<0||targetY>600); // checking the map
          }
        }
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
        hit=20;
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
        hit=20;
      }
    }

    if (hit!=0) {
      hit--;
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
    /////////// end of drive
  }
}
/////////////// end of sheep class