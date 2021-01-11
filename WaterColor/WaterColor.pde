water W;
float size;

PImage img;

color col;
int r = 0;
int g = 0;
int b = 0;

String file;
Boolean auto = false;

void setup() {
  //fullScreen();
  size(1400,700);
  background(255);
  W = new water();
  Control();
}

void draw() {
  if(auto){
    img = loadImage(file);
    int x = int(random(img.width));
    int y = int(random(img.height));
    color auxcol = img.get(x, y);
    W.display((width/6)+25+x,y,0.05,auxcol);
    rect(0,0,(width/6)+25,height);
  }
  else{
    col = color(r,g,b,5);
    fill(col);
    rect(0,0,(width/6)+25,height);
    //background(cp.getColorValue());
    if (mousePressed == true) {    
      W.display(mouseX,mouseY,slider.getValue(),col);
     }
  }
}

void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    file = selection.getAbsolutePath();
    auto=true;
  }
}
