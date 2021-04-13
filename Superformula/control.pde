
import controlP5.*;
ControlP5 ctrlp5;


Slider aslider;
Slider bslider;
Slider mslider;
Slider n1slider;
Slider n2slider;
Slider n3slider;
Button savebutton;
Toggle perfectshapes;

void Control(){
  
  ctrlp5 = new ControlP5(this);
  
  aslider = ctrlp5.addSlider("A").setSize(200,25).setPosition(25,100).setMin(1).setMax(20).setValue(0.0);
  bslider = ctrlp5.addSlider("B").setSize(200,25).setPosition(25,200).setMin(1).setMax(20).setValue(0.0);
  mslider = ctrlp5.addSlider("M").setSize(200,25).setPosition(25,300).setMin(2).setMax(20).setValue(0.0);
  n1slider = ctrlp5.addSlider("N1").setSize(200,25).setPosition(25,400).setMin(1).setMax(80).setValue(1.0);
  n2slider = ctrlp5.addSlider("N2").setSize(200,25).setPosition(25,500).setMin(1).setMax(80).setValue(1.0);
  n3slider = ctrlp5.addSlider("N3").setSize(200,25).setPosition(25,600).setMin(1).setMax(80).setValue(1.0);
  perfectshapes = ctrlp5.addToggle("Perfect").setSize(200,25).setPosition(25,700).setValue(1.0);
  //savebutton = ctrlp5.addButton("ScreenShot").setSize(200,25).setPosition(25,800);
 }
 
 public void controlEvent(ControlEvent c) {
  if(c.isFrom(aslider)) {
    if(perfect == 1.0){a = int(c.getValue());}
    else{a = c.getValue();}
  }
  if(c.isFrom(bslider)) {
    if(perfect == 1.0){b = int(c.getValue());}
    else{b = c.getValue();}
  }
  if(c.isFrom(mslider)) {
    if(perfect == 1.0){m = int(c.getValue());}
    else{m = c.getValue();}
  }
  if(c.isFrom(n1slider)) {
    n1 = c.getValue();
  }
  if(c.isFrom(n2slider)) {
    n2 = c.getValue();
  }
  if(c.isFrom(n3slider)) {
    n3 = c.getValue();
  }
  if(c.isFrom(savebutton)) {
      selectOutput("Select a file to write to:", "fileSelectedOUT");
  }
  if(c.isFrom(perfectshapes)) {
      perfect = c.getValue();
    if(perfect == 1.0){m = int(m);}
  }
}

void fileSelectedOUT(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    String fileOUT = selection.getAbsolutePath();
    saveFrame(fileOUT);
  }
}
