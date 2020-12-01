class player extends origin {

  PImage Right;
  PImage Left;
  PImage RightD;
  PImage LeftD;
  PImage dead;
  PImage fall;

  player(int x, int y, int speedX, int speedY) {
    super( x, y, speedX, speedY);

    //I've loaded in the images int the contrucotr this way to show that can specifically
    //reference the images according to their assigned PImage value

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
    fall = loadImage("fall.png");
    fall.resize(40,40);
  }


  void move()
  {
    if (key == CODED)
    {
      if (keyCode == UP) {
        image(Left, x, y);
        y -= 4;
      }
      if (keyCode == DOWN) {
        image(fall, x, y);
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
      //set the player's x pos to the opposite side
      x = 50;
    } else if (x < 0)
    {
      x = width - 50;
    }
    if (y > height - 50)
    {
      //set the player's y pos to the opposite side
      y = 50;
    } else if (y < 0)
    {
      y = height - 50;
    }
  }

  void Update(){
    crash();
    move();
  }
}
