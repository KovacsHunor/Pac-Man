Blinky blinky = new Blinky();
Inky inky = new Inky();
Pinky pinky = new Pinky();
Clyde clyde = new Clyde();
float scale = 1;
Dot[][] dots = new Dot[30][36];
Rect[] walls = new Rect[42];
PImage[] deathanimation = new PImage[13];
int lives = 3;

public void Phasecheck(Ghosts ghost)
{
  if (ghost.phase == "scared")
  {
    ghost.Ghostspeed = 1.5;
    ghost.avspeed = int((ghost.Ghostspeed - 1) * 10);
  }
  else
  {
    ghost.Ghostspeed = 1.8;
    ghost.avspeed = int((ghost.Ghostspeed - 1) * 10);
  }
}
public void Phase(String phase)
{
  blinky.phase = phase;
  pinky.phase = phase;
  inky.phase = phase;
  clyde.phase = phase;
}
public void Ghostdraw()
{
  fill(255, 0, 0);
  rect(blinky.PosX + 1, blinky.PosY - 4, 35, 35);
  fill(255, 192, 203);
  rect(pinky.PosX + 1, pinky.PosY - 4, 35, 35);
  fill(100, 100, 255);
  rect(inky.PosX + 1, inky.PosY - 4, 35, 35);
  fill(255, 255, 100);
  rect(clyde.PosX + 1, clyde.PosY - 4, 35, 35);
  Phasecheck(blinky);
  Phasecheck(pinky);
  Phasecheck(inky);
  Phasecheck(clyde);
  ghostPosition(blinky);
  ghostPosition(pinky);
  ghostPosition(inky);
  ghostPosition(clyde);

  Ghostteleport(blinky);
  Ghostteleport(pinky);
  Ghostteleport(inky);
  Ghostteleport(clyde);

  blinky.Target();
  pinky.Target();
  inky.Target();
  clyde.Target();
}
public void Ghostdata()
{
  blinky.PosX = 600;
  blinky.PosY = 675;
  blinky.Direction = 1;
  pinky.PosX = 250;
  pinky.PosY = 675;
  pinky.Direction = 1;
  inky.PosX = 400;
  inky.PosY = 675;
  inky.Direction = 1;
  clyde.PosX = 250;
  clyde.PosY = 675;
  clyde.Direction = 1;
}
void setup()
{
  Ghostdata();
  for (int i = 0; i < 13; i++)
  {
    deathanimation[i] = loadImage("death/" +i+ ".png");
  }
  scale *= displayHeight / 1080f;
  frameRate(100);
  for (int i = 0; i < 30; i++)
  {
    for (int j = 0; j < 36; j++)
    {
      dots[i][j] = new Dot();
      nodes[i][j] = new Nodes();
    }
  }
  Dotdef();
  for (int i = 0; i < walls.length; i++)
  {
    walls[i] = new Rect();
  }
  color c = color(0, 0, 255);
  field(c);
  determineLayout(walls);
  crossingFinder(mapLayout);
  background(0);
  surface.setSize(int(710*scale), int(930*scale));
  surface.setLocation(int((displayWidth - 710*scale) / 2), 10);
  textSize(30);
  Phase("chase");
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
int reloadcount = 0;
boolean death = false;
int deathcount = 0;
boolean makeblack = false;
int animation = 0;
void Ghostteleport(Ghosts ghost)
{
  if (ghost.PosX < 0)
  {
    ghost.PosX = 29*25;
  }
  if (ghost.PosX > 29*25)
  {
    ghost.PosX = 0;
  }
}
void draw()
{
  background(0);
  scale(scale);
  if (cposx < 0)
  {
    cposx = 29*25 - 10;
  }
  if (cposx > 29*25 - 10)
  {
    cposx = 0;
  }
  if (reloadcount == 300)
  {
    makeblack = false;
    cposx = 356;
    cposy = 688;
    Dotdef();
    reloadcount = 0;
    boolcount = 0;
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
  fill(255, 255, 0);
  for (int i = 1; i < lives; i++)
  {
    arc(i*50 - 10, 900, csize + 13, csize + 13, 0.5 - PI, 5.78 - PI);
  }
  /*if (blinky.GIntersects())
   {
   death = true;
   }*/
  if (death)
  {
    deathcount++;
    towards = "";
    after = "";
    dir = "";
    count = 0;
  }
  if ((float)deathcount/35 < 2 && deathcount > 0)
  {
    fill(255, 255, 0);
    circle(cposx, cposy, csize + 13);
  }
  if ((float)deathcount/35 > 2)
  {
    fill(255, 255, 0);
    arc(cposx, cposy, csize + 13, csize + 13, (float)deathcount/35 - 2 - PI/2, PI*1.5 - (float)deathcount/35 + 2);
  }
  if ((float)deathcount/25 > PI*1.5 + 2 && animation < 26)
  {
    image(deathanimation[animation/2], cposx - csize + 3, cposy - csize + 5);
    animation++;
  } else if ((float)deathcount/25 > 10)
  {
    makeblack = true;
  }

  if ((float)deathcount/25 == 15)
  {
    cposx = 356;
    cposy = 688;
    lives--;
    animation = 0;
    count = 0;
    makeblack = false;
    deathcount = 0;
    death = false;
  }

  color c = color(0, 0, 255);
  if (boolcount == 244)
  {
    towards = "";
    after = "";
    dir = "";
    count = 0;
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
    } else if (reloadcount < 300)
    {
      makeblack = true;
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
  Ghostdraw();
  fill(255, 255, 0);
  if (dir != "")
  {
    arc(cposx, cposy, csize + 13, csize + 13, radx - 0.01*count, rady + 0.01*count%10);
  } else if (!death && lives > 0)
  {
    circle(cposx, cposy, csize + 13);
  }

  for (int i = 0; i < 26; i++)
  {
    for (int j = 0; j < 29; j++)
    {
      if (dots[i][j].Intersects() && dots[i][j].bool)
      {
        if (dots[i][j].big)
        {
          dots[i][j].bool = false;
          score += 50;
          boolcount++;
          Phase("scared");
        } else
        {
          dots[i][j].bool = false;
          score += 10;
          boolcount++;
        }
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
  text("Score: " + score, 20, 80);
  if (lives == 0)
  {
    fill(255, 0, 0);
    textSize(36); 
    text("GAME  OVER", 245, 553);
  }
  if (makeblack)
  {
    background(0);
  }
  debug = false;
}
String dir = "";
boolean debug = false;
void keyPressed()
{
  if (keyCode == 'B')
  {
    debug = true;
  }
  if (lives > 0)
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
}
int speed = 2;

String towards = "";
