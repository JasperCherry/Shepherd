class Tree { 

  float xpos;
  float ypos;
  int picNum;

  Tree(float tempXpos, float tempYpos) { 

    xpos = tempXpos;
    ypos = tempYpos;
    picNum = round(random(0, 11));
  }

  void display() {

    imageMode(CENTER);
    image(trees[picNum], xpos, ypos);

    // remove comment to see borders
    /*
     strokeWeight(2);
     fill(255);
     stroke(0);
     ellipse(xpos,ypos,20,20);
     fill(0,0);
     stroke(255,0,0);
     rectMode(CENTER);
     rect(xpos, ypos+70, 90, 90);
     ellipse(xpos,ypos+70,20,20);
     */
     
  }//// end of display method
}
/////////////// end of tree class