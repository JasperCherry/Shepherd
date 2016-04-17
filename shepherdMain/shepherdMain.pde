/*

 Shepherd - game by Kacper Wisnicki
 
 DOWNLOAD BEFORE PLAYING
 
 References: 
 
 Code:
 processing.org
 stackoverflow.com
 
 Graphics:
 opengameart.org
 google.com
 
 Sound:
 game background music:
 youtube.com, channel "Gaming Sound FX"
 opening music:
 The Boondock Saints II Soundtrack - 01 "Ireland Intro" by Jeff Danna
 sound effects: 
 freesfx.co.uk
 
 Manual:
 Control dogs with mouse and chase the sheeps to marked square on map
 Use left click to choose a dog, right click to select its destination.
 press R to display range of dogs
 press Q to use patrol mode
 press O to skip level
 
 Game features:
 
 2D game with sound effects
 
 Great attention to details
 
 Weather synchronized by XML file with actual weather in Edinburgh (rain)
 
 Reliable AI of game objects
 
 Easy to add new levels
 
 */
import ddf.minim.*;
Minim minim;
AudioPlayer starterSong;
AudioPlayer bark1;
AudioPlayer bark2;
AudioPlayer sheep1;
AudioPlayer[] gameSongs = new AudioPlayer[4];

int currentSong=1;

PFont font;// object of a font in game
float[] check = new float[24];// array for display control
Bird bird1;// object of a bird, decoration
Wolf[] wolfs = new Wolf[2];//array of wolf objects
Sheep[] sheeps = new Sheep[16];//array of sheep objects
Dog[] dogs = new Dog[6];//array of dog objects
Tree[] treeArr = new Tree[40];// array of tree objects
Water[] waterArr = new Water[10];// array of water objects
Rain rain = new Rain();

PImage // images for game objects
  grass, // grass in game
  starter, // starting screen
  finisher; // finishing screen
PImage[] trees = new PImage[12];//tree pictures array
PImage[] water = new PImage[6];//water pictures array
PImage[] bird = new PImage[6];//bird pictures array
PImage[] wolf = new PImage[10];//wolf pictures array
PImage[] dog = new PImage[10];//dog pictures array
PImage[] sheep = new PImage[8];//sheep pictures array

int swaper;// coordinates selected player dog
boolean finishLevel=false;// finish variable for levels, conditioner
int sheepsInside;// checks if all the sheeps are in the safe zone
float moveX;/// random number for ai targetX
float moveY;/// random number for ai targetY
int objID=1;// variable cooperating with swaper
int time=0;// timer
int timeFinish=0;// timer for ending levels
int sheepReleaseT=10;// variable for controling the time to release the sheeps
int sheepReleased=0;// variable for controlling how many sheeps have been released
int gamePart=0;// game screen or level
String temp1;// rain control global variable

void setup() {
  size(1000, 600);
  cursor(ARROW);
  loadFiles();
  rainCheck();
}

void draw() {
  gameRun();
}

void gameRun() {
  // font in the game
  textFont(font, 32);
  // two variables for moving ai in random directons
  moveX=round(random(-200, 200));
  moveY=round(random(-200, 200));
  // time based on draw() in the game
  timer();

  if (gamePart==0) {
    startScreen();
  } else if (gamePart==1) {
    level1();
  } else if (gamePart==2) {
    level2();
  } else if (gamePart==3) {
    level3();
  } else if (gamePart==4) {
    level4();
  } else if (gamePart==5) {
    level5();
  } else if (gamePart==6) {
    level6();
  } else if (gamePart==7) {
    level7();
  } else if (gamePart==8) {
    endScreen();
  }
}