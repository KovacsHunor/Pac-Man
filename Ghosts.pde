class Ghosts
{
  boolean wantsToTurn = false;
  int cooldown = 3;
  float Ghostspeed;
  int roundDownSpeed;
  int decimalSpeed;
  int randomspeed;
  int CaughtX = 13;
  int CaughtY = 15;
  int PosX;
  int PosY;
  int TargetX;
  int TargetY;
  int Direction; //0 = up, 1 = right, 2 = down, 3 = left
  String phase = "chase";
  int scount;  
  boolean scared = false;
  boolean caught = false;
  boolean start;
  boolean house;
  boolean back;
  color Color;
  boolean tunnel;
  int delta = 2;
  
  
  void Back()
  {
  }
  void Start()
  {
  }
  boolean Intersects()
  {
    boolean bool = false;
    if (cposx-10/2 < PosX + 35 && cposx+10/2 > PosX && cposy-10/2 < PosY + 35 && cposy+10/2 > PosY)
    {
      bool = true;
    }
    return bool;
  }
  
  void Target()
  {
  }
  
  boolean Collides()
  {
    boolean bool = false;
    if (cposx-csize/2 < PosX-25 && cposx+csize/2 > PosX && cposy-csize/2 < PosY-25 && cposy+csize/2 > PosY)
    {
      bool = true;
    }
    return bool;
  }
  void Phase(String inputPhase)
  {
    if(phase != inputPhase && !scared && !caught)
    {
      wantsToTurn = true;
    }
    if(inputPhase == "scared")
    {
      scared = true;
      numCaught = 0;
    }
    else
    {
      phase = inputPhase;
    }
  }
  
}
class Blinky extends Ghosts
{
  int ScatterX = 25;
  int ScatterY = -1;
  
  void Target()
  {
    switch(phase)
    {
    case "chase":
      TargetX = (cposx - cposx%25)/25;
      TargetY = (cposy - cposy%25)/25;
      break;

    case "scatter":
      TargetX = ScatterX;
      TargetY = ScatterY;
      break;
    }
    if(caught)
    {
      TargetX = CaughtX;
      TargetY = CaughtY;
    }
  }
  void Start()
{
    if(blinky.start)
    {
      Outgo(blinky);
    }
}
 void Back()
{
  blinky.start = true;
  blinky.back = false;
}
}
class Pinky extends Ghosts
{
  int ScatterX = 2;
  int ScatterY = -1;
  void Target()
  {
    switch(phase)
    {
    case "chase":
      int deltaX = 0;
      int deltaY = 0;
      switch(dir)
      {
      case "up":
        deltaY = -4;
        deltaX = -4;
        break;

      case "down":
        deltaY = 4;
        break;

      case "left":
        deltaX = -4;
        break;

      case "right":
        deltaX = 4;
        break;
      }
      TargetX = cposx/25 + deltaX;
      TargetY = cposy/25 + deltaY;
      break;

    case "scatter":
      TargetX = ScatterX;
      TargetY = ScatterY;
      break;
    }
    if(caught)
    {
      TargetX = CaughtX;
      TargetY = CaughtY;
    }
  }
  
  void Start()
{
    if(pinky.start)
    {
      Outgo(pinky);
    }
}
void Back()
{
  pinky.start = true; //<>//
  pinky.back = false;
}
}
class Inky extends Ghosts
{
  int ScatterX = 27;
  int ScatterY = 34;
  void Target()
  {
    switch(phase)
    {
    case "chase":
      int deltaX = 0;
      int deltaY = 0;
      switch(dir)
      {
      case "up":
        deltaY = -2;
        deltaX = -2;
        break;

      case "down":
        deltaY = 2;
        break;

      case "left":
        deltaX = -2;
        break;

      case "right":
        deltaX = 2;
        break;
      }
      TargetX = cposx/25 + deltaX + (cposx/25 + deltaX - blinky.PosX/25);
      TargetY = cposy/25 + deltaY + (cposy/25 + deltaY - blinky.PosX/25);
      break;

    case "scatter":
      TargetX = ScatterX;
      TargetY = ScatterY;
      break;
    }
    if(caught)
    {
      TargetX = CaughtX;
      TargetY = CaughtY;
    }
  }
  
 void Start()
{
  if(inky.start && inky.PosX < 13*25 + 12)
    {
     inky.PosX++;
    }
    else
    {
      Outgo(inky);
    }
}
void Back()
{
  if(inky.PosX > 287)
    {
     inky.PosX-= 2;
    }
    else
    {
      inky.start = true;
      inky.back = false;
      inky.Direction = -1;
      
    }
}
}
class Clyde extends Ghosts
{
  int ScatterX = 0;
  int ScatterY = 34;
  void Target()
  {
    switch(phase)
    {
    case "chase":
      if (sqrt(sq(PosX/25 - cposx/25) + sq(PosY/25 - cposy/25)) >= 8)
      {
        TargetX = cposx/25;
        TargetY = cposy/25;
      } else
      {
        TargetX = this.ScatterX;
        TargetY = this.ScatterY;
      }
      break;

    case "scatter":
      TargetX = ScatterX;
      TargetY = ScatterY;
      break;
    }
    if(caught)
    {
      TargetX = CaughtX;
      TargetY = CaughtY;
    }
  }
 void Start()
{
  if(clyde.start && clyde.PosX > 13*25 + 12)
    {
     clyde.PosX--;
    }
    else if(clyde.start)
    {
      Outgo(clyde);
    }
}
void Back()
{
  if(clyde.PosX < 389)
    {
     clyde.PosX+= 2;
    }
    else
    {
      clyde.start = true;
      clyde.back = false;
      clyde.Direction = -1;
    }
}
}
