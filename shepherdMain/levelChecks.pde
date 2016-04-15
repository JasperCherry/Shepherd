void check1() {
  ////// checking if the sheeps are inside marked place and changing their color
  sheepsInside=0;  
  for (int i=0; i<sheeps.length; i++) {
    if (sheeps[i].xpos<=500&&sheeps[i].xpos>=0&&sheeps[i].ypos>=0&&sheeps[i].ypos<=285) {
      sheepsInside++;
      sheeps[i].inSafe=true;
    } else {
      sheeps[i].inSafe=false;
    }
  }
  // if all of them are inside the marked place the level is finished
  if (sheepsInside==16) {
    finishLevel=true;
  }

  if (finishLevel) {
    ///// marking all sheeps red when level is complete
    for (int i=0; i<sheeps.length; i++) {
      sheeps[i].inSafe=true;
    }  
    //// displaying "Level complete!" for some time
    fill(255, 0, 0);
    textSize(100);
    text("Level complete!", 50, 200);
    timeFinish++;

    if (timeFinish>100) {//////////////// jumping to next level
      finishLevel=false;//variable for finishing the level
      createAllObjects();//creating new objects 
      gamePart++;//change level 
      time=0;//time has to be zeroed for next level functions
      timeFinish=0;//time for displaying final lyrics  
      //////////////////////////// placing objects on map in the next level
      dogs[3].xpos=-1000;
      dogs[3].targetX=-1000;
      dogs[4].xpos=-1000;
      dogs[4].targetX=-1000;
      dogs[5].xpos=-1000;
      dogs[5].targetX=-1000;
      treeArr[0].xpos=700;
      treeArr[0].ypos=-30;
      treeArr[1].xpos=700;
      treeArr[1].ypos=50;
      treeArr[2].xpos=700;
      treeArr[2].ypos=130;
      treeArr[3].xpos=700;
      treeArr[3].ypos=210;
      treeArr[4].xpos=700;
      treeArr[4].ypos=290;
      treeArr[5].xpos=400;
      treeArr[5].ypos=280;
      treeArr[6].xpos=400;
      treeArr[6].ypos=360;
      treeArr[7].xpos=400;
      treeArr[7].ypos=440;
      treeArr[8].xpos=400;
      treeArr[8].ypos=520;
      treeArr[9].xpos=400;
      treeArr[9].ypos=600;
      treeArr[10].xpos=150;
      treeArr[10].ypos=250;
    }
  }
}//////////// end of check 1


void check2() {

  sheepsInside=0;
  for (int i=0; i<sheeps.length; i++) {
    if (sheeps[i].xpos<=100&&sheeps[i].xpos>=0&&sheeps[i].ypos>=485&&sheeps[i].ypos<=600) {
      sheepsInside++; 
      sheeps[i].inSafe=true;
    } else {
      sheeps[i].inSafe=false;
    }
  }

  if (sheepsInside==sheeps.length) {  
    finishLevel=true;
  }


  if (finishLevel) {

    for (int i=0; i<sheeps.length; i++) {
      sheeps[i].inSafe=true;
    } 

    fill(255, 0, 0);
    textSize(100);
    text("Level complete!", 50, 200);
    timeFinish++;
    if (timeFinish>100) {
      finishLevel=false;
      createAllObjects();
      gamePart++;  
      time=0;
      timeFinish=0;

      dogs[4].xpos=-1000;
      dogs[4].targetX=-1000;
      dogs[5].xpos=-1000;
      dogs[5].targetX=-1000;
      treeArr[0].xpos=100;
      treeArr[0].ypos=300;
      treeArr[1].xpos=100;
      treeArr[1].ypos=380;
      treeArr[2].xpos=400;
      treeArr[2].ypos=400;
      treeArr[3].xpos=480;
      treeArr[3].ypos=400;
      treeArr[4].xpos=560;
      treeArr[4].ypos=400;
      treeArr[5].xpos=900;
      treeArr[5].ypos=340;
      treeArr[6].xpos=600;
      treeArr[6].ypos=50;
      waterArr[0].xpos=250;
      waterArr[0].ypos=440;
    }
  }
}//////////// end of check 2


