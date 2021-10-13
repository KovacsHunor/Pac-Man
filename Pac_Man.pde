void setup()
{
  background(0);
  size(1000, 600);
  textSize(30);
}
int csize = 50;
int cposx = 200;
int cposy = 200;
float radx = 0.5;
float rady = 5.78;

int count = 0;
boolean mouth = false;
void draw()
{
  background(0);
  fill(255, 255, 0);
  arc(cposx, cposy, csize, csize, radx - 0.01*count, rady + 0.01*count%10);
  if(count == 50)
  {
    mouth = true;
  }
  else if(count == 0)
  {
    mouth = false;
  }
  if(!mouth)
  {
    count += 2;
  }
  else
  {
    count -= 2;
  }
}
void keyPressed()
{
  if(keyCode == UP)
  {
    cposy -= 5;
    radx = 0.5 - PI/2;
    rady = 5.78 - PI/2;
  }
  else if(keyCode == DOWN)
  {
    cposy += 5;
    radx = 0.5 + PI/2;
    rady = 5.78 + PI/2;
  }
  else if(keyCode == RIGHT)
  {
    cposx += 5;
    radx = 0.5;
    rady = 5.78;
  }
  else if(keyCode == LEFT)
  {
    cposx -= 5;
    radx = 0.5 - PI;
    rady = 5.78 - PI;
  }
}
