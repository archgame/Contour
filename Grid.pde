PVector center;
int w;
int h;
PVector P1;
PVector P2;
int gridMin = 5;
int gridMax = 40;
int strokeMin = 1;
int strokeMax = 10;
int ampMin = 0;
int ampMax = 100;


//////////////////////////VARIABLES//////////////////////////
int gridSize = 15;
int strokeSize = 2;
int amplitude = 0;
float mag = 2.5;
boolean ampingUp = false;
void setup()
{
  fullScreen(1);
  //size(640, 360);
  colorMode(HSB, 255);
  w = width;
  h = height;
  noCursor();
  smooth();
}

void draw()
{
  background(0);
  stroke(255);
  strokeWeight(strokeSize);
  center = new PVector(mouseX, mouseY);
  
  if(ampingUp)
  {
    amplitude = setSize(amplitude,1,ampMin,ampMax);
  }
  else
  {
    amplitude = setSize(amplitude,-1,ampMin,ampMax);
  }
  
  for (int x = 0; x <= w/gridSize; x++) {    
    
    beginShape();    
    stroke(255);
    noFill();
    strokeWeight(strokeSize);
    for (int y = 0; y <= h/gridSize; y++) {
      
      int PX = x*gridSize;
      int PY = y*gridSize;      
      P1 = new PVector(PX,PY);    
      P1 = movePoint(P1,center);
      curveVertex(P1.x,P1.y);
      
      //start and end points
      if(y == 0 || y == (h/gridSize)-1)
      {
        curveVertex(P1.x,P1.y);
      }
      
      P2 = new PVector(PX,PY+gridSize);
      P2 = movePoint(P2,center);
      //line(P1.x, P1.y, P2.x, P2.y);
    }   
    endShape();
  }
  //amplitude = setSize(amplitude,-1,ampMin,ampMax);
  //println("AMP: " + amplitude);
}

PVector movePoint(PVector P, PVector C)
{
  PVector D0 = new PVector(P.x -C.x, P.y - C.y);
  //float dist = pow((1/D0.mag()),1.5);
  float dist = (1/D0.mag());
  dist = dist*gridSize*(amplitude/100.00)*mag;
  //dist = sqrt(dist);
  //println("dist: " + dist);
  P = new PVector(P.x + D0.x*dist,P.y + D0.y*dist);
  return P;
}

int setSize(int n, int d, int min, int max)
{
    int i = n + d;
    if(i > max){ i = max;}
    if(i < min){ i = min;}  
    return i; 
}

void keyPressed() 
{ 
   if (key == 27) //ESC key
   { 
     //stop();
     exit();    
   }
   else if (key == 'f' || key == 'F')//F key
   {
     ampingUp = !ampingUp;
     //amplitude = setSize(amplitude,3,ampMin,ampMax);
     println("F: " + ampingUp);
   }
   else if (keyCode == RIGHT)//right arrow key
   {
      gridSize = setSize(gridSize,1,gridMin,gridMax);
      println("gridSize: " + gridSize);
   }
   else if (keyCode == LEFT)//left arrow key
   {
      gridSize = setSize(gridSize,-1,gridMin,gridMax);
      println("gridSize: " + gridSize);
   }
   else if (keyCode == UP)//up arrow key
   {
      strokeSize = setSize(strokeSize,1,strokeMin,strokeMax);
      println("gridSize: " + gridSize);
   }
   else if (keyCode == DOWN)//down arrow key
   {
      strokeSize = setSize(strokeSize,-1,strokeMin,strokeMax);
      println("gridSize: " + gridSize);
   }
}
