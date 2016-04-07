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

  Dog(float tempXpos, float tempYpos, float tempSpeed, int tempId) { 

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
    if (swaper==id) {
      // draw range circle
      stroke(0, 0, 0);
      fill(0, 0);
      strokeWeight(2);
      ellipse(xpos, ypos, 250, 250);
    }

    if ((key == 'R' || key == 'r') && keyPressed) {
      for (int i=0; i<dogs.length; i++) {
        stroke(0, 0, 0);
        fill(0, 0);
        strokeWeight(2);
        ellipse(dogs[i].xpos, dogs[i].ypos, 250, 250);
      }
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
        targetX=xpos;
        targetY=ypos;
      } else if (swaper==id && (mouseButton == RIGHT) ) {
        targetX=mouseX;
        targetY=mouseY;
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