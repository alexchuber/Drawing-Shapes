//DETAILS:
//   -Quad defaulted to be a UNIT square
//   -....at origin
//   -...and facing positive Z
//   -Each triangle has randomized color

class Quad
{
  PShape triangle1, triangle2;
  
  //Constructor
  Quad()
  {
    triangle1 = createShape();
    triangle1.beginShape();
    triangle1.vertex(-0.5f, -0.5f, 0.0f);
    triangle1.vertex(-0.5f, 0.5f, 0.0f);
    triangle1.vertex(0.5f, 0.5f, 0.0f);
    triangle1.endShape();
    triangle1.setFill(color(random(0,360), 100.f, 100.f));
    
    triangle2 = createShape();
    triangle2.beginShape();
    triangle2.vertex(-0.5f, -0.5f, 0.0f);
    triangle2.vertex(0.5f, -0.5f, 0.0f);
    triangle2.vertex(0.5f, 0.5f, 0.0f);
    triangle2.endShape();
    triangle2.setFill(color(random(0,360), 100.f, 100.f));
  }
  
  //Draws each triangle to screen
  void Draw()
  {
    shape(triangle1);
    shape(triangle2);
  }
}
