public class Rect
{
 int r;
 int l;
 int u;
 int d;
 void show(int px, int py, int sx, int sy, int c)
 {    
   rect(px, py, sx, sy, c);
   l = px - 1;
   u = py - 1;
   r = l + sx + 3;
   d = u + sy + 3;
 }
}
Rect[] walls = new Rect[10];

void setup()
{
  for(int i = 0; i < walls.length; i++)
  {
   walls[i] = new Rect();
  }
  background(0);
  size(1000, 600);
  textSize(30);
  
}
void field()
{
   fill(0);
   stroke(0, 0, 255);
   walls[0].show(200, 50, 800, 5, 20);
   text(walls[0].d, 200, 220);
   walls[1].show(100, 50, 5, 500, 20);
   walls[2].show(100, 545, 800, 5, 20);
   walls[3].show(895, 50, 5, 500, 20);
   stroke(0, 0, 0);
   rect(201, 51, 798, 3, 20);
   rect(101, 51, 3, 498, 20);
   rect(101, 546, 798, 3, 20);
   rect(896, 51, 3, 498, 20);
   noStroke();
}
int csize = 30;
int cposx = 200;
int cposy = 200;
float radx = 0.5;
float rady = 5.78;

int count = 0;
boolean mouth = false;
boolean wall = false;

Left left = new Left();
Right right = new Right();
Down down = new Down();
Up up = new Up();

String after = "";
void draw()
{
  switch (dir)
  {
    case "up":
    up.Collide();
    break;
    
    case "down":
    down.Collide();
    break;
    
    case "right":
    right.Collide();
    break;
     
    case "left":
    left.Collide();
    break;
  }
  
  background(0);
  field();
  fill(255, 255, 0);
  arc(cposx, cposy, csize, csize, radx - 0.01*count, rady + 0.01*count%10);
  
  if(count > 50)
  {
    mouth = true;
  }
  else if(count < 0)
  {
    mouth = false;
  }
  if(!mouth)
  {
    count += 10;
  }
  else
  {
    count -= 10;
  }
  switch (after)
  {
    
    case "up":
    up.ACollide();
    up.Tri();
    break;
    
    case "down":
    down.ACollide();
    down.Tri();
    break;
    
    case "right":
    right.ACollide();
    right.Tri();
    break;
     
    case "left":
    left.ACollide();
    left.Tri();
    break;
    
  }
}
String dir = "";
void keyPressed()
{
  if(keyCode == UP && after != "up")
  {
    dir = "up";
    after = dir;
  }
  else if(keyCode == DOWN && after != "down")
  {
    dir = "down";
    after = dir;
  }
  else if(keyCode == RIGHT && after != "right")
  {
    dir = "right";
    after = dir;
  }
  else if(keyCode == LEFT && after != "left")
  {
    dir = "left";
    after = dir;
  }
}

class Collision
{
  public void Collide()
  {
    for(int i = 0; i < walls.length; i++)
    {
     if(Bool(i))
     {
       wall = true;
     }
    }
    if(!wall)
     {
      Set();
      wall = false;
      return;
     }
     else
     {
       dir = towards;
       wall = false;
     }
  }
  public void ACollide()
  {
    for(int i = 0; i < walls.length; i++)
    {
     if(Bool(i))
     {
       wall = true;
     }
    }
    if(!wall)
     {
       if(after != "")
       {
        dir = after;
       }
    wall = false;
    return;
     }
     else
     {
       wall = false;
     }
  }
  boolean Bool(int i)
  {
    return false;
  }
  void Tri()
  {
    
  }
  void Set()
  {
    
  }
}
int speed = 2;
String towards = "";
class Left extends Collision
{
  boolean Bool(int i)
  {
    return  cposx-csize/2 < walls[i].r + speed && cposx - 12 > walls[i].r + speed && cposy+csize/2 > walls[i].u && walls[i].d > cposy-csize/2;
  }
  void Set()
  {
    towards = "left";
    cposx -= speed;
    radx = 0.5 - PI;
    rady = 5.78 - PI;
  }
  void Tri()
  {
    triangle(cposx - 30, cposy, cposx - 25, cposy + 5, cposx - 25, cposy - 5);
  }
}
class Right extends Collision
{
  boolean Bool(int i)
  {
    return cposx+csize/2 > walls[i].l - speed && cposx + 12 < walls[i].l - speed && cposy+csize/2 > walls[i].u && walls[i].d > cposy-csize/2;
  }
  void Set()
  {
    towards = "right";
    cposx += speed;
    radx = 0.5;
    rady = 5.78;
  }
  void Tri()
  {
    triangle(cposx + 30, cposy, cposx + 25, cposy + 5, cposx + 25, cposy - 5);
  }
}
class Up extends Collision
{
  boolean Bool(int i)
  {
    return cposy-csize/2 < walls[i].d + speed && cposy - 12 > walls[i].u + speed && cposx+csize/2 > walls[i].l && walls[i].r > cposx-csize/2;
  }
  void Set()
  {
    towards = "up";
    cposy -= speed;
    radx = 0.5 - PI/2;
    rady = 5.78 - PI/2;
  }
  void Tri()
  {
    triangle(cposx, cposy - 30, cposx + 5, cposy - 25, cposx - 5, cposy - 25);
  }
}
class Down extends Collision
{
  boolean Bool(int i)
  {
    return cposy+csize/2 > walls[i].u - speed && cposy + 12 < walls[i].d - speed && cposx+csize/2 > walls[i].l && walls[i].r > cposx-csize/2;
  }
  void Set()
  {
    towards = "down";
    cposy += speed;
    radx = 0.5 + PI/2;
    rady = 5.78 + PI/2;
  }
  void Tri()
  {
    triangle(cposx, cposy + 30, cposx + 5, cposy + 25, cposx - 5, cposy + 25);
  }
}
