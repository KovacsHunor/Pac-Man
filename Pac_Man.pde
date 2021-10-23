float scale = 1;
Dot[][] dots = new Dot[30][36];
Rect[] walls = new Rect[42];
void Dotdef()
{
  for (int i = 0; i < 30; i++)
  {
    for (int j = 0; j < 36; j++)
    {
      dots[i][j].bool = true;
    }
  }
  for (int i = 10; i < 17; i++)
  {
    dots[8][i].bool = false;
  }
  for (int i = 10; i < 16; i++)
  {
    dots[17][i].bool = false;
  }
  for (int i = 9; i < 17; i++)
  {
    for (int j = 8; j < 11; j++)
    {
      dots[i][j].bool = false;
    }
  }
  for (int j = 16; j < 19; j++)
  {

    for (int i = 8; i < 18; i++)
    {
      dots[i][j].bool = false;
    }
  }
  for (int i = 0; i < 30; i++)
  {
    dots[i][13].bool = false;
  }
  dots[12][22].bool = false;
  dots[13][22].bool = false;
  dots[5][13].bool = true;
  dots[20][13].bool = true;
}
void setup()
{
  scale *= displayHeight / 1080f;
  frameRate(100);
  for (int i = 0; i < 30; i++)
  {
    for (int j = 0; j < 36; j++)
    {
      dots[i][j] = new Dot();
    }
  }
  Dotdef();
  for (int i = 0; i < walls.length; i++)
  {
    walls[i] = new Rect();
  }

  background(0);
  surface.setSize(int(710*scale), int(900*scale));
  surface.setLocation(int((displayWidth - 710*scale) / 2), 10);
  textSize(30);
}
void field(color c)
{
  fill(0);
  stroke(c);
  walls[0].Show(0, 4, 28, 1, 20);
  walls[1].Show(0, 4, 1, 10, 20);
  walls[40].Show(0, 20, 1, 15, 20);
  
  walls[2].Show(27, 4, 1, 10, 20);
  walls[41].Show(27, 20, 1, 15, 20);
  
  walls[3].Show(0, 34, 28, 1, 20);
  walls[4].ShowBorder(13, 4, 2, 5, 0, 0, 20, 20);
  walls[5].Show(2, 6, 4, 3, 20);
  walls[6].Show(7, 6, 5, 3, 20);
  walls[7].Show(16, 6, 5, 3, 20);
  walls[8].Show(22, 6, 4, 3, 20);
  walls[9].Show(2, 10, 4, 2, 20);
  walls[10].Show(22, 10, 4, 2, 20);
  walls[11].Show(10, 10, 8, 2, 20);
  walls[12].ShowBorder(0, 13, 6, 5, 20, 0, 20, 0);
  walls[13].Show(7, 10, 2, 8, 20);
  walls[14].Show(7, 13, 5, 2, 20);
  walls[15].Show(13, 10, 2, 5, 20);
  walls[16].Show(19, 10, 2, 8, 20);
  walls[17].Show(16, 13, 5, 2, 20);
  walls[18].ShowBorder(22, 13, 6, 5, 0, 20, 0, 20);
  walls[19].ShowBorder(0, 19, 6, 5, 20, 0, 20, 0);
  walls[20].ShowBorder(22, 19, 6, 5, 0, 20, 0, 20);
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
  walls[31].ShowBorder(0, 28, 3, 2, 20, 0, 20, 0);
  walls[32].ShowBorder(25, 28, 3, 2, 0, 20, 0, 20);
  walls[33].Show(2, 31, 10, 2, 20);
  walls[34].Show(16, 31, 10, 2, 20);
  walls[35].Show(10, 28, 8, 2, 20);
  walls[36].Show(7, 28, 2, 5, 20);
  walls[37].Show(19, 28, 2, 5, 20);
  walls[38].Show(13, 28, 2, 5, 20);
  walls[39].Show(10, 16, 8, 5, 20);
  noStroke();
  
  for (int i = 0; i < walls.length; i++)
  {
    rect(walls[i].l+11, walls[i].u+11, walls[i].r-walls[i].l-21, walls[i].d-walls[i].u-21, 20);
  }
}
int csize = 22;
int cposx = 356;
int cposy = 688;
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
int boolcount = 0;
int score = 0;
boolean reload = false;
int reloadcount = 0;
void draw()
{
  scale(scale);
  if(cposx < 0)
  {
    cposx = 29*25;
  }
  if(cposx > 29*25)
  {
    cposx = 0;
  }
  if (boolcount == 244)
  {
    towards = "";
    after = "";
    dir = "";
    count = 0;
    reload = true;
  }
  if (reloadcount == 250)
  {
    cposx = 351;
    cposy = 688;
    Dotdef();
    reloadcount = 0;
    boolcount = 0;
    reload = false;
  }
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
  color c = color(0, 0, 255);
  if (reload)
  {
    reloadcount++;
    if (reloadcount < 130)
    {
      c = color(0, 0, 255);
    } else if (reloadcount < 150)
    {
      c = color(255);
    } else if (reloadcount < 170)
    {
      c = color(0, 0, 255);
    } else if (reloadcount < 190)
    {
      c = color(255);
    } else if (reloadcount < 210)
    {
      c = color(0, 0, 255);
    } else if (reloadcount < 230)
    {
      c = color(255);
    } else if (reloadcount < 250)
    {
      c = color(0, 0, 255);
    }
  }
  field(c);
  for (int i = 0; i < 26; i++)
  {
    for (int j = 0; j < 29; j++)
    {
      if (dots[i][j].bool == true)
      {
        noStroke();
        fill(255, 255, 255);
        dots[i][j].Show(i, j, 4, 4);
      }
    }
  }

  fill(255, 255, 0);
  if (dir != "")
  {
    arc(cposx, cposy, csize + 13, csize + 13, radx - 0.01*count, rady + 0.01*count%10);
  } else
  {
    circle(cposx, cposy, csize + 13);
  }

  for (int i = 0; i < 26; i++)
  {
    for (int j = 0; j < 29; j++)
    {
      if (dots[i][j].Intersects() && dots[i][j].bool)
      {
        dots[i][j].bool = false;
        score += 10;
        boolcount++;
      }
    }
  }
  if (dir != "")
  {
    if (count > 50)
    {
      mouth = true;
    } else if (count < 0)
    {
      mouth = false;
    }
    if (!mouth)
    {
      count += 5;
    } else
    {
      count -= 5;
    }
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
  fill(255);
  text("score: " + score, 20, 80);
}
String dir = "";
void keyPressed()
{
  if (keyCode == UP && after != "up")
  {
    dir = "up";
    after = dir;
  } else if (keyCode == DOWN && after != "down")
  {
    dir = "down";
    after = dir;
  } else if (keyCode == RIGHT && after != "right")
  {
    dir = "right";
    after = dir;
  } else if (keyCode == LEFT && after != "left")
  {
    dir = "left";
    after = dir;
  }
}
int speed = 2;
String towards = "";
