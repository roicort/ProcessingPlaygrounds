
class Particle{
  float posX;
  float posY;
  float velx;
  float vely;
  
  Particle(float x, float y){
  posX=x;
  posY=y;
  velx = random(-1, 1);
  vely = random(-1, 1);
  }
  
  void display(){
    noStroke();
    fill(0,0,0,40);
    ellipse(posX,posY,10,10);}
    
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
    velx += map(noise(posX * 0.005, posY * 0.005), 0, 1, -1, 1);
    vely += map(noise(posY * 0.005, posX * 0.005), 0, 1, -1, 1); 
    posX += velx;
    posY += vely;
  }}
