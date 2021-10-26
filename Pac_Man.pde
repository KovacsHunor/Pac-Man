Blinky blinky = new Blinky();
Inky inky = new Inky();
Pinky pinky = new Pinky();
Clyde clyde = new Clyde();
float scale = 1;
Dot[][] dots = new Dot[30][36];
Rect[] walls = new Rect[42];
PImage[] deathanimation = new PImage[13];
int lives = 3;

public void Phasecheck(Ghosts ghost, boolean wantsToTurn)
{
  if (ghost.wantsToTurn && ghost.cooldown == 3)
  {
    ghost.Direction = (ghost.Direction + 2) % 4;
    ghost.wantsToTurn = false;
    ghost.cooldown = 0;
  }
  if (ghost.scared)
  {
    ghost.Ghostspeed = 1.5;
    ghost.roundDownSpeed = int(ghost.Ghostspeed);
    ghost.decimalSpeed = int((ghost.Ghostspeed - 1) * 10);
    if (ghost.Intersects())
    {
      ghost.caught = true;
    }
  } else
  {
    ghost.Ghostspeed = 1.8;
    ghost.roundDownSpeed = int(ghost.Ghostspeed);
    ghost.decimalSpeed = int((ghost.Ghostspeed - 1) * 10);
  }
  if (ghost.caught)
  {
    ghost.Ghostspeed = 2;
    ghost.roundDownSpeed = int(ghost.Ghostspeed);
    ghost.decimalSpeed = int((ghost.Ghostspeed - 1) * 10);
    ghost.scared = false;
    if (ghost.CaughtX == ghost.PosX/25 && ghost.CaughtY == ghost.PosY/25)
    {
      ghost.caught = false;
    }
  }
}
public void Outgo(Ghosts ghost)
{
  if (ghost.PosY > 15*25) //<>//
  {
    ghost.PosY-= 1;
  } else
  {
    ghost.Direction = 1; //<>//
    ghost.start = false;
  }
}

public void Ghostdata()
{
  blinky.PosX = 339;
  blinky.PosY = 375;
  //  blinky.Direction = 1;
  pinky.PosX = 339;
  pinky.PosY = 450;
  //pinky.Direction = 1;
  inky.PosX = 288;
  inky.PosY = 450;
  //inky.Direction = 1;
  clyde.PosX = 390;
  clyde.PosY = 450;
  //clyde.Direction = 1;
}
public void Ghostgraphic()
{
  fill(255, 0, 0);
  rect(blinky.PosX + 1, blinky.PosY - 4, 35, 35);
  fill(255, 192, 203);
  rect(pinky.PosX + 1, pinky.PosY - 4, 35, 35);
  fill(100, 100, 255);
  rect(inky.PosX + 1, inky.PosY - 4, 35, 35);
  fill(255, 255, 100);
  rect(clyde.PosX + 1, clyde.PosY - 4, 35, 35);
}
public void Ghostdraw(Ghosts ghost)
{
  if (!ghost.start)
  {
    Phasecheck(ghost, ghost.wantsToTurn);
    ghostPosition(ghost);
    Ghostteleport(ghost);
    ghost.Target();
  }
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
  blinky.phase = "chase";
  pinky.phase = "chase";
  inky.phase = "chase";
  clyde.phase = "chase";

  //blinky.caught = true;
  //pinky.caught = true;
  //inky.caught = true;
  //clyde.caught = true;
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
int housecount;




void draw()
{
   background(0);
  scale(scale);
  if (housecount < 1397)
  {
    housecount++;
  }
  switch(housecount)
  {
  case 0:
    blinky.start = true;
    break;
  case 400:
    pinky.start = true;
    break;
  case 800:
    inky.start = true;
    break;
  case 1200:
    clyde.start = true;
    break;
  }
  switch(housecount/400)
  {
  case 0:
    blinky.Start();
    break;
  case 1:
    pinky.Start();
    break;
  case 2:
    inky.Start();
    break;
  case 3:
    clyde.Start();
    break;
  }
  
 
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
          blinky.Phase("scared");
          pinky.Phase("scared");
          inky.Phase("scared");
          clyde.Phase("scared");
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
  Ghostgraphic();
  Ghostdraw(blinky);
  Ghostdraw(pinky);
  Ghostdraw(inky);
  Ghostdraw(clyde);
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
