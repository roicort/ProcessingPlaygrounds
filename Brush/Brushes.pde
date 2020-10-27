void line1(float X1, float Y1, float X2, float Y2, float weight) {
    for(int i = 0; i < weight; i++){
      float nearX1 = X1 + random(-5,5);
      float nearY1 = Y1 + random(-5,5);
      float nearX2 = X2 + random(-5,5);
      float nearY2 = Y2 + random(-5,5);
      line(nearX1,nearY1,nearX2,nearY2);
    }
}
