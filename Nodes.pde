public class Nodes
{
  boolean exists = false;
  boolean upAccess = false;
  boolean downAccess = false;
  boolean leftAccess = false;
  boolean rightAccess = false;
}

boolean mapLayout[][] = new boolean[30][36];
void determineLayout(Rect[] walls) // elkésziti a mapLayout tömbben a pálya alaprajzát ahol a true-k falak a false-ok utak
{
  for (int i = 0; i < 42; i++)
  {
    if (walls[i].l != 0)
    {
      int l = (walls[i].l-5) / 25;
      int u = walls[i].u/25;
      int r = walls[i].r / 25;
      int d = walls[i].d / 25;

      for (int j = l; j < r; j++)
      {
        for (int f = u; f < d; f++)
        {
          mapLayout[j][f] = true;
        }
      }
    }
  }
}

Nodes[][] nodes = new Nodes[31][36];
void crossingFinder(boolean[][] mapLayout) // megtalálja hogy hol vannak kereszteződések a pályán a mapLayout segitségével és megadja hogy merre lehet menni ezekből a kereszteződésekből
{
  for (int i = 1; i < 28; i++)
  {
    for (int f = 5; f < 35; f++)
    {
      if (mapLayout[i][f] == false)
      {
        boolean updown = false;
        boolean leftright = false;
        if (mapLayout[i][f-1] != true)
        {
          nodes[i][f].upAccess = true;
          updown = true;
        }

        if (mapLayout[i][f+1] != true)
        {
          nodes[i][f].downAccess = true;
          updown = true;
        }

        if (mapLayout[i-1][f] != true)
        {
          nodes[i][f].leftAccess = true;
          leftright = true;
        }

        if (mapLayout[i+1][f] != true)
        {
          nodes[i][f].rightAccess = true;
          leftright = true;
        }
        if (updown && leftright)
        {
          nodes[i][f].exists = true;
        }
      }
    }
  }
}
