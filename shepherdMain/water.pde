class Water { 

  float xpos;
  float ypos;
  float change;

  Water(float tempXpos, float tempYpos) { 
    xpos = tempXpos;
    ypos = tempYpos;
    change = 0;
  }

  void display() {  
    imageMode(CENTER);
    if (change<20) {
      image(water[0], xpos, ypos-32);
      image(water[1], xpos, ypos);
      image(water[2], xpos, ypos+32);
    } else if (change<40) {
      image(water[3], xpos, ypos-32);
      image(water[4], xpos, ypos);
      image(water[5], xpos, ypos+32);
    }
    if (change==39) {
      change=0;
    }
    change++;

    // remove comment to see borders
    /*
strokeWeight(2);
     fill(255);
     stroke(0);
     ellipse(xpos,ypos,20,20);
     fill(0,0);
     stroke(255,0,0);
     rectMode(CENTER);
     rect(xpos,ypos-10, 90, 90);
     ellipse(xpos,ypos-10,20,20);
     */

    //// end of display method
  }
}
/////////////// end of water class

class Rain { 

  float []x=new float[300];
  float []y=new float[300];
  float []speed=new float[300];

  Rain() {
    int i=0;
    while (i<300) {
      x[i]=random(0, 1000);
      y[i]=random(0, 600);
      speed[i]=random(5, 7);
      i++;
    }
  }

  void display() { 
    //temp1="Light rain";
    //temp1="Rain";
    //temp1="Heavy rain";
    if (temp1.equals("Rain")||temp1.equals("Light rain")||temp1.equals("Rain showers")||temp1.equals("Light rain showers")||temp1.equals("Heavy rain")) {
      int i=0;
      int intensivity=0;
      if (temp1.equals("Light rain")||temp1.equals("Light rain showers")) {
        intensivity=100;
      } else if (temp1.equals("Rain")||temp1.equals("Rain showers")) {
        intensivity=200;
      } else if (temp1.equals("Heavy rain")) {
        intensivity=300;
      }
      while (i<intensivity) {
        stroke(50, 50, 255);
        strokeWeight(3);
        point(x[i], y[i]);
        y[i]=y[i]+speed[i];
        if (y[i]>600) {  //if x is less than 0 then make x equal to height of screen 
          y[i]=0;
        }
        i=i+1;
      }
    }
  }
}// end of class Rain