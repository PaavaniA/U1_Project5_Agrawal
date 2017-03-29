PVector location;
PVector velocity;
int blackCircleX;
int blackCircleY;
int amount = 90;
int distance = 70;
Ball[] Dot = new Ball[amount];

void setup()
{
  blackCircleX = width/2;
  blackCircleY = height/2;
  size(800,800,P2D);
  background(255);

  for (int i = 0; i < amount; i++)
  {
    Dot[i] = new Ball(new PVector(width/2+random(-50, -50), (height/2+random(-50, -40))), new PVector(random(-2, 3), random(-1, 3)));
  }
}

void draw()
{
  fill(0);
  ellipse(blackCircleX, blackCircleY, 500, 500);

  for (int i = 0; i < amount; i++)
  {
    Dot[i].Draw();
    Dot[i].Add();
    Dot[i].BounceBack();
  }
  Collision();
}

void Collision()
{
  for (int i = 0; i < amount; i++)
  {
    for (int j = i+1; j < amount; j++)
    {
      if (i!=j)
      {
        float dist = dist(Dot[i]._location.x, Dot[i]._location.y, Dot[j]._location.x, Dot[j]._location.y);
        if (dist < distance)
        {
          stroke(255, 50);
          line(Dot[i]._location.x, Dot[i]._location.y, Dot[j]._location.x, Dot[j]._location.y);

          for (int k = j+1; k < amount; k++)
          {
            {
              if (j!=k)
                dist(Dot[j]._location.x, Dot[j]._location.y, Dot[k]._location.x, Dot[k]._location.y);
              if (dist(Dot[j]._location.x, Dot[j]._location.y, Dot[k]._location.x, Dot[k]._location.y) < distance)
              {
                stroke(255, 50);
                line(Dot[j]._location.x, Dot[j]._location.y, Dot[k]._location.x, Dot[k]._location.y);
              }
            }
          }
        }
      }
    }
  }
}