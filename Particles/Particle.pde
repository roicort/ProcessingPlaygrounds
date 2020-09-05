
class Particle{
  float posX;
  float posY;
  float velx;
  float vely;
  
  Particle(float x, float y){
  posX=x;
  posY=y;
  velx = random(-0.5,0.5);
  vely = random(-0.5,0.5);
  }
  
  void display(){
    ellipse(posX,posY,1,1);}
    
  void move(){
    posX = posX + velx;
    posY = posY + vely;   
    if((posX> width) || (posX < 0)){
      velx = velx * -1;}
    if((posY > height) || (posY < 0)){
      vely = vely * -1;}
  }}
