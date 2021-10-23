class Ghosts
{
  int PosX;
  int PosY;
  int TargetX;
  int TargetY;
  void Target(Ghosts blinky)
  {
    
  }
}
class Blinky extends Ghosts
{
  int ScatterX = 25;
  int ScatterY = -1;
  void Target(Ghosts blinky)
  {
    TargetX = cposx/25;
    TargetY = cposy/25;
  }
}
class Pinky extends Ghosts
{
  int ScatterX = 2;
  int ScatterY = -1;
  void Target(Ghosts blinky)
  {
    int deltaX = 0;
    int deltaY = 0;
    switch(dir)
    {
      case "up":
      deltaY = -4;
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
  }
}
class Inky extends Ghosts
{
  int ScatterX = 34;
  int ScatterY = 27;
  void Target(Ghosts blinky)
  {    
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
    
  }
}
class Clyde extends Ghosts
{
  int ScatterX = 0;
  int ScatterY = 34;
  void Target(Ghosts blinky)
  {
    if(sqrt(sq(PosX - cposx) + sq(PosY - cposy)) <= 8)
    {
      TargetX = cposx/25;
      TargetY = cposy/25;
    }
    else
    {
      TargetX = this.ScatterX;
      TargetY = this.ScatterY;
    }
  }
}