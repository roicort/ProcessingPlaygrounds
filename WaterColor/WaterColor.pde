water W;
float size;

import controlP5.*;
ControlP5 ctrlp5;
ColorPicker cp;
Slider slider;

void setup() {
  fullScreen();
  background(255);
  color col = color(100,100,100,5);
  W = new water(col);
  ctrlp5 = new ControlP5(this);
  cp = ctrlp5.addColorPicker("Color").setPosition(60, 100).setColorValue(col);
  slider = ctrlp5.addSlider("Brush Size").setPosition(60,180).setMax(1.0).setValue(0.5);
}

void draw() {
  //background(cp.getColorValue());
  if (mousePressed == true) {    
    W.wiggle();
    W.display(mouseX,mouseY,slider.getValue());
  }
}

public void controlEvent(ControlEvent c) {
  // when a value change from a ColorPicker is received, extract the ARGB values
  // from the controller's array value
  if(c.isFrom(cp)) {
    int r = int(c.getArrayValue(0));
    int g = int(c.getArrayValue(1));
    int b = int(c.getArrayValue(2));
    color col = color(r,g,b,5);
    W = new water(col);
  }
}