void check3() {

  sheepsInside=0;
  for (int i=0; i<sheeps.length; i++) {
    if (sheeps[i].xpos<=900&&sheeps[i].xpos>=100&&sheeps[i].ypos<=45&&sheeps[i].ypos>=0) {
      sheepsInside++; 
      sheeps[i].inSafe=true;
    } else {
      sheeps[i].inSafe=false;
    }
  }

  if (sheepsInside==16) {
    finishLevel=true;
  }


  if (finishLevel) {

    for (int i=0; i<sheeps.length; i++) {
      sheeps[i].inSafe=true;
    } 

    fill(255, 0, 0);
    textSize(100);
    text("Level complete!", 50, 200);
    timeFinish++;
    if (timeFinish>100) {
      finishLevel=false;
      createAllObjects();
      gamePart++;  
      time=0;
      timeFinish=0;

      treeArr[0].xpos=180;
      treeArr[0].ypos=470;
      treeArr[1].xpos=130;
      treeArr[1].ypos=330;
      treeArr[2].xpos=140;
      treeArr[2].ypos=500;
      treeArr[3].xpos=500;
      treeArr[3].ypos=470;
      treeArr[4].xpos=100;
      treeArr[4].ypos=520;
      treeArr[5].xpos=500;
      treeArr[5].ypos=0;
      treeArr[6].xpos=500;
      treeArr[6].ypos=80;
      treeArr[7].xpos=800;
      treeArr[7].ypos=160;
      treeArr[8].xpos=900;
      treeArr[8].ypos=40;
    }
  }
}//////////// end of check 3

void check4() {

  sheepsInside=0;
  for (int i=0; i<sheeps.length; i++) {
    if (sheeps[i].xpos<=600&&sheeps[i].xpos>=400&&sheeps[i].ypos>=185&&sheeps[i].ypos<=385) {
      sheepsInside++; 
      sheeps[i].inSafe=true;
    } else {
      sheeps[i].inSafe=false;
    }
  }
  if (sheepsInside==16) {
    finishLevel=true;
  }

  if (finishLevel) {

    for (int i=0; i<sheeps.length; i++) {
      sheeps[i].inSafe=true;
    } 

    fill(255, 0, 0);
    textSize(100);
    text("Level complete!", 50, 200);
    timeFinish++;
    if (timeFinish>100) {
      finishLevel=false;
      createAllObjects();
      gamePart++;  
      time=0;
      timeFinish=0;

      dogs[3].xpos=-1000;
      dogs[3].targetX=-1000;
      dogs[4].xpos=-1000;
      dogs[4].targetX=-1000;
      dogs[5].xpos=-1000;
      dogs[5].targetX=-1000;
      treeArr[0].xpos=190;
      treeArr[0].ypos=-30;
      treeArr[1].xpos=190;
      treeArr[1].ypos=50;
      treeArr[2].xpos=190;
      treeArr[2].ypos=130;
      waterArr[1].xpos=190;
      waterArr[1].ypos=270;
      treeArr[4].xpos=120;
      treeArr[4].ypos=440;
      treeArr[5].xpos=120;
      treeArr[5].ypos=520;
      treeArr[6].xpos=120;
      treeArr[6].ypos=600;
      treeArr[7].xpos=600;
      treeArr[7].ypos=100;
      treeArr[8].xpos=600;
      treeArr[8].ypos=180;
      treeArr[9].xpos=600;
      treeArr[9].ypos=260;
      waterArr[0].xpos=520;
      waterArr[0].ypos=340;
      treeArr[14].xpos=440;
      treeArr[14].ypos=500;
      treeArr[15].xpos=520;
      treeArr[15].ypos=500;
      treeArr[16].xpos=600;
      treeArr[16].ypos=500;
      treeArr[17].xpos=680;
      treeArr[17].ypos=500;
      treeArr[18].xpos=680;
      treeArr[18].ypos=580;
      treeArr[19].xpos=830;
      treeArr[19].ypos=100;
      treeArr[21].xpos=950;
      treeArr[21].ypos=300;
    }
  }
  //////////// end of check 4
}

