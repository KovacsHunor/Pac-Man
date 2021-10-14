public class Rect
{
 int r;
 int l;
 int u;
 int d;
 void show(int px, int py, int sx, int sy, int c)
 {
   rect(px, py, sx, sy, c);
   l = px;
   u = py;
   r = l + sx;
   d = u + sy;
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
   walls[0].show(100, 50, 800, 5, 20);
   text(walls[0].d, 200, 220);
   walls[1].show(100, 50, 5, 500, 20);
   walls[2].show(100, 545, 800, 5, 20);
   walls[3].show(895, 50, 5, 500, 20);
   stroke(0, 0, 0);
   rect(101, 51, 798, 3, 20);
   rect(101, 51, 3, 498, 20);
   rect(101, 546, 798, 3, 20);
   rect(896, 51, 3, 498, 20);
   stroke(0, 0, 255);
 
  
  stroke(0, 0, 0);
}
int csize = 30;
int cposx = 200;
int cposy = 200;
float radx = 0.5;
float rady = 5.78;

int count = 0;
boolean mouth = false;
boolean wall = false;
void draw()
{
  switch (dir)
  {
    case "up":
    for(int i = 0; i < walls.length; i++)
    {
     if(cposy-csize/2 < walls[i].d + 3 && cposy - 12 > walls[i].u + 3 && cposx+csize/2 > walls[i].l && walls[i].r > cposx-csize/2)
     {
       wall = true;
     }
    }
    if(!wall)
     {
    cposy -= 2;
    radx = 0.5 - PI/2;
    rady = 5.78 - PI/2;
    wall = false;
    break;
     }
     else
     {
       wall = false;
       break;
     }
    
    
    
    
    case "down":
    for(int i = 0; i < walls.length; i++)
    {
     if(cposy+csize/2 > walls[i].u - 3 && cposy + 12 < walls[i].d - 3 && cposx+csize/2 > walls[i].l && walls[i].r > cposx-csize/2)
     {
       wall = true;
     }
    }
    if(!wall)
     {
    cposy += 2;
    radx = 0.5 + PI/2;
    rady = 5.78 + PI/2;
    wall = false;
    break;
     }
     else
     {
       wall = false;
       break;
     }
    
    
    
    
    case "right":
    for(int i = 0; i < walls.length; i++)
    {
     if(cposx+csize/2 > walls[i].l - 3 && cposx + 12 < walls[i].l - 3 && cposy+csize/2 > walls[i].u && walls[i].d > cposy-csize/2)
     {
       wall = true;
     }
    }
    if(!wall)
     {
    cposx += 2;
    radx = 0.5;
    rady = 5.78;
    wall = false;
    break;
     }
     else
     {
       wall = false;
       break;
     }
     
     
     
    case "left":
    for(int i = 0; i < walls.length; i++)
    {
     if(cposx-csize/2 < walls[i].r + 3 && cposx - 12 > walls[i].r + 3 && cposy+csize/2 > walls[i].u && walls[i].d > cposy-csize/2)
     {
       wall = true;
     }
    }
    if(!wall)
     {
    cposx -= 2;
    radx = 0.5 - PI;
    rady = 5.78 - PI;
    wall = false;
    break;
     }
     else
     {
       wall = false;
       break;
     }
     
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
  
}
String dir = "";
void keyPressed()
{
  
  if(keyCode == UP)
  {
   
    dir = "up";
  }
  else if(keyCode == DOWN)
  {
    dir = "down";
  }
  else if(keyCode == RIGHT)
  {
    dir = "right";
  }
  else if(keyCode == LEFT)
  {
     
    dir = "left";
  }
}
