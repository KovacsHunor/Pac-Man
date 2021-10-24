class Ghosts
{
  int CaughtX = 13;
  int CaughtY = 14;
  int PosX;
  int PosY;
  int TargetX;
  int TargetY;
  int Direction; //0 = up, 1 = right, 2 = down, 3 = left
  String phase;
  void Target(Ghosts blinky, String phase)
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
}
class Blinky extends Ghosts
{
  int ScatterX = 25;
  int ScatterY = -1;
  void Target(Ghosts blinky, String phase)
  {
    switch(phase)
    {
    case "chase":
      TargetX = cposx/25;
      TargetY = cposy/25;
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
  void Target(Ghosts blinky, String phase)
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
  int ScatterX = 34;
  int ScatterY = 27;
  void Target(Ghosts blinky, String phase)
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

      TargetX = blinky.PosX/25 - 2*(cposx/25 + deltaX);
      TargetY = blinky.PosY/25 - 2*(cposy/25 + deltaY);
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
  void Target(Ghosts blinky, String phase)
  {
    switch(phase)
    {
    case "chase":
      if (sqrt(sq(PosX - cposx) + sq(PosY - cposy)) <= 8)
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
