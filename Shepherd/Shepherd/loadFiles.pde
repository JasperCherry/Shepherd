void loadFiles() {

  minim = new Minim(this);
  // this loads songs
  starterSong = minim.loadFile("song1.mp3");
  bark1 = minim.loadFile("bark1.mp3");
  bark2 = minim.loadFile("bark2.mp3");
  sheep1 = minim.loadFile("sheep1.mp3");
  for (int i=1; i<5; i++) {
    gameSongs[i-1] = minim.loadFile("game"+i+".mp3");
  } 
  // loads font used in the game
  font = loadFont("Papyrus-Regular-100.vlw");
  // sheep
  for (int i=1; i<9; i++) {
    sheep[i-1] = loadImage("s"+i+".png");
  }
  // dog
  for (int i=1; i<11; i++) {
    dog[i-1] = loadImage("dog"+i+".png");
  }
  // wolf
  for (int i=1; i<11; i++) {
    wolf[i-1] = loadImage("wolf"+i+".png");
  }
  // bird
  for (int i=1; i<7; i++) {
    bird[i-1] = loadImage("bird"+i+".png");
  }
  // water
  for (int i=1; i<7; i++) {
    water[i-1] = loadImage("w"+i+".png");
  }
  // trees
  for (int i=1; i<13; i++) {
    trees[i-1] = loadImage("t"+i+".png");
  }

  grass = loadImage("grass.jpg");
  starter = loadImage("picShep.jpg");
  finisher = loadImage("picShep2.jpg");
}// end of load pic function