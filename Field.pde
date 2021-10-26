
void Dotdef()
{
  for (int i = 0; i < 30; i++)
  {
    for (int j = 0; j < 36; j++)
    {
      dots[i][j].bool = true;
      dots[i][j].big = false;
    }
  }
  for (int i = 10; i < 17; i++)
  {
    dots[8][i].bool = false;
  }
  for (int i = 10; i < 16; i++)
  {
    dots[17][i].bool = false;
  }
  for (int i = 9; i < 17; i++)
  {
    for (int j = 8; j < 11; j++)
    {
      dots[i][j].bool = false;
    }
  }
  for (int j = 16; j < 19; j++)
  {

    for (int i = 8; i < 18; i++)
    {
      dots[i][j].bool = false;
    }
  }
  for (int i = 0; i < 30; i++)
  {
    dots[i][13].bool = false;
  }
  dots[12][22].bool = false;
  dots[13][22].bool = false;
  dots[5][13].bool = true;
  dots[20][13].bool = true;
  
  dots[0][2].big = true;
  dots[25][2].big = true;
  dots[0][22].big = true;
  dots[25][22].big = true;
}
void field(color c)
{
  fill(0);
  stroke(c);
  walls[0].Show(0, 4, 28, 1, 20);
  walls[1].Show(0, 4, 1, 10, 20);
  walls[40].Show(0, 20, 1, 15, 20);

  walls[2].Show(27, 4, 1, 10, 20);
  walls[41].Show(27, 20, 1, 15, 20);

  walls[3].Show(0, 34, 28, 1, 20);
  walls[4].ShowBorder(13, 4, 2, 5, 0, 0, 20, 20);
  walls[5].Show(2, 6, 4, 3, 20);
  walls[6].Show(7, 6, 5, 3, 20);
  walls[7].Show(16, 6, 5, 3, 20);
  walls[8].Show(22, 6, 4, 3, 20);
  walls[9].Show(2, 10, 4, 2, 20);
  walls[10].Show(22, 10, 4, 2, 20);
  walls[11].Show(10, 10, 8, 2, 20);
  walls[12].ShowBorder(0, 13, 6, 5, 20, 0, 20, 0);
  walls[13].Show(7, 10, 2, 8, 20);
  walls[14].Show(7, 13, 5, 2, 20);
  walls[15].Show(13, 10, 2, 5, 20);
  walls[16].Show(19, 10, 2, 8, 20);
  walls[17].Show(16, 13, 5, 2, 20);
  walls[18].ShowBorder(22, 13, 6, 5, 0, 20, 0, 20);
  walls[19].ShowBorder(0, 19, 6, 5, 20, 0, 20, 0);
  walls[20].ShowBorder(22, 19, 6, 5, 0, 20, 0, 20);
  walls[21].Show(7, 19, 2, 5, 20);
  walls[22].Show(19, 19, 2, 5, 20);
  walls[23].Show(10, 22, 8, 2, 20);
  walls[24].Show(13, 22, 2, 5, 20);
  walls[25].Show(2, 25, 4, 2, 20);
  walls[26].Show(4, 25, 2, 5, 20);
  walls[27].Show(7, 25, 5, 2, 20);
  walls[28].Show(16, 25, 5, 2, 20);
  walls[29].Show(22, 25, 4, 2, 20);
  walls[30].Show(22, 25, 2, 5, 20);
  walls[31].ShowBorder(0, 28, 3, 2, 20, 0, 20, 0);
  walls[32].ShowBorder(25, 28, 3, 2, 0, 20, 0, 20);
  walls[33].Show(2, 31, 10, 2, 20);
  walls[34].Show(16, 31, 10, 2, 20);
  walls[35].Show(10, 28, 8, 2, 20);
  walls[36].Show(7, 28, 2, 5, 20);
  walls[37].Show(19, 28, 2, 5, 20);
  walls[38].Show(13, 28, 2, 5, 20);
  walls[39].Show(10, 16, 8, 5, 0);
 
  noStroke();

  for (int i = 0; i < walls.length; i++)
  {
    rect(walls[i].l+11, walls[i].u+11, walls[i].r-walls[i].l-21, walls[i].d-walls[i].u-21, 20);
  }
     stroke(0,0,255);
      rect(10*25 + 22, 16*25 + 17, 7*25 - 9, 4*25 - 9);
      noStroke();
  rect(13*25 + 10, 16*25 + 10, 40, 8);
  stroke(0,0,255);
  line(13*25 + 10, 16*25 + 10, 13*25 + 10, 16*25 + 16);
  line(13*25 + 50, 16*25 + 10, 13*25 + 50, 16*25 + 16);
  noStroke();
  fill(255,193,203);
   rect(13*25 + 12, 16*25 + 12, 38, 4);
  fill(0,0,0);
}
