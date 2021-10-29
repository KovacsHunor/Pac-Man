Blinky blinky = new Blinky(); //<>// //<>// //<>// //<>//
Inky inky = new Inky();
Pinky pinky = new Pinky();
Clyde clyde = new Clyde();

int bug = 0;

int eating = 0;
int highscore;
float maxSpeed = 2.4;
float speed = 2;
int pRoundDown = int(speed);
int pDecimal = int((speed - pRoundDown) * 10);
int pRandom = int((speed - pRoundDown) * 100)-pDecimal*10;
float percent = 0.8;
int pcount = 0;
int pRan = 0;
int pDelta = 0;
float scale = 1;
Dot[][] dots = new Dot[30][36];
Rect[] walls = new Rect[46];
PImage[] deathanimation = new PImage[13];
PImage[] fruitsp = new PImage[8];
int lives = 3;
int level = 1;

String chase = "20,30,40,40,40,50,50,50,60";

String swap = "7,20,7,20,5,20,5";
String swap24 = "7,20,7,20,5,1033.234,0.002";
String swap5 = "5,20,5,20,5,1037.234,0.002";

String frightentime = "6,5,4,3,2,5,2,2,1,5,2,1,1,3,1,1,0,1,0";

String GtunnelSpeed = "40,45,45,45,50";
String GfrightSpeed = "50,55,55,55,60";
String GnormSpeed = "75,85,85,85,95";

String frightSpeed = "90,95,95,95,100";
String normSpeed = "80,90,90,90,100";
int ghostStop = 0;
int numCaught = 0;
public int TwoPowers(int a)
{
  int b = 1;
  for (int i = 0; i<a; i++)
  {
    b *= 2;
  }
  return b;
}
public void Phasecheck(Ghosts ghost, boolean wantsToTurn)
{
  boolean blinkyspeed = false;
  int i = level;
  if (i > 9)
  {
    i = 9;
  }
  if(240 - boolcount <= int(split(chase,',')[i - 1]))
  {
    blinky.phase = "chase";
    blinkyspeed = true;
  }
  if (i > 5)
  {
    i = 5;
  }
  if (ghost.caught)
  {
    percent = 1.2;
  } else if (ghost.tunnel)
  {
    percent = float(split(GtunnelSpeed, ',')[i-1])/100f;
  } else if (ghost.scared)
  {
    percent = float(split(GfrightSpeed, ',')[i-1])/100f;
  } else
  {
    percent = float(split(GnormSpeed, ',')[i-1])/100f;
    if(blinkyspeed && ghost == blinky)
    {
      percent = float(split(normSpeed, ',')[i-1])/100f;
    }
  }
  ghost.Ghostspeed = maxSpeed*percent;
  if (ghost.Intersects() && !ghost.scared && !ghost.caught && !ghost.start)
  {
     death = true;
  }
  if (ghost.wantsToTurn && ghost.cooldown == 3 && ghost.Direction != -1)
  {
    ghost.Direction = (ghost.Direction + 2) % 4;
    ghost.wantsToTurn = false;
    ghost.cooldown = 0;
  }

  if (ghost.scared)
  {

    if (ghost.Intersects())
    {
      ghost.caught = true;
      numCaught++;
      score += 100*(TwoPowers(numCaught));
      smallscore[0] = 100*(TwoPowers(numCaught));
      smallcount = 100;
      ghostStop = 100;
      smallscore[1] = ghost.PosX - 1;
      smallscore[2] = ghost.PosY + 23;
      smallscorec = color(100, 255, 255);
    }
  } 
  if (ghost.caught)
  {

    ghost.scared = false;
    if (ghost.CaughtX*25 + 15 > ghost.PosX && ghost.CaughtX*25 + 11 < ghost.PosX && ghost.CaughtY == ghost.PosY/25)
    {

      ghost.back = true;
      ghost.caught = false;
    }
  }
  ghost.roundDownSpeed = int(ghost.Ghostspeed);
  ghost.decimalSpeed = int((ghost.Ghostspeed - ghost.roundDownSpeed) * 10);
  ghost.randomspeed = int((ghost.Ghostspeed - ghost.roundDownSpeed) * 100)-ghost.decimalSpeed*10;
}
public void Outgo(Ghosts ghost)
{
  if (ghost.PosY > 15*25)
  {
    ghost.PosY--;
  } else
  {
    if (ghost == blinky || ghost == pinky)
    {
      ghost.Direction = 3;
    } else
    {
      ghost.Target();
      ghostDecision(ghost);
    }
    ghost.start = false;
    ghost.house = false;
  }
}

