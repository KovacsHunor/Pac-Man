class Collision
{
  public void Collide()
  {
    int z = 0;
    for (int i = 0; i < walls.length; i++)
    {
      if (Bool(i))
      {
        z = i;
        wall = true;
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
      if (Bool(i))
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

  boolean Bool(int i)
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

  boolean Bool(int i)
  {
    return  cposx-csize/2 < walls[i].r + speed + 1 && cposx - csize/2 > walls[i].l && cposy+csize/2 + 1 > walls[i].u && walls[i].d > cposy-csize/2 - 1;
  }
  void Set()
  {
    towards = "left";
    cposx -= speed;
    radx = 0.5 - PI;
    rady = 5.78 - PI;
  }
  void Tri()
  {
    triangle(cposx - 38, cposy, cposx - 32, cposy + 6, cposx - 32, cposy - 6);
  }
}
class Right extends Collision
{

  boolean Bool(int i)
  {
    return cposx+csize/2 > walls[i].l - speed - 1 && cposx + csize/2 < walls[i].r && cposy+csize/2 + 1 > walls[i].u && walls[i].d > cposy-csize/2 - 1;
  }
  void Set()
  {
    towards = "right";
    cposx += speed;
    radx = 0.5;
    rady = 5.78;
  }
  void Tri()
  {
    triangle(cposx + 38, cposy, cposx + 32, cposy + 6, cposx + 32, cposy - 6);
  }
}
class Up extends Collision
{

  boolean Bool(int i)
  {
    return cposy-csize/2 < walls[i].d + speed + 1 && cposy - csize/2 > walls[i].u && cposx+csize/2 + 1 > walls[i].l && walls[i].r > cposx-csize/2 - 1;
  }
  void Set()
  {
    towards = "up";
    cposy -= speed;
    radx = 0.5 - PI/2;
    rady = 5.78 - PI/2;
  }
  void Tri()
  {
    triangle(cposx, cposy - 38, cposx + 6, cposy - 32, cposx - 6, cposy - 32);
  }
}
class Down extends Collision
{

  boolean Bool(int i)
  {
    return cposy+csize/2 > walls[i].u - speed - 1 && cposy + csize/2 < walls[i].d && cposx+csize/2 + 1 > walls[i].l && walls[i].r > cposx-csize/2 - 1;
  }
  void Set()
  {
    towards = "down";
    cposy += speed;
    radx = 0.5 + PI/2;
    rady = 5.78 + PI/2;
  }
  void Tri()
  {
    triangle(cposx, cposy + 38, cposx + 6, cposy + 32, cposx - 6, cposy + 32);
  }
}
