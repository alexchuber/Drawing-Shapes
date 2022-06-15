float TICK_SCALE = 10;
float MIN_RADIUS = 30;
float DEF_RADIUS = 100;
float MAX_RADIUS = 200;

class Camera
{
  float radius;
  ArrayList<PVector> targets;
  int targetindex;
  
  //Constructor
  Camera()
  {
    radius = DEF_RADIUS;
    targets = new ArrayList<PVector>();
    targetindex = 0;
  }
  
  //Recalculates position of camera; called in draw()
  void Update()
  {
    float phi = map(mouseX, 0, width-1, 0, 360);
    float theta = map(mouseY, 0, height-1, 1, 179);
    float targetx = targets.get(targetindex).x;
    float targety = targets.get(targetindex).y;
    float targetz = targets.get(targetindex).z;
    float positionx = targetx + (radius*cos(radians(phi))*sin(radians(theta)));
    float positiony = targety + (radius*cos(radians(theta)));
    float positionz = targetz + (radius*sin(radians(theta))*sin(radians(phi)));
    
    camera(positionx, positiony, positionz,
           targetx, targety, targetz,
           0, 1, 0);
  }
  
  //Move towards or away from the look-at target; called on mouseScroll
  void Zoom(float ticks)
  {
    radius += (ticks * TICK_SCALE);
    if(radius > MAX_RADIUS)
      radius = MAX_RADIUS;
    else if(radius < MIN_RADIUS)
      radius = MIN_RADIUS;
  }
  
  //Adds a look-at target to the list of positions to cycle through; called in setup()
  void AddTarget(PVector position)
  {
    targets.add(position);
  }
  
  //Move to the next look-at target in the list or wrapping around at end; called on spacePressed
  void CycleTarget()
  {
    targetindex++;
    if(targetindex == targets.size())
      targetindex = 0;
  }
}
