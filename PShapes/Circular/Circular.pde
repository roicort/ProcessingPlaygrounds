PShape fig;
PShape curve;

import processing.svg.*;

PShape makefig() {
  float R = 200;
  fig = createShape();
  fig.beginShape();
  //fig.vertex(20, 80);
  for(int i=0; i <50; i++){
    float a = random(0,1) * 2 * PI;
    float x = R * cos(a) + width/2 ;
    float y = R * sin(a) + height/2;
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
  fig = makefig();
  shape(fig);
  //curve = Chaikin(fig, 1.0/4.0, 10,true);
  //shape(curve);
  endRecord();
  }