public void InCome(Ghosts ghost)
{
  if (ghost.CaughtX*25 + 15 > ghost.PosX && ghost.CaughtX*25 + 11 < ghost.PosX && 15*25 <= ghost.PosY && ghost.PosY < 450)
  {
    ghost.PosY+= 2;
  } else
  {
    ghost.Back();
    inkytimer = 0;
    clydetimer = 0;
  }
}
public void UnderGhostData(Ghosts ghost)
{
  ghost.house = false;
  ghost.Direction = -1;
  ghost.back = false;
  ghost.start = false;
  ghost.scared = false;
  ghost.caught = false;
  ghost.phase = "scatter";
}
public void GhostData()
{
  index = 0;
  timer = 0;
  blinky.PosX = 338;
  blinky.PosY = 375;
  pinky.PosX = 338;
  pinky.PosY = 450;
  inky.PosX = 287;
  inky.PosY = 450;
  clyde.PosX = 389;
  clyde.PosY = 450;
  inkytimer = 0;
  clydetimer = 0;
  UnderGhostData(blinky);
  UnderGhostData(inky);
  UnderGhostData(pinky);
  UnderGhostData(clyde);
}
public void Ghostdraw(Ghosts ghost)
{
  
  int feet;
  if(Animation) feet = 0;
  else feet = 1;
  
  if (beginning)
  {
    boolean drawn = false;
    fill(ghost.Color);
    if (ghost.scared)
  {
    if (!flashbool)
    {
      image(scaredGhost1[feet], ghost.PosX + 1, ghost.PosY - 4, 35, 35);
    } 
    else
    {
      image(scaredGhost2[feet], ghost.PosX + 1, ghost.PosY - 4, 35, 35);
    }
    drawn = true;
  }

    if (ghost.caught && ghostStop == 0)
    {
      image(ghostCaught[ghost.Direction], ghost.PosX + 1, ghost.PosY - 4, 35, 13);
      drawn = true;
    }

    if (!drawn && ghostStop == 0)
    {
      if(ghost.Direction != -1)
  {
  image(ghost.ghostNormal[ghost.Direction][feet], ghost.PosX + 1, ghost.PosY - 4, 35, 35);
  }
  else
  {
  image(ghost.ghostNormal[2][1], ghost.PosX + 1, ghost.PosY - 4, 35, 35);
  }
    }

    if (ghostStop == 0)
    {
      Phasecheck(ghost, ghost.wantsToTurn);
    }


    if (!ghost.start && !ghost.back && ghostStop == 0)
    {
      ghostPosition(ghost);
      Ghostteleport(ghost);
      ghost.Target();
      if (canMovei == 1)
      {
        ghost.start = true; 
        timer = 0;
        index = 0;
      }
    }
  }
}
PImage[] scaredGhost1 = new PImage[2];
PImage[] scaredGhost2 = new PImage[2];
PImage[] ghostCaught = new PImage[4];
boolean beginning = true;
BufferedReader reader;
String line;
void setup()
{
  reader = createReader("highscore.txt");
  try {
    line = reader.readLine();
  } 
  catch (IOException e) {
    noLoop();
  }
  highscore = int(line);
  PFont bit;
  bit = createFont("Font.ttf", 25);
  textFont(bit);
  blinky.Color = color(255, 0, 0);
  pinky.Color = color(255, 184, 255);
  inky.Color = color(0, 255, 255);
  clyde.Color = color(255, 184, 82);
  for (int i = 0; i < 13; i++)
  {
    deathanimation[i] = loadImage("death/" +i+ ".png");
  }
  
  for(int i = 0; i < 4; i++)
  {
    for(int f = 1; f <= 2; f++)
    {
      blinky.ghostNormal[i][f-1] = loadImage("GhostAnimationNew/blinky"+i+"-"+f+".png");
      inky.ghostNormal[i][f-1] = loadImage("GhostAnimationNew/inky"+i+"-"+f+".png");
      pinky.ghostNormal[i][f-1] = loadImage("GhostAnimationNew/pinky"+i+"-"+f+".png");
      clyde.ghostNormal[i][f-1] = loadImage("GhostAnimationNew/clyde"+i+"-"+f+".png");
    
      ghostCaught[i] = loadImage("GhostAnimationNew/ghostCaught-"+i+".png");
    }
  }
  
  scaredGhost1[0] = loadImage("GhostAnimationNew/ghostScared-1.png");
  scaredGhost1[1] = loadImage("GhostAnimationNew/ghostScared-2.png");
  scaredGhost2[0] = loadImage("GhostAnimationNew/ghostNotScared-1.png");
  scaredGhost2[1] = loadImage("GhostAnimationNew/ghostNotScared-2.png");
  
  for (int i = 0; i < 8; i++)
  {
    fruitsp[i] = loadImage("fruits/" +i+ ".png");
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
  GhostData();

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
}
int csize = 23;
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
boolean death;
int deathcount = 0;
boolean makeblack;
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
void IntoHouse(Ghosts ghost)
{
  if (ghost.back)
  {
    InCome(ghost);
  }
}
int housecount;
int timer = 0;
int index = 0;
int inkytimer = 0;
int clydetimer = 0;
int frightened = 0;
int flash = 0;
boolean flashbool;
int indexAnimation = 0;
boolean Animation;
String fruits = "012233445566";
String fruitscore = "100,300,500,700,1000,2000,3000";
String levelfruits = "7777777665544332210";
int fruitCounter = 0;
boolean fruitbool;
boolean fboola = true;
boolean fboolb = true;
int[] smallscore = new int[3];
int smallcount = 0;
color smallscorec;
public void Fruits()
{

  if (lives > 0)
  {
    int b = 19 - level;
    if (b < 0)
    {
      b = 0;
    }
    int a = 18;
    if (level > 7)
    {
      a = 18 + 7 - level;
    }
    if (a < 7)
    {
      a = 7;
    }
    if (level > 18)
    {
      for (int i = 0; i < 7; i++)
      {
        image(fruitsp[7], 650 - 35*i, 880);
      }
    } else
    {
      for (int i = b; i <= a; i++)
      {
        image(fruitsp[int(levelfruits.charAt(i)) - 48], 18*35 - a*35 + 20 + 35*i, 880);
      }
    }
    if (fboola && boolcount == 70)
    {
      fruitbool = true;
      fboola = false;
    }
    if (fboolb && boolcount == 170)
    {
      fruitbool = true;
      fboolb = false;
    }
    if (cposx >= 340 && cposx <= 371 && cposy > 536 && cposy < 540 && fruitbool)
    {
      smallcount = 150;
      fruitbool = false; 
      smallscore[1] = 334;
      smallscore[2] = 547;
      smallscorec = color(255, 125, 125);
      if (level < 13)
      {
        score += int(split(fruitscore, ',')[int(fruits.charAt(level-1)) - 48]);
        smallscore[0] = int(split(fruitscore, ',')[int(fruits.charAt(level-1)) - 48]);
      } else
      {
        score += 5000;
        smallscore[0] = 5000;
      }
      fruitCounter = 0;
    } else if (fruitbool && fruitCounter < 1500)
    {
      if (level < 13)
      {
        image(fruitsp[int(fruits.charAt(level-1)) - 48], 338, 522);
      } else
      {
        image(fruitsp[7], 338, 522);
      }
      fruitCounter++;
    } else
    {
      fruitCounter = 0;
      fruitbool = false;
    }
  }
}
String[] help = new String[1];
void draw()
{
  scale(scale);
  indexAnimation++;
  if(indexAnimation == 10)
  {
    Animation = !Animation;
    indexAnimation = 0;
  }
  background(0);

  if (score > highscore)
  {
    highscore = score;
  }
  if (ghostStop > 0)
  {
    ghostStop--;
  }
  if (frightened > 0)
  {
    frightened--;
    if (frightened < 225)
    {
      flash = (flash+1)%25;
      if (flash == 0)
      {
        flashbool = !flashbool;
      }
    }
  } else
  {
    blinky.scared = false;
    pinky.scared = false;
    inky.scared = false;
    clyde.scared = false;
  }
  Fruits();
  if (index < split(swap, ',').length)
  {
    if (timer < int(float(split(swap, ',')[index])*100))
    {
      timer++;
    } else
    {
      if (pinky.phase == "scatter")
      {
        blinky.Phase("chase");
        pinky.Phase("chase");
        inky.Phase("chase");
        clyde.Phase("chase");
      } else
      {
        blinky.Phase("scatter");
        pinky.Phase("scatter");
        inky.Phase("scatter");
        clyde.Phase("scatter");
      }
      index++;
      timer = 0;
    }
  } else if (index == split(swap, ',').length)
  {
    blinky.Phase("chase");
    pinky.Phase("chase");
    inky.Phase("chase");
    clyde.Phase("chase");
  }
  IntoHouse(blinky);
  IntoHouse(pinky);
  IntoHouse(inky);
  IntoHouse(clyde);
  if (blinky.start)
  {
    blinky.Start();
  }
  if (pinky.start)
  {
    pinky.Start();
  }
  if (inky.start)
  {

    inkytimer++;
    if (inkytimer == 300 || level > 1)
    {
      inky.house = true;
    }
    if (inky.house)
    {
      inky.Start();
    }
  }
  if (clyde.start)
  {
    clydetimer++;
    if (clydetimer == 800 || level > 2)
    {
      clyde.house = true;
    }
    if (clyde.house)
    {
      clyde.Start();
    }
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
    beginning = true;
    index = 0;
    timer = 0;
    frightened = 0;
    numCaught = 0;
    flashbool = false;
    flash = 0;
    level++;
    if (level >= 2 && level <= 4)
    {
      swap = swap24;
    } else
    {
      swap = swap5;
    }
    makeblack = false;
    cposx = 356;
    cposy = 688;
    Dotdef();
    GhostData();
    canMovei = 0;
    reloadcount = 0;
    boolcount = 0;
  }
  if (level < 21)
  {
    if (frightened > 0)
    {
      int i = level;
      if (i > 5)
      {
        i = 5;
      }
      percent = float(split(frightSpeed, ',')[i-1])/100f;
    } else
    {
      int i = level;
      if (i > 5)
      {
        i = 5;
      }
      percent = float(split(normSpeed, ',')[i-1])/100f;
    }
  } else
  {
    percent = 0.9;
  }
  if (eating > 0)
  {
    percent -= 0.09 + ((percent - 0.8) / 5);
  }
  speed = maxSpeed * percent;
  pRoundDown = int(speed);
  pDecimal = int((speed - pRoundDown) * 10);
  pRandom = int((speed - pRoundDown) * 100)-pDecimal*10;
  pDelta = 0;
  if (pcount < pDecimal)
  {
    pDelta = 1;
  }
  pRan = 0;
  int rnd = int(random(100));
  if (rnd < pRandom)
  {
    random = 1;
  }
  bug = 0;
  if (pRoundDown + pDelta + pRan < 2)
  {
    bug = 2 - (pRoundDown + pDelta + pRan);
  }
  if (eating > 0)
  {
    eating -= pRoundDown + pDelta + pRan;
  }



  pcount = (pcount + 1) % 10;
  if (death)
  {
    beginning = false;
    GhostData();
    canMovei = 0;
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

    beginning = true;
    cposx = 356;
    cposy = 688;
    lives--;
    animation = 0;
    count = 0;
    makeblack = false;
    deathcount = 0;
    GhostData();
    canMovei = 0;
    death = false;
  }
  if (score > 10000 && !bonus)
  {
    bonus = true;
    lives++;
  }
  color c = color(0, 0, 255);
  if (boolcount == 244)
  {
    beginning = false;
    GhostData();
    canMovei = 0;
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
  if (smallcount > 0)
  {
    smallcount--;
    textSize(14);
    if (String.valueOf(smallscore[0]).length() == 4)
    {
      textSize(12);
      smallscore[1]-= 2;
    }
    fill(smallscorec);
    text(smallscore[0], smallscore[1], smallscore[2]);
    if (String.valueOf(smallscore[0]).length() == 4)
    {
      smallscore[1]+= 2;
    }
    textSize(30);
  }
  fill(255, 255, 0);
  if (dir != "" && ghostStop == 0)
  {
    arc(cposx, cposy, csize + 13, csize + 13, radx - 0.01*count, rady + 0.01*count%10);
  } else if (!death && lives > 0 && ghostStop == 0)
  {
    circle(cposx, cposy, csize + 13);
  }

  for (int i = 0; i < 26; i++)
  {
    for (int j = 0; j < 29; j++)
    {
      if (dots[i][j].Intersects() && dots[i][j].bool)
      {
        eating = 25;
        if (dots[i][j].big)
        {
          flashbool = false;
          dots[i][j].bool = false;
          score += 50;
          boolcount++;
          blinky.Phase("scared");
          pinky.Phase("scared");
          inky.Phase("scared");
          clyde.Phase("scared");
          if (level <= split(frightentime, ',').length)
          {
            frightened = int(split(frightentime, ',')[level-1])*100;
          } else
          {
            frightened = 0;
          }
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
    canMovei++;
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
  if (canMovei > 1 && ghostStop == 0)
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
  fill(255);
  text("Score", 50, 50);
  text(score, 123 - String.valueOf(score).length()*15, 94);
  text("High Score", 360, 50);
  text(highscore, 510 - String.valueOf(highscore).length()*15, 94);
  if (lives == 0)
  {
    fill(255, 0, 0);
    textSize(26); 
    text("GAME OVER", 241, 553);
    help[0] = String.valueOf(highscore);
    saveStrings("highscore.txt", help);
  }

  Ghostdraw(blinky);
  Ghostdraw(pinky);
  Ghostdraw(inky);
  Ghostdraw(clyde);

  fill(255, 255, 0);
  for (int i = 1; i < lives; i++)
  {
    arc(i*50 - 10, 900, csize + 13, csize + 13, 0.5 - PI, 5.78 - PI);
  }
  if (makeblack)
  {
    background(0);
  }
}
int canMovei = 0;
String dir = "";
boolean debug = false;
boolean bonus;
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

String towards = "";
