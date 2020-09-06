
class Particle{
  float posX;
  float posY;
  float velx;
  float vely;
  
  Particle(float x, float y){
  posX=x;
  posY=y;
  }
  
  void display(){
    noStroke();
    fill(0,0,0,10);
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
    velx = velx+random(-0.25,0.25);
    vely = vely+random(-0.25,0.25);
    posX = posX + velx;
    posY = posY + vely;   
  }}
