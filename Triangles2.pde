PVector location;
PVector velocity;
int blackCircleX;
int blackCircleY;
int amount = 70;
int distance = 60;
Ball[] Red = new Ball[amount];

void setup()
{
  blackCircleX = width/2;
  blackCircleY = height/2;
  fullScreen();
  background(255);

  for (int i = 0; i < amount; i++)
  {
    Red[i] = new Ball(new PVector(width/2+random(-50, 50), (height/2+random(-50, 50))), new PVector(random(0, 3), random(0, 3)));
  }
}

void draw()
{
  fill(0);
  ellipse(blackCircleX, blackCircleY, 500, 500);

  for (int i = 0; i < amount; i++)
  {
    Red[i].Draw();
    Red[i].Add();
    Red[i].BounceBack();
  }

  Collision();
}

void Collision()
{
    for (int i = 0; i < amount; i++)
    {
      for (int j = 0; j < amount; j++)
      {
        if (i!=j)
        {
          float dist = dist(Red[i]._location.x, Red[i]._location.y, Red[j]._location.x, Red[j]._location.y);
          if(dist < distance)
          {
            stroke(255);
            line(Red[i]._location.x, Red[i]._location.y, Red[j]._location.x, Red[j]._location.y);
          }
        }
      }
    }
  }