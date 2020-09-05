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
  for(int i=0; i < 10; i++){
  system.add(new Particle(mouseX,mouseY));
  }
}