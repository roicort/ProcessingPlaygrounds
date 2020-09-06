
class Particle{
  float posX;
  float posY;
  float velx;
  float vely;
  
  Particle(float x, float y){
  posX=x;
  posY=y;
  velx = random(-2, 2);
  vely = random(-2, 2);
  }
  
  void display(){
    noStroke();
    fill(0,0,0,40);
    ellipse(posX,posY,5,5);}
    
  boolean IsIN(){
    boolean True = true;
    boolean False = false;
    if((posX > width) || (posX < 0)){
      return False;}
    if((posY > height) || (posY < 0)){
      return False;}
     else{
       return True;}
  }
    
    
  void move(){
    velx += map(noise(velx * 0.005, vely * 0.005, millis() * 0.001), 0, 1, -1, 1);
    vely += map(noise(vely * 0.005, velx * 0.005, millis() * 0.001), 0, 1, -1, 1);
    posX += velx;
    posY += vely;
  }}
