int random = 0; //<>//
void ghostPosition(Ghosts ghost) // megállapitja hol van a szellem és ettől függően vagy tovább adja a ghostMovement függvényhez anélkül, hogy megváltoztatná az irányát, vagy a ghostDecision függvényhez adja tovább ha egy kereszteződésben van
{
  random = 0;
  int rnd = int(random(100));
  if(rnd < ghost.randomspeed)
  {
    random = 1;
  }
  if (ghost.cooldown < 3)
  {
    ghost.cooldown++;
  }
  if (ghost.PosX % 25 == 0 && ghost.PosY % 25 == 0 && nodes[ghost.PosX/25][ghost.PosY/25].exists)
  {
    ghostDecision(ghost);
  } 
  else if (ghost.PosX % 25 < ghost.delta+random && nodes[(ghost.PosX-1)/25][ghost.PosY/25].exists)
  {
    ghost.PosX-= ghost.PosX % 25;
    ghostDecision(ghost);
  } 
  else if (25-(ghost.PosX % 25) < ghost.delta+random && nodes[(ghost.PosX+1)/25][ghost.PosY/25].exists)
  {
    ghost.PosX+= 25 - ghost.PosX % 25;
    ghostDecision(ghost);
  }
  else if (ghost.PosY % 25 < ghost.delta+random && nodes[ghost.PosX/25][(ghost.PosY-1)/25].exists)
  {
    ghost.PosY-= ghost.PosY % 25;
    ghostDecision(ghost);
  }
  else if (25-(ghost.PosY % 25) < ghost.delta+random && nodes[ghost.PosX/25][(ghost.PosY+1)/25].exists)
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
  if (ghost.scount < ghost.decimalSpeed)
  {
    ghost.delta = ghost.roundDownSpeed+1+random;
  } else
  {
    ghost.delta = ghost.roundDownSpeed+random;
  }
  switch(ghost.Direction)
  {
  case 0:
    if (ghost.scount < ghost.decimalSpeed)
    {
      ghost.PosY -= ghost.roundDownSpeed+1+random;
    } else
    {
      ghost.PosY -= ghost.roundDownSpeed+random;
    }
    break;

  case 1:
    if (ghost.scount < ghost.decimalSpeed)
    {
      ghost.PosX += ghost.roundDownSpeed+1+random;
    } else
    {
      ghost.PosX += ghost.roundDownSpeed+random;
    }
    break;

  case 2:
    if (ghost.scount < ghost.decimalSpeed)
    {
      ghost.PosY += ghost.roundDownSpeed+1+random;
    } else
    {
      ghost.PosY += ghost.roundDownSpeed+random;
    }
    break;

  case 3:
    if (ghost.scount < ghost.decimalSpeed)
    {
      ghost.PosX -= ghost.roundDownSpeed+1+random;
    } else
    {
      ghost.PosX -= ghost.roundDownSpeed+random;
    }
  }
  ghost.scount++;
  if (ghost.scount == 10)
  {
    ghost.scount = 0;
  }
}


void ghostDecision(Ghosts ghost) // eldönti melyik irányban kell mennie hogy közelebb kerüljön a céljához (ha a scared phase-ben van akkor csak randoman választ irányt) majd tovább adja a ghostMovementhez
{
  int ghostTileX = ghost.PosX/25;
  int ghostTileY = ghost.PosY/25;
  float closestValue = 99999;
  int closestDirection = -1;
  if (!ghost.scared)
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
    if (ghost.cooldown == 3)
    {
      if(closestDirection != 0 || !((ghost.PosX/25 == 12 || ghost.PosX/25 == 15) && (ghost.PosY/25 == 27 || ghost.PosY/25 == 15)))
      {
        ghost.Direction = closestDirection;
        if(ghost.Direction == 3 && ghostTileX == 6 && ghostTileY == 18)
        { //<>//
          ghost.Ghostspeed = 0.9;
          ghost.tunnel = true;
        }
        else if(ghost.Direction == 1 && ghostTileX == 21 && ghostTileY == 18)
        {
          ghost.Ghostspeed = 0.9; //<>//
          ghost.tunnel = true;
        }
        else if(ghost.Direction != 1 && ghostTileX == 21 && ghostTileY == 18)
        {
          ghost.tunnel = false;
        }
        else if(ghost.Direction != 3 && ghostTileX == 6 && ghostTileY == 18)
        {
          ghost.tunnel = false;
        }
      } //<>//
      ghost.cooldown = 0;
    }
  } else
  {
    int k = 0;
    while (k == 0  && ghost.cooldown == 3)
    {
      int rnd = int(random(4));
      if (rnd != (ghost.Direction + 2) % 4)
      {
        switch(rnd)
        {
        case 0:
          if (nodes[ghostTileX][ghostTileY].upAccess && !((ghost.PosX/25 == 12 || ghost.PosX/25 == 15) && (ghost.PosY/25 == 27 || ghost.PosY/25 == 15)))
          {
            ghost.Direction = rnd;
            k++;
            ghost.cooldown = 0;
          }
          break;
        case 1:
          if (nodes[ghostTileX][ghostTileY].rightAccess)
          {
            ghost.Direction = rnd;
            k++;
            ghost.cooldown = 0;
          }
          break;
        case 2:
          if (nodes[ghostTileX][ghostTileY].downAccess)
          {
            ghost.Direction = rnd;
            k++;
            ghost.cooldown = 0;
          }
          break;
        case 3:
          if (nodes[ghostTileX][ghostTileY].leftAccess)
          {
            ghost.Direction = rnd;
            k++;
            ghost.cooldown = 0;
          }
          break;
        }
      }
    }
    k = 0;
  }
  ghostMovement(ghost);
}
