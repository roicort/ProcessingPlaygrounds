import processing.svg.*;

PShape fig;

float scale = 50;

float a = 1;
float b = 1;
float m = 0;
float n1 = 1;
float n2 = 1;
float n3 = 1;

float perfect = 1.0;

void setup() {
  fullScreen();
  background(255);
  Control();
  smooth();
  noFill();
  stroke(255);
  //beginRecord(SVG, random(0,255)+".svg");
}

void draw() {
  background(100);
  PVector[] points = superformula(a,b,m, n1, n2, n3);
  pushMatrix();
  translate(width/2, height/2);
  for(int i=1;i<10;++i){
    float aux = i*0.9;
    get_shape(points,scale*aux);
  }
  popMatrix();
  endRecord();
}

void get_shape(PVector[] points, float scale){
  //fig = createShape();
  beginShape();
  curveVertex(points[points.length-1].x * scale, points[points.length-1].y * scale);
  for (int i = 0;i < points.length; i++) {
    curveVertex(points[i].x * scale, points[i].y * scale);
  }
  curveVertex(points[0].x * scale, points[0].y * scale);
  endShape();
}

PVector[] superformula(float a, float b,float m,float n1,float n2,float n3) {
  int numPoints = 360;
  float phi = TWO_PI / numPoints;
  PVector[] points = new PVector[numPoints+1];
  for (int i = 0;i <= numPoints;i++) {
    points[i] = r(a,b,m,n1,n2,n3,phi * i);
  }
  return points;
}

PVector r(float a, float b, float m,float n1,float n2,float n3,float phi) {
  float r;
  float t1,t2;
  float x = 0;
  float y = 0;

  t1 = cos(m * phi / 4) / a;
  t1 = abs(t1);
  t1 = pow(t1,n2);

  t2 = sin(m * phi / 4) / b;
  t2 = abs(t2);
  t2 = pow(t2,n3);

  r = pow(t1+t2,1/n1);
  if (abs(r) == 0) {
    x = 0;
    y = 0;
  }  
  else {
    r = 1 / r;
    x = r * cos(phi);
    y = r * sin(phi);
  }
  return new PVector(x, y);
}
