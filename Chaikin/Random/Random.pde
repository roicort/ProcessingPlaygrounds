PShape fig;
PShape curve;

import processing.svg.*;

PShape makefig() {
  fig = createShape();
  fig.setFill(color(random(255)));
  fig.beginShape();
  //fig.vertex(20, 80);
  for(int i=0; i <10; i++){
    fig.vertex(random(0,width), random(0,height));
  }
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
  //shape(fig);
  //stroke(0);
  curve = Chaikin(fig, 1.0/4.0, 10,true);
  shape(curve);
  endRecord();
  }
