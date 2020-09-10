
class Particle{
  float posX;
  float posY;
  
  Particle(float x, float y){
    posX=x;
    posY=y;
  }
  
  void display(){
    fill(255);
    ellipse(posX,posY,1,1);
  }
}
