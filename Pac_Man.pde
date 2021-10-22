public class Rect
{
 int r;
 int l;
 int u;
 int d;
 void show(int px, int py, int sx, int sy, int c)
 {
   rect(px*25, py*25, sx*25, sy*25, c);
   l = px*25;
   u = py*25;
   r = l + sx*25;
   d = u + sy*25;
 }
}
Rect[] walls = new Rect[40];

void setup()
{
  for(int i = 0; i < walls.length; i++)
  {
   walls[i] = new Rect();
  }
  background(0);
  size(700, 900);
  textSize(30);
  
}
void field()
{
   fill(0);
   stroke(0, 0, 255);
   
   walls[0].show(0, 4, 28, 1, 20);
   walls[1].show(0, 4, 1, 31, 20);
   walls[2].show(27, 4, 1, 31, 20);
   walls[3].show(0, 34, 28, 1, 20);
   walls[4].show(13, 4, 2, 5, 20);
   walls[5].show(2, 6, 4, 3, 20);
   walls[6].show(7, 6, 5, 3, 20);
   walls[7].show(16, 6, 5, 3, 20);
   walls[8].show(22, 6, 4, 3, 20);
   walls[9].show(2, 10, 4, 2, 20);
   walls[10].show(22, 10, 4, 2, 20);
   walls[11].show(10, 10, 8, 2, 20);
   walls[12].show(1, 13, 5, 5, 20);
   walls[13].show(7, 10, 2, 8, 20);
   walls[14].show(7, 13, 5, 2, 20);
   walls[15].show(13, 10, 2, 5, 20);
   walls[16].show(19, 10, 2, 8, 20);
   walls[17].show(16, 13, 5, 2, 20);
   walls[18].show(22, 13, 5, 5, 20);
   walls[19].show(1, 19, 5, 5, 20);
   walls[20].show(22, 19, 5, 5, 20);
   walls[21].show(7, 19, 2, 5, 20);
   walls[22].show(19, 19, 2, 5, 20);
   walls[23].show(10, 22, 8, 2, 20);
   walls[24].show(13, 22, 2, 5, 20);
   walls[25].show(2, 25, 4, 2, 20);
   walls[26].show(4, 25, 2, 5, 20);
   walls[27].show(7, 25, 5, 2, 20);
   walls[28].show(16, 25, 5, 2, 20);
   walls[29].show(22, 25, 4, 2, 20);
   walls[30].show(22, 25, 2, 5, 20);
   walls[31].show(0, 28, 3, 2, 20);
   walls[32].show(25, 28, 3, 2, 20);
   walls[33].show(2, 31, 10, 2, 20);
   walls[34].show(16, 31, 10, 2, 20);
   walls[35].show(10, 28, 8, 2, 20);
   walls[36].show(7, 28, 2, 5, 20);
   walls[37].show(19, 28, 2, 5, 20);
   walls[38].show(13, 28, 2, 5, 20);
   walls[39].show(10, 16, 8, 5, 20);
   
   noStroke();
   for(int i = 0; i < walls.length; i++)
   {
      rect(walls[i].l+1, walls[i].u+1, walls[i].r-walls[i].l-1, walls[i].d-walls[i].u-1, 20); 
   }
   
   /*walls[0].show(100, 50, 800, 5, 20);
   text(walls[0].d, 200, 220);
   walls[1].show(100, 50, 5, 500, 20);
   walls[2].show(100, 545, 800, 5, 20);
   walls[3].show(895, 50, 5, 500, 20);
   walls[4].show(150, 100, 50, 50, 20);
   stroke(0, 0, 0);
   rect(101, 51, 798, 3, 20);
   rect(101, 51, 3, 498, 20);
   rect(101, 546, 798, 3, 20);
   rect(896, 51, 3, 498, 20);
   stroke(0, 0, 255);*/
 
  
  stroke(0, 0, 0);
   
}
int csize = 20;
int cposx = 300;
int cposy = 300;
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
     if(cposy-csize/2 < walls[i].d + 3 && cposy - csize/2-3 > walls[i].u + 3 && cposx+csize/2 > walls[i].l && walls[i].r > cposx-csize/2)
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
     if(cposy+csize/2 > walls[i].u - 3 && cposy + csize/2-3 < walls[i].d - 3 && cposx+csize/2 > walls[i].l && walls[i].r > cposx-csize/2)
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
     if(cposx+csize/2 > walls[i].l - 3 && cposx + csize/2-3 < walls[i].l - 3 && cposy+csize/2 > walls[i].u && walls[i].d > cposy-csize/2)
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
     if(cposx-csize/2 < walls[i].r + 3 && cposx - 7 > walls[i].r + 3 && cposy+csize/2 > walls[i].u && walls[i].d > cposy-csize/2)
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
