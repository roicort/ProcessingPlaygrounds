# Astroid
       
      //stair = starting line
      //origin - origin point
      //size - size of line
      //points - number of points
       
      void drawLines(stair){
        
        float h = dist(stair[0], stair[1], stair[2], stair[3]); // distancebetween two first points (Hypotenuse)
        
        line(origin[0]-size,origin[1],origin[0]+size,origin[1]); // Perpendicular line 1
        line(origin[0],origin[1]+size,origin[0],origin[1]-size); // Perpendicular line 2
        
        float stepsize = (size)/points; //Separation between lines
        
        for(int i=0; i < points; i = i+1){ //For every point
        
          //Calculate points in triangle for Y
          float a = (stepsize*i);   //Calculate Cathetus 1
          float c1 = origin[1] - a; //Point in Y axe
          float b = pitagoras(a,h); //Calculate Cathetus 2
          float c2 = origin[0] + b; //Point in X axe
          float c3 = origin[1] + a; //Reflect point in Y axe
          float c4 = origin[0] - b; //Reflect point in X axe
          
          //Draw lines between points
          line(origin[0],c1,c2,origin[1]);
          line(origin[0],c3,c4,origin[1]);
          line(origin[0],c1,c4,origin[1]);
          line(origin[0],c3,c2,origin[1]);
          
          if (drawellipse == 1){ //Decide if draw Ellipse
          
          //Calculate points in previous lines
          c1 = calcpointinline(c2,origin[1],origin[0],c1,ellipsepoint);
          c2 = calcpointinline(c4,origin[1],origin[0],c3,ellipsepoint);
          c3 = calcpointinline(c4,origin[1],origin[0],c1,ellipsepoint);
          c4 = calcpointinline(c2,origin[1],origin[0],c3,ellipsepoint);
          
          //Draw previous points
          point(np1);
          point(np2);
          point(np3);
          point(np4);
          
          }

          //Calculate points in triangle for X
          float a = (stepsize*i);   //Calculate Cathetus 1
          float c1 = origin[0] - a; //Point in X axe
          float b = pitagoras(a,h); //Calculate Cathetus 2
          float c2 = origin[1] - b; //Point in Y axe
          float c3 = origin[0] + a; //Reflect point in X axe
          float c4 = origin[1] + b; //Reflect point in Y axe
           
          //Draw lines between points
          line(c1,origin[1],origin[0],c2);
          line(c3,origin[1],origin[0],c4);
          line(c1,origin[1],origin[0],c4);
          line(c3,origin[1],origin[0],c2);
        
          if (drawellipse == 1){ //Decide if draw Ellipse
          
          //Calculate points in previous lines
          np1 = calcpointinline(c1,origin[1],origin[0],c2,ellipsepoint);
          np2 = calcpointinline(c3,origin[1],origin[0],c4,ellipsepoint);
          np3 = calcpointinline(c1,origin[1],origin[0],c4,ellipsepoint);
          np4 = calcpointinline(c3,origin[1],origin[0],c2,ellipsepoint);
          
          //Draw previous points
          point(np1);
          point(np2);
          point(np3);
          point(np4);
          
          }
      }
      
      //Auxiliar Functions
      
      // Point 1 = (x1,y1) 
      // Point 2 = (x2,y2)
      // ellipsepoint - Ratio of new point in between
      
      float[] calcpointinline(float x1, float y1, float x2, float y2, float ellipsepoint){ 
      
        float D = dist(x1,y1,x2,y2); // Distance between points
        float d = D/ellipsepoint;    // Distance of new point
        point[0] = x1 + ((d/D) * (x2-x1)); // Calculate first component of new point
        point[1] = y1 + ((d/D) * (y2-y1)); // Calculate second component of new point
        return point; // return new point
        
      }
