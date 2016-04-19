class Dog { 

  boolean display;
  int movePhase=0;
  float xpos;
  float ypos;
  float lastMoveX;
  float lastMoveY;
  float speed;
  int id;
  float targetX;
  float targetY;
  boolean exist;
  boolean patrolMode;
  float pTargetX;
  float pTargetY;

  // footprints variables

  float[] footprintsX = new float[20];
  float[] footprintsY = new float[20];
  float[] footprintsT = new float[20];
  int stamp=0;
  int currentStamp=0;

  Dog(float tempXpos, float tempYpos, float tempSpeed, int tempId) { 

    patrolMode=false;
    display=true;
    xpos = tempXpos;
    ypos = tempYpos;
    lastMoveX = xpos;
    lastMoveY = ypos;
    speed = tempSpeed;
    id = tempId;
    targetX=xpos;
    targetY=ypos;
    exist=true;
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
        image(dog[5], xpos, ypos);
      } else {
        image(dog[0], xpos, ypos);
      }
    } else if (targetX<xpos) {

      if (movePhase<=4) {
        image(dog[5], xpos, ypos);
        movePhase++;
      } else if (movePhase<=8) {
        image(dog[6], xpos, ypos);
        movePhase++;
      } else if (movePhase<=12) {
        image(dog[7], xpos, ypos);
        movePhase++;
      } else if (movePhase<=16) {
        image(dog[8], xpos, ypos);
        movePhase++;
      } else if (movePhase<=20) {
        image(dog[9], xpos, ypos);
        movePhase++;
      }
      if (movePhase==21) {  
        movePhase=0;
      }
    } else if (targetX>xpos) {

      if (movePhase<=4) {
        image(dog[0], xpos, ypos);
        movePhase++;
      } else if (movePhase<=8) {
        image(dog[1], xpos, ypos);
        movePhase++;
      } else if (movePhase<=12) {
        image(dog[2], xpos, ypos);
        movePhase++;
      } else if (movePhase<=16) {
        image(dog[3], xpos, ypos);
        movePhase++;
      } else if (movePhase<=20) {
        image(dog[4], xpos, ypos);
        movePhase++;
      }
      if (movePhase==21) {  
        movePhase=0;
      }
    } else if (targetY!=ypos&&xpos>lastMoveX) {

      if (movePhase<=4) {
        image(dog[0], xpos, ypos);
        movePhase++;
      } else if (movePhase<=8) {
        image(dog[1], xpos, ypos);
        movePhase++;
      } else if (movePhase<=12) {
        image(dog[2], xpos, ypos);
        movePhase++;
      } else if (movePhase<=16) {
        image(dog[3], xpos, ypos);
        movePhase++;
      } else if (movePhase<=20) {
        image(dog[4], xpos, ypos);
        movePhase++;
      }
      if (movePhase==21) {  
        movePhase=0;
      }
    } else if (targetY!=ypos&&xpos<lastMoveX) {

      if (movePhase<=4) {
        image(dog[5], xpos, ypos);
        movePhase++;
      } else if (movePhase<=8) {
        image(dog[6], xpos, ypos);
        movePhase++;
      } else if (movePhase<=12) {
        image(dog[7], xpos, ypos);
        movePhase++;
      } else if (movePhase<=16) {
        image(dog[8], xpos, ypos);
        movePhase++;
      } else if (movePhase<=20) {
        image(dog[9], xpos, ypos);
        movePhase++;
      }
      if (movePhase==21) {  
        movePhase=0;
      }
    }
    //////////////// end of animation display

    //// end of display method
  }

  void dogCircle() {
    ////// controling the dog
    if (swaper==id && !((key == 'R' || key == 'r') && keyPressed)) {
      // draw range circle
      stroke(0, 0, 0, 100);
      fill(0, 0);
      strokeWeight(2);
      ellipse(xpos, ypos, 250, 250);
    }

    if ((key == 'R' || key == 'r') && keyPressed) {
        stroke(0, 0, 0, 100);
        fill(0, 0);
        strokeWeight(2);
        ellipse(xpos, ypos, 250, 250);
    }
  }

  void drive() {

    /// setting new target
    if (mousePressed && mouseX>0 && mouseX < 1000 && mouseY>0 && mouseY<600) {  
      if ( ( (xpos-mouseX)*(xpos-mouseX) < 900 ) && ( (ypos-mouseY)*(ypos-mouseY) < 900) && (mouseButton == LEFT) ) {
        int toss=floor(random(0, 2));
        // sound trigering while selecting dog
        if (!bark1.isPlaying()&&!bark2.isPlaying()) {
          if (toss==1) {
            bark1.rewind();
            bark1.play();
          } else if (toss==0) {
            bark2.rewind();
            bark2.play();
          }
        }
        swaper=id;
        // dog will stay in its place and disable patrol mode
        targetX=xpos;
        targetY=ypos;
        patrolMode=false;
      } else if (swaper==id && (mouseButton == RIGHT) ) {
        targetX=mouseX;
        targetY=mouseY;
        if ((key == 'Q' || key == 'q') && keyPressed) {
          patrolMode=true;
          pTargetX=xpos;
          pTargetY=ypos;
        } else {
          patrolMode=false;
        }
      } else if (swaper==id && mouseButton == LEFT) {
        swaper=0;
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
      // patroling mode
      if (patrolMode&&targetX==xpos&&targetY==ypos) {
        targetX=pTargetX;
        targetY=pTargetY;
        pTargetX=xpos;
        pTargetY=ypos;
      }
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
}/////////////// end of dog class