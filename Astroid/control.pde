
import controlP5.*;
ControlP5 controlP5;

void Control(){
  controlP5 = new ControlP5(this);
  float posX = width-(width/3);
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
 
  controlP5.addButton("Render")
 .setPosition(posX,posY+90)
 .setSize(200,20)
 .hide();
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
      controlP5.getController("Render").show();
      controlP5.getController("DrawEllipse").show();
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
    if (theEvent.getController().getName()=="Render"){
       savepromt();
    }
  }
}