void check5() {

  sheepsInside=0;
  for (int i=0; i<sheeps.length; i++) {
    if (sheeps[i].xpos<=100&&sheeps[i].xpos>=0&&sheeps[i].ypos<=85&&sheeps[i].ypos>=0) {
      sheepsInside++; 
      sheeps[i].inSafe=true;
    } else {
      sheeps[i].inSafe=false;
    }
  }
  if (sheepsInside==16) {
    finishLevel=true;
  }

  if (finishLevel) {

    for (int i=0; i<sheeps.length; i++) {
      sheeps[i].inSafe=true;
    } 

    fill(255, 0, 0);
    textSize(100);
    text("Level complete!", 50, 200);
    timeFinish++;
    if (timeFinish>100) {
      finishLevel=false;
      createAllObjects();
      gamePart++;  
      time=0;
      timeFinish=0;

      dogs[4].xpos=-1000;
      dogs[4].targetX=-1000;
      dogs[5].xpos=-1000;
      dogs[5].targetX=-1000;
      treeArr[0].xpos=400;
      treeArr[0].ypos=120;
      treeArr[1].xpos=480;
      treeArr[1].ypos=120;
      treeArr[2].xpos=900;
      treeArr[2].ypos=250;
      treeArr[3].xpos=750;
      treeArr[3].ypos=350;
      treeArr[4].xpos=100;
      treeArr[4].ypos=400;
      treeArr[5].xpos=180;
      treeArr[5].ypos=320;
      treeArr[6].xpos=260;
      treeArr[6].ypos=400;
      waterArr[0].xpos=180;
      waterArr[0].ypos=480;
      wolfs[0].xpos=1100;
      wolfs[0].ypos=-100;
      wolfs[0].targetX=900;
      wolfs[0].targetY=100;
      wolfs[0].exist=true;
    }
  }
}//////////// end of check 5

void check6() {

  sheepsInside=0;
  for (int i=0; i<sheeps.length; i++) {
    if (sheeps[i].xpos<=1000&&sheeps[i].xpos>=900&&sheeps[i].ypos<=85&&sheeps[i].ypos>=0) {
      sheepsInside++; 
      sheeps[i].inSafe=true;
    } else {
      sheeps[i].inSafe=false;
    }
  }
  if (sheepsInside==16) {
    finishLevel=true;
  }


  if (finishLevel) {

    for (int i=0; i<sheeps.length; i++) {
      sheeps[i].inSafe=true;
    } 

    fill(255, 0, 0);
    textSize(100);
    text("Level complete!", 50, 200);
    timeFinish++;
    if (timeFinish>100) {
      finishLevel=false;
      createAllObjects();
      gamePart++;  
      time=0;
      timeFinish=0;

      dogs[3].xpos=-1000;
      dogs[3].targetX=-1000;
      dogs[4].xpos=-1000;
      dogs[4].targetX=-1000;
      dogs[5].xpos=-1000;
      dogs[5].targetX=-1000;
      treeArr[0].xpos=345;
      treeArr[0].ypos=130;
      treeArr[1].xpos=345;
      treeArr[1].ypos=210;
      treeArr[2].xpos=345;
      treeArr[2].ypos=290;
      treeArr[3].xpos=345;
      treeArr[3].ypos=370;// turn left
      treeArr[4].xpos=265;
      treeArr[4].ypos=370;
      treeArr[5].xpos=185;
      treeArr[5].ypos=370;
      treeArr[6].xpos=105;
      treeArr[6].ypos=370;
      treeArr[7].xpos=25;
      treeArr[7].ypos=370;
      waterArr[0].xpos=750;
      waterArr[0].ypos=170;
      waterArr[1].xpos=550;
      waterArr[1].ypos=470;
      wolfs[0].xpos=1100;
      wolfs[0].ypos=-100;
      wolfs[0].targetX=900;
      wolfs[0].targetY=100;
      wolfs[0].exist=true;
      wolfs[1].xpos=1150;
      wolfs[1].ypos=-150;
      wolfs[1].targetX=900;
      wolfs[1].targetY=100;
      wolfs[1].exist=true;
    }
  }
}//////////// end of check 6

void check7() {  

  sheepsInside=0;
  for (int i=0; i<sheeps.length; i++) {
    if (sheeps[i].xpos<=300&&sheeps[i].xpos>=0&&sheeps[i].ypos<=385&&sheeps[i].ypos>=185) {
      sheepsInside++; 
      sheeps[i].inSafe=true;
    } else {
      sheeps[i].inSafe=false;
    }
  }
  if (sheepsInside==16) {
    finishLevel=true;
  }

  if (finishLevel) {

    for (int i=0; i<sheeps.length; i++) {
      sheeps[i].inSafe=true;
    } 

    fill(255, 0, 0);
    textSize(100);
    text("Level complete!", 50, 200);
    timeFinish++;
    if (timeFinish>100) {
      createAllObjects();
      time=0;
      gamePart++;  
      finishLevel=false;
      timeFinish=0;
    }
  }
}//////////// end of check 7