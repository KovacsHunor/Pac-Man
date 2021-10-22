Dot[][] dots = new Dot[30][36];
Rect[] walls = new Rect[40];

void setup()
{
  for(int i = 0; i < walls.length; i++)
  {
   walls[i] = new Rect();
  }
  for(int i = 0; i < 30; i++)
   {
     for(int j = 0; j < 36; j++)
     {
       dots[i][j] = new Dot();
       dots[i][j].bool = true;
     }
   }
  background(0);
  size(701, 900);
  textSize(30);

}
void field()
{
   fill(0);
   stroke(0, 0, 255);

   walls[0].Show(0, 4, 28, 1, 20);
   walls[1].Show(0, 4, 1, 31, 20);
   walls[2].Show(27, 4, 1, 31, 20);
   walls[3].Show(0, 34, 28, 1, 20);
   walls[4].Show(13, 4, 2, 5, 20);
   walls[5].Show(2, 6, 4, 3, 20);
   walls[6].Show(7, 6, 5, 3, 20);
   walls[7].Show(16, 6, 5, 3, 20);
   walls[8].Show(22, 6, 4, 3, 20);
   walls[9].Show(2, 10, 4, 2, 20);
   walls[10].Show(22, 10, 4, 2, 20);
   walls[11].Show(10, 10, 8, 2, 20);
   walls[12].Show(1, 13, 5, 5, 20);
   walls[13].Show(7, 10, 2, 8, 20);
   walls[14].Show(7, 13, 5, 2, 20);
   walls[15].Show(13, 10, 2, 5, 20);
   walls[16].Show(19, 10, 2, 8, 20);
   walls[17].Show(16, 13, 5, 2, 20);
   walls[18].Show(22, 13, 5, 5, 20);
   walls[19].Show(1, 19, 5, 5, 20);
   walls[20].Show(22, 19, 5, 5, 20);

   walls[21].Show(7, 19, 2, 5, 20);
   walls[22].Show(19, 19, 2, 5, 20);
   walls[23].Show(10, 22, 8, 2, 20);
   walls[24].Show(13, 22, 2, 5, 20);
   walls[25].Show(2, 25, 4, 2, 20);
   walls[26].Show(4, 25, 2, 5, 20);
   walls[27].Show(7, 25, 5, 2, 20);
   walls[28].Show(16, 25, 5, 2, 20);
   walls[29].Show(22, 25, 4, 2, 20);
   walls[30].Show(22, 25, 2, 5, 20);
   walls[31].Show(0, 28, 3, 2, 20);
   walls[32].Show(25, 28, 3, 2, 20);
   walls[33].Show(2, 31, 10, 2, 20);
   walls[34].Show(16, 31, 10, 2, 20);
   walls[35].Show(10, 28, 8, 2, 20);
   walls[36].Show(7, 28, 2, 5, 20);
   walls[37].Show(19, 28, 2, 5, 20);
   walls[38].Show(13, 28, 2, 5, 20);
   walls[39].Show(10, 16, 8, 5, 20);

   noStroke();
   for(int i = 0; i < walls.length; i++)
   {
      rect(walls[i].l+1, walls[i].u+1, walls[i].r-walls[i].l-1, walls[i].d-walls[i].u-1, 20); 
   }


  noStroke();

}
int csize = 22;
int cposx = 388;
int cposy = 612;
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
int c;
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
  int dotcount = 0;
  for(int i = 0; i < 26; i++)
   {
     for(int j = 0; j < 29; j++)
     {
       if(dots[i][j].bool == true)
       {
         noStroke();
        fill(255, 255, 255);
        dots[i][j].Show(i, j, 6, 6);
       }
     }
   }
   
  fill(255, 255, 0);
  arc(cposx, cposy, csize, csize, radx - 0.01*count, rady + 0.01*count%10);
  for(int i = 0; i < 26; i++)
   {
     for(int j = 0; j < 29; j++)
     {
       if(get(dots[i][j].l, dots[i][j].u) != color(255, 255, 255))
       {
         dots[i][j].bool = false;
       }
     }
   }
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


int speed = 2;
String towards = "";
