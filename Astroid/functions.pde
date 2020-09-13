
float pitagoras(float a, float h){
  float b = sqrt(pow(h,2)-pow(a,2));
  return b;
}

float[] midpoint(float x1, float y1, float x2, float y2, float ellipsepoint){ 
  float[] mid = new float[2];
  float D = dist(x1,y1,x2,y2);
  float d = D/ellipsepoint;
  mid[0] = x1 + ((d/D) * (x2-x1));
  mid[1] = y1 + ((d/D) * (y2-y1));
  
  fill(255,0,0);
  circle(mid[0],mid[1],5);
  fill(0,0,0);
  return mid;
}

float[] PGmidpoint(float x1, float y1, float x2, float y2, float ellipsepoint){ 
  float[] mid = new float[2];
  float D = dist(x1,y1,x2,y2);
  float d = D/ellipsepoint;
  mid[0] = x1 + ((d/D) * (x2-x1));
  mid[1] = y1 + ((d/D) * (y2-y1));
  
  pg.fill(255,0,0);
  pg.circle(mid[0],mid[1],5);
  pg.fill(0,0,0);
  return mid;
}
