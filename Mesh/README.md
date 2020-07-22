# Mesh

 float len;
 float points;
 float alpha1;
 float alpha2;

 float[] origin = new float[2];
 float[] point1 = new float[2];
 float[] point2 = new float[2];

void drawLines(float alpha1, float alpha2, float len, float points){
       
      float step = len/points;
      float theta1 = alpha1*(PI/180);
      float theta2 = alpha2*(PI/180);
       
      for (int i = 0; i < points+1; i = i+1) {

         steps = i*step;

         point1[0]= origin[0]+cos(theta1)*steps;
         point1[1]= origin[1]-sin(theta1)*steps;

         point2[0]= origin[0]+cos(theta2)*(len-steps);
         point2[1]= origin[1]-sin(theta2)*(len-steps);
         
         stroke(random(0, 255), random(0, 255), random(0, 255));
         line(point1[0],point1[1],point2[0],point2[1]);

       }
     }
