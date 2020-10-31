

PShape Chaikin(PShape shape, float cut, int iters, boolean close) {
  if (cut > 0.5){
    cut = 1 - cut;}
  for(int iter = 0; iter<iters; iter++){
    PShape next = createShape();
    next.beginShape();
    int num_corners = shape.getVertexCount();
    if (!close)
      num_corners = shape.getVertexCount() - 1;
    for (int i = 0; i < num_corners; i++) {
      PVector a = shape.getVertex(i);
      PVector b = shape.getVertex((i + 1) % shape.getVertexCount());
  
        ArrayList<PVector> n = new ArrayList<PVector>();
        float x = lerp(a.x, b.x, cut);
        float y = lerp(a.y, b.y, cut);
        n.add(new PVector(x, y));
      
        x = lerp(b.x, a.x, cut);
        y = lerp(b.y, a.y, cut);
        n.add(new PVector(x, y));
      if (!close && i == 0) {
        // For the first point of open shapes, ignore vertex A
        next.vertex(a.x, a.y);
        next.vertex(n.get(1).x, n.get(1).y);
      } else if (!close && i == num_corners - 1) {
        // For the last point of open shapes, ignore vertex B
        next.vertex(n.get(0).x, n.get(0).y);
        next.vertex(b.x, b.y);
      } else {
        // For all other cases (i.e. interior edges of open
        // shapes or edges of closed shapes), add both vertices
        next.vertex(n.get(0).x, n.get(0).y);
        next.vertex(n.get(1).x, n.get(1).y);
      }
    }
  
    if (close)
      next.endShape(CLOSE);
    else
      next.endShape();
      
   shape=next;
  }
  return shape;
}
