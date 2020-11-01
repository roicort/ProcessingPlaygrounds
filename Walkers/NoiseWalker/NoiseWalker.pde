ArrayList<Particle> system;

void setup() {
  size(1024, 1024);
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
  //saveFrame("output/movie####.png");
  }
void mousePressed(){
    for(int i=0; i<33;i++){
      system.add(new Particle(random(0,width),random(0,height)));
    }
}
