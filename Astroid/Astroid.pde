
import controlP5.*;
ControlP5 controlP5;

float size;
float points;
boolean selected = false;
float drawellipse;
float ellipsepoint;

float save;
float[] origin = new float[2];
float[] stair = new float[4];

File selection;
PGraphics pg;

void setup(){
  
  fullScreen();  
  controlP5 = new ControlP5(this);
  
  float posX = width-(width/5);
  float posY = height-(height/6);
  
  controlP5.addSlider("Size")
 .setRange(0,min((width),(height))/1.5)
 .setValue(min((width),(height))/2)
 .setPosition(posX,posY)
 .setSize(200,20)
 .setColorValue(0xffdddddd)
 .setColorLabel(0xffdddddd);
 
  controlP5.addSlider("Points")
 .setRange(5,20)
 .setValue(10)
 .setPosition(posX,posY+30)
 .setSize(200,20)
 .setColorValue(0xffdddddd)
 .setColorLabel(0xffdddddd);
 
  controlP5.addSlider("EllipsePoint")
 .setRange(1,4)
 .setValue(2)
 .setPosition(posX,posY)
 .setSize(200,20)
 .setColorValue(0xffdddddd)
 .setColorLabel(0xffdddddd)
 .hide();
 
 controlP5.addToggle("DrawEllipse")
 .setPosition(posX,posY-40)
 .setSize(20,20)
 .setColorValue(0xffdddddd)
 .setColorLabel(0xffdddddd)
 .hide();

  controlP5.addButton("Reset")
 .setPosition(posX,posY+60)
 .setSize(200,20);
 
  controlP5.addButton("Save")
 .setPosition(posX,posY+90)
 .setSize(200,20)
 .hide();
}

void saveFile(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    save(selection.getAbsolutePath()+".png");
  }
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

void mouseClicked() {
    if ((mouseX > origin[0]-size) && (mouseX < origin[0] + size) && (mouseY > origin[1] - size) && (mouseY < origin[1]+size) && (!selected)){  
      stair[0] = mouseX;
      stair[1] = origin[1];
      stair[2] = origin[0];
      stair[3] = mouseY;
      selected = true;
      drawLines(stair);
      controlP5.getController("Size").hide();
      controlP5.getController("Points").show();
      controlP5.getController("Save").show();
      controlP5.getController("DrawEllipse").show();
  }
}

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

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isController()) { 
    if (theEvent.getController().getName()=="Size"){
      size =theEvent.getController().getValue()/2;
    }    
    if (theEvent.getController().getName()=="DrawEllipse"){
      drawellipse = theEvent.getController().getValue();
      if(drawellipse==1){
        controlP5.getController("EllipsePoint").show();
      }else{
        controlP5.getController("EllipsePoint").hide();
      }
      
      drawLines(stair);
    }
    if (theEvent.getController().getName()=="EllipsePoint"){
      ellipsepoint = theEvent.getController().getValue();
    }    
    if (theEvent.getController().getName()=="Points"){
      points =theEvent.getController().getValue();
    }    
    if (theEvent.getController().getName()=="Reset"){
      selected = false;
      controlP5.getController("Size").show();
      controlP5.getController("Points").show();
      controlP5.getController("Save").hide();
      controlP5.getController("DrawEllipse").hide();
      controlP5.getController("EllipsePoint").hide();
      controlP5.getController("DrawEllipse").setValue(0);
    }
    if (theEvent.getController().getName()=="Save"){
      selectOutput("Select a file to write to:", "saveFile");
      saveFile(selection);
      selection = null;
    }
  }
}
