void playMusic() {
  if (!gameSongs[currentSong].isPlaying()) {
    gameSongs[currentSong].rewind();
    currentSong++;
    if (currentSong==4) {
      currentSong=0;
    }
    gameSongs[currentSong].play();
  }
}

void rainCheck() {
  XML root=loadXML("http://www.yr.no/place/United_Kingdom/Scotland/Edinburgh/forecast.xml");
  XML item1=root.getChild("forecast");                     
  XML item2=item1.getChild("tabular");                       
  XML items[]=item2.getChildren("time");                 
  XML item4=items[0].getChild("symbol"); 
  temp1=item4.getString("name");
}

void dogControl() {
  for (int i=0; i<dogs.length; i++) {
    dogs[i].dogCircle();
  }
}


void displayAllObjects() {//displays dogs, wolfs, bird, sheeps, trees, lakes

  // water
  for (int i=0; i<waterArr.length; i++) {
    waterArr[i].display();
  }

  // dogs, wolfs, sheeps, bird
  moveAllMovingObjects();
  displayAllMovingObjects();

  // trees
  for (int i=0; i<treeArr.length; i++) {
    treeArr[i].display();
  }
  bird1.drive();
  bird1.display();
  dogControl();// has to be last one to make the circle always visible
}


void createAllObjects() {//creates dogs, wolfs, bird, sheeps, trees, lakes
  //lakes
  for (int i=0; i<waterArr.length; i++) {
    waterArr[i] = new Water(-1000, -1000);
  }
  //trees
  for (int i=0; i<treeArr.length; i++) {
    treeArr[i] = new Tree(-1000, -1000);
  }
  // bird
  bird1 = new Bird();
  /////  wolfs
  for (int i=0; i<wolfs.length; i++) {
    wolfs[i] = new Wolf(-1000, -1000, 1);
  }
  ///// sheeps
  for (int i=0; i<sheeps.length; i++) {
    sheeps[i] = new Sheep(700, 700, 1100, 700, 1);
  }
  // restarting variables responsible for the control
  // of the sheeps in the beginning of each level
  sheepReleaseT=10;
  sheepReleased=0;
  //////////////// creating dog objects
  dogs[5] = new Dog(200, 140, 1, objID);
  objID++;
  dogs[4] = new Dog(100, 140, 1, objID);
  objID++;
  dogs[3] = new Dog(150, 140, 1, objID);
  objID++;
  dogs[2] = new Dog(50, 140, 1, objID);
  objID++;
  dogs[1] = new Dog(100, 100, 1, objID); 
  objID++;
  dogs[0] = new Dog(100, 180, 1, objID); 
  objID++;
}

void moveAllMovingObjects() { // except the bird
  // dogs
  for (int i=0; i<dogs.length; i++) {
    dogs[i].drive();
    dogs[i].drive();
  }
  //wolfs
  for (int i=0; i<wolfs.length; i++) {
    wolfs[i].drive();
    wolfs[i].drive();
  }
  //sheeps
  int soundTrigger=0;
  sheepsStart();  
  for (int i=0; i<sheeps.length; i++) {
    sheeps[i].drive();
    for (int d=0; d<dogs.length; d++) {
      if (dist(sheeps[i].xpos, sheeps[i].ypos, dogs[d].xpos, dogs[d].ypos)<sheeps[i].threatPos) {
        sheeps[i].drive();
        soundTrigger++;
      }
    }
    for (int d=0; d<wolfs.length; d++) {
      if (dist(sheeps[i].xpos, sheeps[i].ypos, wolfs[d].xpos, wolfs[d].ypos)<sheeps[i].threatPos) {
        sheeps[i].drive();
        soundTrigger++;
      }
    }
    // sound trigering if at least 9 sheeps are running double speed
    if (!sheep1.isPlaying()&&soundTrigger>8) {
      sheep1.rewind();
      sheep1.play();
    }
  }
}


void displayAllMovingObjects() { // except the bird

  for (int x=0; x<dogs.length; x++) {
    dogs[x].display=true;
  }
  for (int x=0; x<sheeps.length; x++) {
    sheeps[x].display=true;
  }
  for (int x=0; x<wolfs.length; x++) {
    wolfs[x].display=true;
  }

  int allNumber=0;

  for (int i=0; i<dogs.length; i++) {
    check[allNumber]=dogs[i].ypos;
    allNumber++;
  }

  for (int i=0; i<sheeps.length; i++) {
    check[allNumber]=sheeps[i].ypos;
    allNumber++;
  }

  for (int i=0; i<wolfs.length; i++) {
    check[allNumber]=wolfs[i].ypos;
    allNumber++;
  }

  check=sort(check);

  for (int i=0; i<allNumber; i++) {
    for (int x=0; x<dogs.length; x++) {
      if (check[i]==dogs[x].ypos&&dogs[x].display) {
        dogs[x].display();
        dogs[x].display=false;
      }
    }
    for (int x=0; x<sheeps.length; x++) {
      if (check[i]==sheeps[x].ypos&&sheeps[x].display) {
        sheeps[x].display();
        sheeps[x].display=false;
      }
    }
    for (int x=0; x<wolfs.length; x++) {
      if (check[i]==wolfs[x].ypos&&wolfs[x].display) {
        wolfs[x].display();
        wolfs[x].display=false;
      }
    }
  }
}/////// end of function display all moving objects

// time based on draw() in the game
void timer() {
  time++;
}

// press to pass level
void keyPressed() {
  if (key=='o') {
    finishLevel=true;
  }
}

void sheepsStart() {

  if (time==sheepReleaseT) {
    sheeps[sheepReleased].targetX=900;
    sheeps[sheepReleased].targetY=500;
    sheeps[sheepReleased].exist=true;
    sheepReleaseT+=10;
    sheepReleased+=1;
  }

  if (sheepReleased==16) {
    sheepReleaseT=10;
    sheepReleased=0;
  }
}// end of sheepStart

void gameBackground() {
  imageMode(CORNER);
  image(grass, 0, 0);
}