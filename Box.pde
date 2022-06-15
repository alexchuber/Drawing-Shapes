//DETAILS:
//  -Box defaulted to be a UNIT cube
//  -...at origin
//  -Each triangle of each side has randomized color

class Box
{
  ArrayList<Quad> sides;
  
  //Constructor *that calls Quad constructor*
  Box()
  {
    sides = new ArrayList<Quad>();
    for(int i = 0; i < 6; i++)
    {
      sides.add(new Quad());
    }
  }
  
  //Draws each quad to screen *with transformations*
  void Draw()
  {
    //PosZ
    pushMatrix();
    translate(0, 0, 0.5f);
    sides.get(0).Draw();
    popMatrix();
    
    //NegZ
    pushMatrix();
    translate(0, 0, -0.5f);
    rotateZ(PI);
    sides.get(1).Draw();
    popMatrix();
    
    //PosX
    pushMatrix();
    translate(0.5f, 0.0f, 0.0f);
    rotateY(PI/2);
    sides.get(2).Draw();
    popMatrix();
    
    //NegX
    pushMatrix();
    translate(-0.5f, 0.0f, 0.0f);
    rotateY(-PI/2);
    sides.get(3).Draw();
    popMatrix();
    
    //PosY
    pushMatrix();
    translate(0.0f, 0.5f, 0.0f);
    rotateX(PI/2);
    sides.get(4).Draw();
    popMatrix();
    
    //NegY
    pushMatrix();
    translate(0.0f, -0.5f, 0.0f);
    rotateX(-PI/2);
    sides.get(5).Draw();
    popMatrix();
  }
}
