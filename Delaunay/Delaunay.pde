import megamu.mesh.*;

int n_points = 50;
void setup(){
  size(512,512);
  noLoop();
}

void draw(){
  background(255);
  float[][] points = new float[n_points][2];
  
    for(int i=0; i<n_points; i++)
  {
    points[i][0] = random(0,width); // first point, x
    points[i][1] = random(0,width); // first point, y
  }
  
  Delaunay myDelaunay = new Delaunay( points );
  
  int[][] myLinks = myDelaunay.getLinks();

  for(int i=0; i<myLinks.length; i++){
    int startIndex = myLinks[i][0];
    int endIndex = myLinks[i][1];
  
    float startX = points[startIndex][0];
    float startY = points[startIndex][1];
    float endX = points[endIndex][0];
    float endY = points[endIndex][1];
    if(dist( startX, startY, endX, endY )<100){
      line( startX, startY, endX, endY );
    }
  }
    for(int i=0; i<20; i++){
        int point = int(random(0,n_points));
        int[] localLinks = myDelaunay.getLinked(point); // those linked to point #1
        float[] c1 = points[point];
        float[] c2 = points[localLinks[0]];
        float[] c3 = points[localLinks[1]];
        println(c1.length,c2.length,c3.length);
        fill(0);
        triangle(c1[0],c1[1],c2[0],c2[1],c3[0],c3[1]);
        noFill();
    }
}
