# Mesh

      // alpha1 - angle of first line
      // alpha2 - angle of second line
      // len - lenght of figure
      // points - number of points in line

      void drawLines(alpha1, alpha2, len, points){
         
      step = len/points; // separation between points in line
      theta1 = alpha1*(PI/180); // aplha1 in degrees to theta1 in rads
      theta2 = alpha2*(PI/180); // aplha2 in degrees to theta2 in rads

      for (int i = 0; i < points+1; i = i+1) { // main loop for all points

         steps = i*step; //number of steps

         // from first to last point
         point1[0]= origin[0]+cos(theta1)*steps; 
         point1[1]= origin[1]-sin(theta1)*steps; 
         // from last to first point
         point2[0]= origin[0]+cos(theta2)*(len-steps); 
         point2[1]= origin[1]-sin(theta2)*(len-steps); 
         
         stroke(random(0, 255), random(0, 255), random(0, 255)); //chose random color
         line(point1[0],point1[1],point2[0],point2[1]); // draw line from point1 to point2
         }
      }

![Pseudocode](pseudocode.png)