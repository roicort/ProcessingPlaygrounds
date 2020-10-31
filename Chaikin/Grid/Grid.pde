PShape fig;
PShape cir;
PShape curve;

import processing.svg.*;

PShape makecircle(float c1,float c2, float R) {
  fig = createShape();
  fig.beginShape();
  //fig.vertex(20, 80);
  for(int i=0; i <25; i++){
    float a = random(0,1) * 2 * PI;
    float x = R * cos(a) + c1;
    float y = R * sin(a) + c2;
    //fill(0);
    //circle(x,y,1);
    //noFill();
    fig.vertex(x, y);
  }
  fig.endShape();
  return fig;
}


void setup() {
  size(512, 512);
  background(255);
  //Control();
  noLoop();
  beginRecord(SVG, random(0,255)+".svg");
}

void draw() {
  //stroke(255,0,0);
  noFill();
  for(int i=1; i <5; i++){
    for(int j=1; j <5; j++){
      float c1 = (width/5)*i;
      float c2 = (height/5)*j;
      //println(c1,c2);
      cir = makecircle(c1,c2,20);
      //shape(cir);
      curve = Chaikin(cir, 1.0/4.0, 10,true);
      shape(curve);
    }
  }

  endRecord();
  }
