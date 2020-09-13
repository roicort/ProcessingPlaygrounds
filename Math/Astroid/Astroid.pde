
void setup(){
  size(725,725);  
  Control();
}

void draw(){
  if (!selected){
  background(255);
  
  origin[0] = width/2;
  origin[1] = height/2;
  
  line(origin[0]-size,origin[1],origin[0]+size,origin[1]);
  line(origin[0],origin[1]+size,origin[0],origin[1]-size);
  
  if ((mouseX > origin[0]-size) && (mouseX < origin[0] + size) && (mouseY > origin[1] - size) && (mouseY < origin[1]+size)){  
    circle(mouseX, origin[1],5);
    circle(origin[0], mouseY,5);
    line(mouseX, origin[1],origin[0], mouseY);
    }
  }
  else{
    drawLines(stair);
   }
}

float size;
float points;
boolean selected = false;
float drawellipse;
float ellipsepoint;

float[] origin = new float[2];
float[] stair = new float[4];

PGraphics pg;

void drawLines(float[] stair){
  
  float h = dist(stair[0], stair[1], stair[2], stair[3]);
  
  background(255);
  stroke(0,0,0);
  
  line(origin[0]-size,origin[1],origin[0]+size,origin[1]);
  line(origin[0],origin[1]+size,origin[0],origin[1]-size);
  
  float stepsizeY = (size)/points;
  
  for(int i=0; i < points; i = i+1){
    
    float a = (stepsizeY*i);
    float c1 = origin[1] - a;
    float b = pitagoras(a,h);
    float c2 = origin[0] + b;
    
    float c3 = origin[1] + a;
    float c4 = origin[0] - b;
    
    //circle(origin[0],c1,5);
    //circle(c2,origin[1],5);
    //circle(origin[0],c3,5);
    //circle(c4,origin[1],5);
    
    line(origin[0],c1,c2,origin[1]);
    line(origin[0],c3,c4,origin[1]);
    line(origin[0],c1,c4,origin[1]);
    line(origin[0],c3,c2,origin[1]);
    
    if (drawellipse == 1){
    midpoint(c2,origin[1],origin[0],c1,ellipsepoint);
    midpoint(c4,origin[1],origin[0],c3,ellipsepoint);
    midpoint(c4,origin[1],origin[0],c1,ellipsepoint);
    midpoint(c2,origin[1],origin[0],c3,ellipsepoint);
    }
    
  }
  
    float stepsizeX = (size)/points;
  
    for(int i=0; i < points; i = i+1){
      
      float a = (stepsizeX*i);
      float c1 = origin[0] - a;
      float b = pitagoras(a,h);
      float c2 = origin[1] - b;
      
      float c3 = origin[0] + a;
      float c4 = origin[1] + b;
        
    //circle(c1,origin[1],5);
    //circle(origin[0],c2,5);
    //circle(c3,origin[1],5);
    //circle(origin[0],c4,5);

    line(c1,origin[1],origin[0],c2);
    line(c3,origin[1],origin[0],c4);
    line(c1,origin[1],origin[0],c4);
    line(c3,origin[1],origin[0],c2);
  
    if (drawellipse == 1){
    midpoint(c1,origin[1],origin[0],c2,ellipsepoint);
    midpoint(c3,origin[1],origin[0],c4,ellipsepoint);
    midpoint(c1,origin[1],origin[0],c4,ellipsepoint);
    midpoint(c3,origin[1],origin[0],c2,ellipsepoint);
    }
  }
}

void PGSVG(float[] stair, String path){
  pg = createGraphics(width*4, height*4,SVG,path);
  pg.beginDraw();
  pg.scale(4);
  float h = dist(stair[0], stair[1], stair[2], stair[3]);
  
  pg.background(255);
  pg.stroke(0,0,0);
  
  pg.line(origin[0]-size,origin[1],origin[0]+size,origin[1]);
  pg.line(origin[0],origin[1]+size,origin[0],origin[1]-size);
  
  float stepsizeY = (size)/points;
  
  for(int i=0; i < points; i = i+1){
    
    float a = (stepsizeY*i);
    float c1 = origin[1] - a;
    float b = pitagoras(a,h);
    float c2 = origin[0] + b;
    
    float c3 = origin[1] + a;
    float c4 = origin[0] - b;
    
    //circle(origin[0],c1,5);
    //circle(c2,origin[1],5);
    //circle(origin[0],c3,5);
    //circle(c4,origin[1],5);
    
    pg.line(origin[0],c1,c2,origin[1]);
    pg.line(origin[0],c3,c4,origin[1]);
    pg.line(origin[0],c1,c4,origin[1]);
    pg.line(origin[0],c3,c2,origin[1]);
    
    if (drawellipse == 1){
    PGmidpoint(c2,origin[1],origin[0],c1,ellipsepoint);
    PGmidpoint(c4,origin[1],origin[0],c3,ellipsepoint);
    PGmidpoint(c4,origin[1],origin[0],c1,ellipsepoint);
    PGmidpoint(c2,origin[1],origin[0],c3,ellipsepoint);
    }
    
  }
  
    float stepsizeX = (size)/points;
  
    for(int i=0; i < points; i = i+1){
      
      float a = (stepsizeX*i);
      float c1 = origin[0] - a;
      float b = pitagoras(a,h);
      float c2 = origin[1] - b;
      
      float c3 = origin[0] + a;
      float c4 = origin[1] + b;
        
    //circle(c1,origin[1],5);
    //circle(origin[0],c2,5);
    //circle(c3,origin[1],5);
    //circle(origin[0],c4,5);

    pg.line(c1,origin[1],origin[0],c2);
    pg.line(c3,origin[1],origin[0],c4);
    pg.line(c1,origin[1],origin[0],c4);
    pg.line(c3,origin[1],origin[0],c2);
  
    if (drawellipse == 1){
    PGmidpoint(c1,origin[1],origin[0],c2,ellipsepoint);
    PGmidpoint(c3,origin[1],origin[0],c4,ellipsepoint);
    PGmidpoint(c1,origin[1],origin[0],c4,ellipsepoint);
    PGmidpoint(c3,origin[1],origin[0],c2,ellipsepoint);
    }
  }
  pg.scale(0);
  pg.endDraw();
}
