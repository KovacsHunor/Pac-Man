public class Rect
{
 int r;
 int l;
 int u;
 int d;
 boolean bool;
 void Show(int px, int py, int sx, int sy, int c)
 {
   
   for(int i = px; i < px + sx; i++)
   {
     for(int j = py; j < py + sy; j++)
     {
       if(i-1 > -1 && i-1 < 26 && j-5 > -1 && j-5 < 34)
       {
        dots[i - 1][j - 5].bool = false;
       }  
     }
   }
   rect(px*25, py*25, sx*25, sy*25, c);
   l = px*25;
   u = py*25;
   r = l+sx*25;
   d = u+sy*25;   
 }
}

class Dot extends Rect
{
  void Show(int px, int py, int sx, int sy)
  {
   rect((px + 1)*25 + 12, (py + 5)*25 + 12, sx, sy);
   l = (px + 1)*25 + 12;
   u = (py + 5)*25 + 12;
   r = l+sx;
   d = u+sy;   
  }
}
