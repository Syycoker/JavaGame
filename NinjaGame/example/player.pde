class player extends prize{
  
  PImage Right;
  PImage Left;
  PImage RightD;
  PImage LeftD;
  PImage dead;

  player(int x, int y, int speedX, int speedY) {
    super( x, y, speedX, speedY);

    Right = loadImage("GlideR.png");
    Right.resize(50, 50);
    Left = loadImage("GlideL.png");
    Left.resize(50, 50);
    RightD = loadImage("GlideRD.png");
    RightD.resize(50, 50);
    LeftD = loadImage("GlideLD.png");
    LeftD.resize(50, 50);
    dead = loadImage("Dead.png");
    dead.resize(50, 50);
  }


  void move()
  {
    if (key == CODED)
    {
      if (keyCode == UP && x < width/2) {
        image(Left, x, y);
        y -= 4;
      } else if (keyCode == UP && x > width/2) {
        image(Right, x, y);
        y -= 4;
      }
      if (keyCode == DOWN && x < width/2) {
        image(Left, x, y);
        y += 4;
      } else if (keyCode == DOWN && x > width/2) {
        image(Right, x, y);
        y += 4;
      }
      if (keyCode == LEFT) {
        image(Left, x, y);
        x -= 4;
      }
      if (keyCode == RIGHT) {
        image(Right, x, y);
        x += 4;
      }
    }
  }

  void crash() {
    if (x > width)
    {
      x -= 50;
    } else if (x < 0)
    {
      x += 50;
    }
    if (y > height)
    {
      y -= 50;
    } else if (y < 0)
    {
      y += 50;
    }
  }



  void playerAssets() {
    crash();
    move();
  }
}
