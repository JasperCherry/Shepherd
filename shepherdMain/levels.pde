void endScreen() {
  playMusic();
  imageMode(CORNER);
  image(finisher, 0, 0);
  textSize(70);
  fill(255);
  text("Congratulations!", 240, 100);
  textSize(60);
  fill(0);
  text("Shepherd", 260, 240);
  textSize(32);
  fill(0);
  text("game created by Kacper Wisnicki", 260, 300);
}

void level7() {
  playMusic();
  gameBackground();
  safePlace7();
  displayAllObjects();
  rain.display();
  check7();

  if (time<100) {
    textSize(100);
    fill(0, 0, 204);
    text("Level 7", 200, 200);
  }
}

void level6() {
  playMusic();
  gameBackground();
  safePlace6();
  displayAllObjects();
  rain.display();
  check6();

  if (time<100) {
    textSize(100);
    fill(0, 0, 204);
    text("Level 6", 200, 200);
  }
}

void level5() {
  playMusic();
  gameBackground();
  safePlace5();
  displayAllObjects();
  rain.display();
  check5();

  if (time<100) {
    textSize(100);
    fill(0, 0, 204);
    text("Level 5", 200, 200);
  }
}


void level4() {
  playMusic();
  gameBackground();
  safePlace4();
  displayAllObjects();
  rain.display();
  check4();

  if (time<100) {
    textSize(100);
    fill(0, 0, 204);
    text("Level 4", 200, 200);
  }
}


void level3() {
  playMusic();
  gameBackground();
  safePlace3();
  displayAllObjects();
  rain.display();
  check3();

  if (time<100) {
    textSize(100);
    fill(0, 0, 204);
    text("Level 3", 200, 200);
  }
  if (time>100&&time<400) {
    textSize(50);
    fill(0);
    text("Press 'R' to see", 250, 150);
    text("the range of the dogs", 250, 200);
  }
}


void level2() {
  playMusic();
  gameBackground();
  safePlace2();
  displayAllObjects();
  rain.display();
  check2();

  if (time<100) {
    textSize(100);
    fill(0, 0, 204);
    text("Level 2", 200, 200);
  }
  if (time>100&&time<400) {
    textSize(50);
    fill(0);
    text("Dogs are more efficient ", 150, 100);
    text("when working in group", 150, 150);
  }
}

void level1() {
  playMusic();
  gameBackground();
  safePlace1();
  displayAllObjects();
  rain.display();
  check1();

  if (time<100) {
    textSize(100);
    fill(0, 0, 204);
    text("Level 1", 150, 200);
  }
  if (time>100&&time<400) {
    textSize(50);
    fill(0);
    text("firstly left click your dog", 200, 400);
  }
  if (time>400&&time<700) {
    textSize(50);
    fill(0);
    text("then right click its destination", 200, 400);
  }
  if (time>700&&time<1000) {
    textSize(50);
    fill(0);
    text("try to chase sheeps into", 200, 400);
    text("the marked field", 200, 450);
  }
}


void startScreen() {
  // first song
  if (!starterSong.isPlaying()) { 
    starterSong.rewind();
    starterSong.play();
  }

  imageMode(CORNER);
  image(starter, 0, 0);
  textSize(100);
  fill(0, 0, 0);
  text("Shepherd", 50, 130);
  textSize(30);
  fill(0, 0, 0);
  text("Make use of your leader skills and begin this amazing", 50, 230);
  text("adventure in the green fields of Scotland", 50, 270);
  fill(0, 0, 0);
  text("Click mouse to start", 50, 360);

  if (mousePressed) {
    starterSong.close();
    createAllObjects();
    gamePart++;
    time=0;

    dogs[0].xpos=100;
    dogs[0].ypos=370;
    dogs[0].targetX=dogs[0].xpos;
    dogs[0].targetY=dogs[0].ypos;
    dogs[1].xpos=100;
    dogs[1].ypos=420;
    dogs[1].targetX=dogs[1].xpos;
    dogs[1].targetY=dogs[1].ypos;
    dogs[2].xpos=-1000;
    dogs[2].targetX=-1000;
    dogs[3].xpos=-1000;
    dogs[3].targetX=-1000;
    dogs[4].xpos=-1000;
    dogs[4].targetX=-1000;
    dogs[5].xpos=-1000;
    dogs[5].targetX=-1000;
    treeArr[0].xpos=100;
    treeArr[0].ypos=100;
    waterArr[0].xpos=280;
    waterArr[0].ypos=580;
    treeArr[2].xpos=200;
    treeArr[2].ypos=500;
    treeArr[3].xpos=980;
    treeArr[3].ypos=-50;
    treeArr[4].xpos=900;
    treeArr[4].ypos=-50;
    treeArr[5].xpos=820;
    treeArr[5].ypos=-50;
    treeArr[6].xpos=740;
    treeArr[6].ypos=-50;
    treeArr[7].xpos=660;
    treeArr[7].ypos=-50;
    treeArr[8].xpos=580;
    treeArr[8].ypos=-50;
    treeArr[9].xpos=500;
    treeArr[9].ypos=-50;
    treeArr[10].xpos=980;
    treeArr[10].ypos=30;
    treeArr[11].xpos=900;
    treeArr[11].ypos=30;
    treeArr[12].xpos=820;
    treeArr[12].ypos=30;
    treeArr[13].xpos=740;
    treeArr[13].ypos=30;
    treeArr[14].xpos=660;
    treeArr[14].ypos=30;
    treeArr[15].xpos=580;
    treeArr[15].ypos=30;
    treeArr[16].xpos=500;
    treeArr[16].ypos=30;
    treeArr[17].xpos=980;
    treeArr[17].ypos=110;
    treeArr[18].xpos=900;
    treeArr[18].ypos=110;
    treeArr[19].xpos=820;
    treeArr[19].ypos=110;
    treeArr[20].xpos=740;
    treeArr[20].ypos=110;
    treeArr[21].xpos=660;
    treeArr[21].ypos=110;
    treeArr[22].xpos=580;
    treeArr[22].ypos=110;
    treeArr[23].xpos=500;
    treeArr[23].ypos=110;
    treeArr[24].xpos=980;
    treeArr[24].ypos=190;
    treeArr[25].xpos=900;
    treeArr[25].ypos=190;
    treeArr[26].xpos=820;
    treeArr[26].ypos=190;
    treeArr[27].xpos=740;
    treeArr[27].ypos=190;
    treeArr[28].xpos=660;
    treeArr[28].ypos=190;
    treeArr[29].xpos=580;
    treeArr[29].ypos=190;
    treeArr[30].xpos=500;
    treeArr[30].ypos=190;
  }
}