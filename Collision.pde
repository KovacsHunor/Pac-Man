class Collision
{
  int z = 0;
  int corner = 4;
  public void Collide()
  {
    for (int i = 0; i < walls.length; i++)
    {
      if (Bool(i,true))
      {
        wall = true;
      }
       if(!Bool(i,true) && Bool(i,false))
      {
        z = i;
      }
    }
    if (!wall)
    {
      Set();
      wall = false;
      return;
    } else
    {
      dir = towards;
      wall = false;
    }
  }
  public void ACollide()
  {
    for (int i = 0; i < walls.length; i++)
    {
      if (Bool(i, true))
      {
        wall = true;
      }
    }
    if (!wall)
    {
      if (after != "")
      {
        dir = after;
      }
      wall = false;
      return;
    } else
    {
      wall = false;
    }
  }
  boolean Bool(int i, boolean cut)
  {
    return false;
  }
  void Tri()
  {
  }
  void Set()
  {
  }
}
class Left extends Collision
{

  boolean Bool(int i, boolean cut)
  {
     if(cut)
    {
      return  cposx-csize/2 < walls[i].r + (pRoundDown + pDelta + pRan + bug) + 1 && cposx - csize/2 > walls[i].l && ((cposy+csize/2 + 1 > walls[i].u + corner && walls[i].d - corner > cposy-csize/2 - 1));
    }
    else
    {
      return  cposx-csize/2 < walls[i].r + (pRoundDown + pDelta + pRan + bug) + 1 && cposx - csize/2 > walls[i].l && cposy+csize/2 + 1 > walls[i].u && walls[i].d > cposy-csize/2 - 1;
    }
  }
  void Set()
  {
    towards = "left";
    cposx -= pRoundDown+pDelta+pRan;
    pict = 3;
    if(!Bool(z,true) && Bool(z,false))
    {
      if(up.Bool(z,false))
      {
        cposy += pRoundDown+pDelta+pRan;
      }
      else if(down.Bool(z,false))
      {
        cposy -= pRoundDown+pDelta+pRan;
      }
    }
  }
  void Tri()
  {
    triangle(cposx - 38, cposy, cposx - 32, cposy + 6, cposx - 32, cposy - 6);
  }
}
class Right extends Collision
{

   boolean Bool(int i, boolean cut)
  {
    if(cut)
    {
      return cposx+csize/2 > walls[i].l - (pRoundDown + pDelta + pRan + bug) - 1 && cposx + csize/2 < walls[i].r && (cposy+csize/2 + 1 > walls[i].u + corner && walls[i].d - corner > cposy-csize/2 - 1);
    }
    else
    {
      return cposx+csize/2 > walls[i].l - (pRoundDown + pDelta + pRan + bug) - 1 && cposx + csize/2 < walls[i].r && cposy+csize/2 + 1 > walls[i].u && walls[i].d > cposy-csize/2 - 1;
    }
  }
  void Set()
  {
    towards = "right";
    cposx += pRoundDown+pDelta+pRan;
    pict = 6;
     if(!Bool(z,true) && Bool(z,false))
    {
      if(up.Bool(z,false))
      {
        cposy += pRoundDown+pDelta+pRan;
      }
      else if(down.Bool(z,false))
      {
        cposy -= pRoundDown+pDelta+pRan;
      }
    }
  }
  void Tri()
  {
    triangle(cposx + 38, cposy, cposx + 32, cposy + 6, cposx + 32, cposy - 6);
  }
}
class Up extends Collision
{

   boolean Bool(int i, boolean cut)
  {
    if(cut)
    {
      return cposy-csize/2 < walls[i].d + (pRoundDown + pDelta + pRan + bug) + 1 && cposy - csize/2 > walls[i].u && (cposx+csize/2 + 1 > walls[i].l + corner && walls[i].r - corner > cposx-csize/2 - 1);
    }
    else
    {
      return cposy-csize/2 < walls[i].d + (pRoundDown + pDelta + pRan + bug) + 1 && cposy - csize/2 > walls[i].u && cposx+csize/2 + 1 > walls[i].l && walls[i].r > cposx-csize/2 - 1;
    }
  }
  void Set()
  {
    towards = "up";
    cposy -= pRoundDown+pDelta+pRan;
    pict = 9;
     if(!Bool(z,true) && Bool(z,false))
    {
      if(left.Bool(z,false))
      {
        cposx += pRoundDown+pDelta+pRan;
      }
      else if(right.Bool(z,false))
      {
        cposx -= pRoundDown+pDelta+pRan;
      }
    }
  }
  void Tri()
  {
    triangle(cposx, cposy - 38, cposx + 6, cposy - 32, cposx - 6, cposy - 32);
  }
}
class Down extends Collision
{

   boolean Bool(int i, boolean cut)
  {
    if(cut)
    {
      return cposy+csize/2 > walls[i].u - (pRoundDown + pDelta + pRan + bug) - 1 && cposy + csize/2 < walls[i].d && (cposx+csize/2 + 1 > walls[i].l + corner && walls[i].r - corner > cposx-csize/2 - 1);
    }
    else
    {
      return cposy+csize/2 > walls[i].u - (pRoundDown + pDelta + pRan + bug) - 1 && cposy + csize/2 < walls[i].d && cposx+csize/2 + 1 > walls[i].l && walls[i].r > cposx-csize/2 - 1;
    }
  }
  void Set()
  {
    towards = "down";
    cposy += pRoundDown+pDelta+pRan;
    pict = 0;
    if(!Bool(z,true) && Bool(z,false))
    {
      if(left.Bool(z,false))
      {
        cposx += pRoundDown+pDelta+pRan;
      }
      else if(right.Bool(z,false))
      {
        cposx -= pRoundDown+pDelta+pRan;
      }
    }
  }
  void Tri()
  {
    triangle(cposx, cposy + 38, cposx + 6, cposy + 32, cposx - 6, cposy + 32);
  }
}
