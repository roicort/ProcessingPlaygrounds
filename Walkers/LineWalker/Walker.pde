
class Particle{
  float posX;
  float posY;
  float pposX;
  float pposY;
  float velx;
  float vely;
  
  Particle(float x, float y){
  pposX=x;
  pposY=y;
  posX=x;
  posY=y;
  velx = random(-5, 5);
  vely = random(-5, 5);
  }
  
  void display(){
    line(pposX,pposY,posX,posY);
    pposX = posX;
    pposY = posY;
  }
    
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
    velx += map(noise(posX * 0.002, posY * 0.002, millis() * 0.001), 0, 1, -1, 1);
    vely += map(noise(posY * 0.002, posX * 0.002, millis() * 0.001), 0, 1, -1, 1);
    posX += velx;
    posY += vely;
  }}
