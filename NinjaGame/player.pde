class player extends origin {

  PImage Right;
  PImage Left;
  PImage RightD;
  PImage LeftD;
  PImage dead;
  PImage fall;
  boolean show = true;

  player(int x, int y, int speedX, int speedY) {
    super( x, y, speedX, speedY);

    //I've loaded in the images int the contrucotr this way to show that can specifically
    //reference the images according to their assigned PImage value

    Right = loadImage("img/GlideR.png");
    Right.resize(50, 50);
    Left = loadImage("img/GlideL.png");
    Left.resize(50, 50);
    RightD = loadImage("img/GlideRD.png");
    RightD.resize(50, 50);
    LeftD = loadImage("img/GlideLD.png");
    LeftD.resize(50, 50);
    dead = loadImage("img/Dead.png");
    dead.resize(50, 50);
    fall = loadImage("img/fall.png");
    fall.resize(40,40);
  }
  

  void move()
  {
    if(show == true){
      image(fall,x,y);
    }
    if (key == CODED)
    {
      if (keyCode == UP) {
        image(Left, x, y);
        y -= 4;
        show = false;
      }
      if (keyCode == DOWN) {
        image(fall, x, y);
        y += 4;
        show = false;
      }
      if (keyCode == LEFT) {
        image(Left, x, y);
        x -= 4;
        show = false;
      }
      if (keyCode == RIGHT) {
        image(Right, x, y);
        x += 4;
        show = false;
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
