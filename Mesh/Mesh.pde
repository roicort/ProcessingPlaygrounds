
import controlP5.*;
ControlP5 controlP5;

float len;
float points;
float alpha1;
float alpha2;
float save;

File selection;
PGraphics pg;

void setup(){
  
  fullScreen();  
  pg = createGraphics(width*4 , height*4);
  controlP5 = new ControlP5(this);
  
  float posX = width-(width/5);
  float posY = height-(height/6);
  
  controlP5.addSlider("Alpha1")
 .setRange(0,360)
 .setValue(0)
 .setPosition(posX,posY-30)
 .setSize(200,20)
 .setColorValue(0xffdddddd)
 .setColorLabel(0xffdddddd);
 
  controlP5.addSlider("Alpha2")
 .setRange(0,360)
 .setValue(90)
 .setPosition(posX,posY)
 .setSize(200,20)
 .setColorValue(0xffdddddd)
 .setColorLabel(0xffdddddd);
 
  controlP5.addSlider("Size")
 .setRange(0,min(width/2,height/2))
 .setValue(min(width/2,height/2)-25)
 .setPosition(posX,posY+30)
 .setSize(200,20)
 .setColorValue(0xffdddddd)
 .setColorLabel(0xffdddddd);
 
  controlP5.addSlider("Points")
 .setRange(0,50)
 .setValue(25)
 .setPosition(posX,posY+60)
 .setSize(200,20)
 .setColorValue(0xffdddddd)
 .setColorLabel(0xffdddddd);
 
  controlP5.addButton("Render")
 .setPosition(posX,posY+90)
 .setSize(200,20);
}

void saveFile(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    pg.save(selection.getAbsolutePath()+".png");
  }
}

void draw(){
}

void drawLines(){
  
  pg.beginDraw();
  pg.background(255);
  background(255);
  
  float aug = len/points;
  float theta1 = alpha1*(PI/180);
  float theta2 = alpha2*(PI/180);
  
  float[] origin = new float[2];
  float[] point1 = new float[2];
  float[] point2 = new float[2];
  
  origin[0] = width/2;
  origin[1] = height/2;
  
  for (int i = 0; i < points+1; i = i+1) {
    float aux = i*aug;
    point1[0]= origin[0]+cos(theta1)*aux;
    point1[1]= origin[1]-sin(theta1)*aux;
    point2[0]= origin[0]+cos(theta2)*(len-aux);
    point2[1]= origin[1]-sin(theta2)*(len-aux);
    pg.stroke(random(0, 255), random(0, 255), random(0, 255));
    pg.line(point1[0]*4,point1[1]*4,point2[0]*4,point2[1]*4);
    stroke(random(0, 255), random(0, 255), random(0, 255));
    line(point1[0],point1[1],point2[0],point2[1]);
  }
    pg.endDraw();
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isController()) { 
    if (theEvent.getController().getName()=="Alpha1"){
      alpha1 =theEvent.getController().getValue();
      drawLines();
    }
    if (theEvent.getController().getName()=="Alpha2"){
      alpha2 =theEvent.getController().getValue();
      drawLines();
    }
    if (theEvent.getController().getName()=="Size"){
      len =theEvent.getController().getValue();
      drawLines();
    }
    if (theEvent.getController().getName()=="Points"){
      points =theEvent.getController().getValue();
      drawLines();
    }
    if (theEvent.getController().getName()=="Render"){
      selectOutput("Select a file to write to:", "saveFile");
      saveFile(selection);
      selection = null;
    }
  }
}
