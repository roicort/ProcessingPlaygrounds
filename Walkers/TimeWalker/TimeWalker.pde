ArrayList<Particle> system;

void setup() {
  size(512, 512);
  background(255);
  system = new ArrayList<Particle>();
}

void draw() {
  for(Particle ps : system){
    if(ps.IsIN()){
    ps.display();
    ps.move();
    }
  }
  }
void mousePressed(){
  system = new ArrayList<Particle>();
  background(255);
  for(int i=0; i < 20; i++){
  system.add(new Particle(mouseX,mouseY));
  }
}
