PShape fig;
PShape curve;

import processing.svg.*;

PShape makefig() {
  fig=loadShape("Евгения/e23.svg");

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
  //stroke(0);
  curve = Chaikin(fig, 1.0/4.0, 10,true);
  shape(curve);
  endRecord();
  }
