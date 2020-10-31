PShape fig;
PShape curve;

import processing.svg.*;

PShape makefig() {
  int size = 100;
  fig = createShape();
  fig.beginShape();
    float x = width/2;
    float y = height/2;
    fig.vertex(x,y-size);
    fig.vertex(x+size,y+size);
    fig.vertex(x-size,y+size);
    fig.vertex(x,y-size);
  fig.endShape();
  return fig;
}


void setup() {
  size(512, 512);
  background(255);
  //Control();
  noLoop();
  beginRecord(SVG, "signature.svg");
}

void draw() {
  stroke(0);
  fig = makefig();
  shape(fig);
  fig.scale(0.9); 

  shape(fig);
  fig.scale(0.9);  

  shape(fig);
  fig.scale(0.9);

  shape(fig);
  fig.scale(0.9); 

  shape(fig);
  //stroke(0);
  //curve = Chaikin(fig, 1.0/4.0, 10,true);
  //shape(curve);
  endRecord();
  }
