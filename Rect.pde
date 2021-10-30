class Rect
{
  int r;
  int l;
  int u;
  int d;
  boolean bool;
  void ShowBorder(int px, int py, int sx, int sy, int cur, int cul, int cbr, int cbl)
  {

    for (int i = px; i < px + sx; i++)
    {
      for (int j = py; j < py + sy; j++)
      {
        if (i-1 > -1 && i-1 < 26 && j-5 > -1 && j-5 < 34)
        {
          dots[i - 1][j - 5].bool = false;
        }
      }
    }

    rect(px*25+10+5, py*25+10, sx*25-20, sy*25-20, cul, cur, cbr, cbl);
    l = px*25+5;
    u = py*25;
    r = l+sx*25;
    d = u+sy*25;
  }
  void Show(int px, int py, int sx, int sy, int c)
  {

    for (int i = px; i < px + sx; i++)
    {
      for (int j = py; j < py + sy; j++)
      {
        if (i-1 > -1 && i-1 < 26 && j-5 > -1 && j-5 < 34)
        {
          dots[i - 1][j - 5].bool = false;
        }
      }
    }
    rect(px*25+10+5, py*25+10, sx*25-20, sy*25-20, c);
    l = px*25+5;
    u = py*25;
    r = l+sx*25;
    d = u+sy*25;
  }
  boolean Intersects()
  {
    boolean bool = false;
    if (cposx-csize/2 < r && cposx+csize/2 > l && cposy-csize/2 < d && cposy+csize/2 > u)
    {
      bool = true;
    }
    return bool;
  }
}
int dotflash = 0;
class Dot extends Rect
{
  boolean big;
  void Show(int px, int py, int sx, int sy)
  {
    if(dots[px][py].big)
    {
      if(dotflash > 16)
      {
      image(bigdot, (px + 1)*25 + 9, (py + 5)*25 + 4);
      }
      if(dotflash > 32)
      {
        dotflash = 0;
      }
      l = (px + 1)*25 + 17;
      u = (py + 5)*25 + 12;
      r = l+sx;
      d = u+sy;
    }
    else
    {
      rect((px + 1)*25 + 17, (py + 5)*25 + 12, sx, sy);
      l = (px + 1)*25 + 17;
      u = (py + 5)*25 + 12;
      r = l+sx;
      d = u+sy;
    }
  }
}
