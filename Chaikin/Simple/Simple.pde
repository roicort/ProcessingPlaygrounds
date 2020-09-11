PShape fig;
PShape curve;

PShape makefig() {
  fig = createShape();
  fig.beginShape();
  fig.vertex(20, 80);
  fig.vertex(205, 380);
  fig.vertex(320, 100);
  fig.vertex(480, 330);
  fig.endShape();
  return fig;
}


void setup() {
  size(512, 512);
  background(255);
  noLoop();
}

void draw() {
  stroke(0,0,255);
  fig = makefig();
  shape(fig);
  stroke(255,0,0);
  curve = Chaikin(fig, 1.0/4.0, 10,false);
  shape(curve);
  }
