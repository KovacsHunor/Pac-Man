
void ghostPosition(Ghosts ghost) // megállapitja hol van a szellem és ettől függően vagy tovább adja a ghostMovement függvényhez anélkül, hogy megváltoztatná az irányát, vagy a ghostDecision függvényhez adja tovább ha egy kereszteződésben van //<>// //<>// //<>//
{ //<>//
    if(ghost.PosX % 25 == 0 && ghost.PosY % 25 == 0 && nodes[ghost.PosX/25][ghost.PosY/25].exists)
    {
      ghostDecision(ghost);
    }
    else if(ghost.PosX % 25 < ghost.Ghostspeed && nodes[(ghost.PosX-1)/25][ghost.PosY/25].exists)
    {
      ghost.PosX-= ghost.PosX % 25; //<>//
      ghostDecision(ghost);
    }
    else if(ghost.PosX % 25 > 25-ghost.Ghostspeed && nodes[(ghost.PosX+1)/25][ghost.PosY/25].exists)
    {
     ghost.PosX+= 25 - ghost.PosX % 25; 
      ghostDecision(ghost);
    }
    else if(ghost.PosY % 25 < ghost.Ghostspeed && nodes[ghost.PosX/25][(ghost.PosY-1)/25].exists)
    {
     ghost.PosY-= ghost.PosY % 25; 
      ghostDecision(ghost);
    }
    else if(ghost.PosY % 25 > 25-ghost.Ghostspeed && nodes[ghost.PosX/25][(ghost.PosY+1)/25].exists)
    {
     ghost.PosY+= 25 - ghost.PosY % 25; 
      ghostDecision(ghost);
    }
    else
    {
     ghostMovement(ghost); 
    }
}



void ghostMovement(Ghosts ghost) //tovább mozgatja a szellemet az irányától függően
{
  switch(ghost.Direction)
  {
  case 0:
    ghost.PosY -= ghost.Ghostspeed;
    break;

  case 1:
    ghost.PosX += ghost.Ghostspeed;
    break;

  case 2:
    ghost.PosY += ghost.Ghostspeed;
    break;

  case 3:
    ghost.PosX -= ghost.Ghostspeed;
  }
}


void ghostDecision(Ghosts ghost) // eldönti melyik irányban kell mennie hogy közelebb kerüljön a céljához (ha a scared phase-ben van akkor csak randoman választ irányt) majd tovább adja a ghostMovementhez
{
  int ghostTileX = ghost.PosX/25;
  int ghostTileY = ghost.PosY/25;
  float closestValue = 99999;
  int closestDirection = -1;
  if (ghost.phase != "scared")
  {
    if (nodes[ghostTileX][ghostTileY].upAccess && ghost.Direction != 2)
    {
      float distance = sq(ghostTileX-ghost.TargetX) + sq(ghostTileY-1-ghost.TargetY);

      if (distance < closestValue)
      {
        closestValue = distance;
        closestDirection = 0;
      }
    }


    if (nodes[ghostTileX][ghostTileY].leftAccess && ghost.Direction != 1)
    {
      float distance = sq(ghostTileX-1-ghost.TargetX) + sq(ghostTileY-ghost.TargetY);

      if (distance < closestValue)
      {
        closestValue = distance;
        closestDirection = 3;
      }
    }

    if (nodes[ghostTileX][ghostTileY].downAccess && ghost.Direction != 0)
    {
      float distance = sq(ghostTileX-ghost.TargetX) + sq(ghostTileY+1-ghost.TargetY);

      if (distance < closestValue)
      {
        closestValue = distance;
        closestDirection = 2;
      }
    }

    if (nodes[ghostTileX][ghostTileY].rightAccess && ghost.Direction != 3)
    {
      float distance = sq(ghostTileX+1-ghost.TargetX) + sq(ghostTileY-ghost.TargetY);

      if (distance < closestValue)
      {
        closestValue = distance;
        closestDirection = 1;
      }
    }
    ghost.Direction = closestDirection;
  } else
  {
    int k = 0;
    while (k == 0)
    {
      int rnd = int(random(4));
      if (rnd != invert(ghost.Direction))
      {
        switch(rnd)
        {
        case 0:
          if (nodes[ghostTileX][ghostTileY].upAccess)
          {
            ghost.Direction = rnd;
            k++;
          }
          break;
        case 1:
          if (nodes[ghostTileX][ghostTileY].rightAccess)
          {
            ghost.Direction = rnd;
            k++;
          }
          break;
        case 2:
          if (nodes[ghostTileX][ghostTileY].downAccess)
          {
            ghost.Direction = rnd;
            k++;
          }
          break;
        case 3:
          if (nodes[ghostTileX][ghostTileY].leftAccess)
          {
            ghost.Direction = rnd;
            k++;
          }
          break;
        }
      }
    }
    k = 0;
  }
  ghostMovement(ghost);
}

int invert(int number)
{
  switch(number)
  {
  case 0:
    return 2;

  case 1: 
    return 3;

  case 2:
    return 0;

  case 3:
    return 1;

  default:
    return 0;
  }
}
