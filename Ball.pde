class Ball
{
  public PVector _location;
  public PVector _velocity;

  Ball(PVector location, PVector velocity)
  {
    _location = location;
    _velocity = velocity;
  }

  public void Draw()
  {
    stroke(0, 0, 0, 0);
    //fill(random(255), random(255), random(255));
    fill(255);
    ellipse(_location.x, _location.y, 1, 1);
  }

  public void Add()
  {
    _location.add(_velocity);
  }

 public  void BounceBack()
   {
      if (dist(_location.x, _location.y, blackCircleX, blackCircleY)>240)
      {
        _velocity.mult(-1);
      }
    }
  }