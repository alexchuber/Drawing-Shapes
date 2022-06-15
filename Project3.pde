Camera camera;
Box smallcube;
Box cube;
Box strangecube;
Polygon hexagon;
Polygon icosagon;
PShape monster;
PShape wiremonster;

void setup()
{
  size(1600, 1000, P3D);
  colorMode(HSB, 360, 100, 100);
  perspective(radians(50.0f), (float)width/height, 0.1, 1000);

  camera = new Camera();
  camera.AddTarget(new PVector(-100,0,0));
  camera.AddTarget(new PVector(-50,0,0));
  camera.AddTarget(new PVector(0,0,0));
  camera.AddTarget(new PVector(75,0,0));
  
  smallcube = new Box();
  cube = new Box();
  strangecube = new Box();
  hexagon = new Polygon(6);
  icosagon = new Polygon(20);
  monster = loadShape("monster.obj");
  monster.setFill(color(60,100,100));
  wiremonster = loadShape("monster.obj");
  wiremonster.setFill(color(0,0,0,0));
  wiremonster.setStroke(true);
  wiremonster.setStrokeWeight(2.0f);
}

void draw()
{
  background(100);
  DrawGrid();
  DrawShapes();
  camera.Update();
}

void DrawGrid()
{
  strokeWeight(8);                      
  stroke(0,100,100);
  line(-100,0,0,100,0,0);
  stroke(240,100,100);
  line(0,0,-100,0,0,100);
  
  strokeWeight(1.1f);
  stroke(0,0,100);
  for(int i = -100; i <= 100; i+=10)
  {
    if(i != 0)
    {
      line(-100, 0, i, 100, 0, i);
      line(i, 0, -100, i, 0, 100);
    }
  }
}

void DrawShapes()
{
  //Drawing from origin
  pushMatrix();
  rotateX(PI);
  rotateY(PI);
  scale(0.5f,0.5f,0.5f);
  shape(monster);
  popMatrix();
  
  pushMatrix();
  translate(75,0,0);
  rotateX(PI);
  rotateY(PI);
  shape(wiremonster);
  popMatrix();
  
  //Drawing from polygon place
  translate(-50,-10,0);
  
  pushMatrix();
  translate(-10,0,0);
  scale(10,10,1);
  icosagon.Draw();
  popMatrix();
  
  pushMatrix();
  translate(10,0,0);
  scale(10,10,1);
  hexagon.Draw();
  popMatrix();
  
  //Drawing from cube place
  translate(-50,10,0);
  
  pushMatrix();
  scale(5,5,5);
  cube.Draw();
  popMatrix();
  
  pushMatrix();
  translate(-10,0,0);
  smallcube.Draw();
  popMatrix();
  
  pushMatrix();
  translate(10,0,0);
  scale(10,20,10);
  strangecube.Draw();
  popMatrix();
}


//==================================//
//==========INPUT HANDLERS==========//
//==================================//

void keyPressed()
{
  if(key == ' ')                //might need to check if coded, then use keyCode == SPACE or smthn
    camera.CycleTarget();
}

void mouseWheel(MouseEvent event)
{
  float ticks = event.getCount();
  camera.Zoom(ticks);
}
