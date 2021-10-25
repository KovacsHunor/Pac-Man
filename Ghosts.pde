class Ghosts
{
  int cooldown = 4;
  float Ghostspeed;
  int avspeed;
  int CaughtX = 13;
  int CaughtY = 14;
  int PosX;
  int PosY;
  int TargetX;
  int TargetY;
  int Direction; //0 = up, 1 = right, 2 = down, 3 = left
  String phase;
  int scount;  
  void Target()
  {
  }
  public boolean GIntersects()
  {
    boolean bool = false;
    if (cposx-csize/2 < PosX +38 && cposx+csize/2 > PosX && cposy-csize/2 < PosY + 38 && cposy+csize/2 > PosY)
    {
      bool = true;
    }
    return bool;
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
}
class Blinky extends Ghosts
{
  int ScatterX = 25;
  int ScatterY = -1;
  public void Target()
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

    case "caught":
      TargetX = CaughtX;
      TargetY = CaughtY;
      break;
    }
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

    case "caught":
      TargetX = CaughtX;
      TargetY = CaughtY;
      break;
    }
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

      TargetX = cposx/25 + (cposx/25 - blinky.PosX/25);
      TargetY = cposy/25 + (cposy/25 - blinky.PosY/25);
      break;

    case "scatter":
      TargetX = ScatterX;
      TargetY = ScatterY;
      break;

    case "caught":
      TargetX = CaughtX;
      TargetY = CaughtY;
      break;
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

    case "caught":
      TargetX = CaughtX;
      TargetY = CaughtY;
      break;
    }
  }
}
