
class Star{
  float posX;
  float posY;
  float Size;
  
  Star(float x, float y, float s){
    posX=x;
    posY=y;
    Size=s;
  }
  
  void display(){
    fill(255);
    circle(posX,posY,Size);
  }
}
