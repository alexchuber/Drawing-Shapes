//DETAILS:
//   -Polygon defaulted to be UNIT polygon (if that's even a word?)
//   -...at origin
//   -...and facing positive Z
//   -Uses TRIANGLE_FAN shape parameter
//   -Each vertex colored, in HSB "order"

class Polygon
{
  PShape polygon;
  
  //Constructor *with vertices count parameter*
  Polygon(int v)
  {
    polygon = createShape();
    polygon.beginShape(TRIANGLE_FAN);
    for(int i = 0; i <= v; i++)
    {
      float theta = 360.0f * (float)i/ (float)v;
      polygon.fill(color(theta, 100.0f, 100.0f));
      polygon.vertex(cos(radians(theta)), sin(radians(theta)), 0.0f);
    }
    polygon.endShape();
    polygon.setStrokeWeight(2.0f);
  }
  
  //Draws entire polygon to screen
  void Draw()
  {
    shape(polygon);
  }
}
