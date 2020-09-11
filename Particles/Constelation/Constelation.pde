import processing.svg.*;

ArrayList<Star> constelation;
ArrayList<Star> sky;
void setup() {
  size(512, 512);
  noLoop();
  beginRecord(SVG, "sky.svg");
  constelation = new ArrayList<Star>();
  sky = new ArrayList<Star>();
}

void draw() {
  constelation = new ArrayList<Star>();
  sky = new ArrayList<Star>();
  background(0);
  for(int i = 0; i < 150; i++){
    constelation.add(new Star(random(width/4,width-width/4),random(height/4,height-height/4),2));
    Star s2 = constelation.get(i);
    s2.display();
  }
  for(Star p : constelation){
    for(Star s : constelation){
       if((dist(p.posX, p.posY, s.posX, s.posY)) < width/25){
           stroke(255);
           line(p.posX, p.posY, s.posX, s.posY);
      } 
    }
  }
  endRecord();
}
