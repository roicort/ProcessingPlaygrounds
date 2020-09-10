

ArrayList<Particle> system;

void setup() {
  size(512, 512);
  background(0);
  system = new ArrayList<Particle>();
}

void draw() {
  for(Particle ps : system){
    ps.display();
}}

void mousePressed(){
  system.add(new Particle(mouseX,mouseY));
      for(Particle p : system){
       for(Particle s : system){
           if((dist(p.posX, p.posY, s.posX, s.posY)) < 100){
               stroke(255);
               line(p.posX, p.posY, s.posX, s.posY);} 
    }
  }
}
