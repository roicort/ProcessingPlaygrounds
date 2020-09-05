

ArrayList<Particle> system;

void setup() {
  size(512, 512, P2D);
  system = new ArrayList<Particle>();
}

void draw() {
  background(255);
  for(Particle ps : system){
    ps.display();
    ps.move();
    for(Particle p : system){
       for(Particle s : system){
           if((dist(p.posX, p.posY, s.posX, s.posY)) < 100){
               line(p.posX, p.posY, s.posX, s.posY);}
          
}}}}

void mousePressed(){
  system.add(new Particle(mouseX,mouseY));
}
