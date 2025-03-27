class prize extends origin {

  scoreBoard points;
  
  //coin has 8 objects within the array
  PImage [] coin = new PImage[8];
  
  int counter = 0;
  int countDir = 1;

  prize(int x, int y, int speedX, int speedY)
  {
    super(x, y, speedX, speedY);
    for (int i = 0; i < coin.length; i++)
    {
      //this time i've implemented a for loop to load in the imags from the array
      //i've concantinated to fit the file name to what i've saved them as
      coin[i] = loadImage("img/coin"+i+".gif");
      coin[i].resize(50, 50);
    }
  }

  void movement()
  {
    y = y - 1;
    
    if(y <= -50)
    {
      //if the image's y pos has exceeded the height of the screen
      //set it to the bottom again but with a new x position
      float newPosX = random(20,490);
      y = height + 50;
      x = (int)newPosX;
    } 
  }
  
  void collected()
  {
    //to let me see things slower and assess if the object has been collided with
    //delay(500);
  }

  boolean collision(player main)
  {
    if (abs(this.x - main.x) < 25 && abs(this.y - main.y) < 25)
    {
      return true;
    }
    return false;
  }

  void render()
  {
      if (counter >= 0 && counter <=10)
      {
        image(coin[0], x, y);
      } else if (counter >10 && counter <=20)
      {
        image(coin[1], x, y);
      } else if (counter >20 && counter <=30)
      {
        image(coin[2], x, y);
      } else if (counter >30 && counter <=40)
      {
        image(coin[3], x, y);
      } else if (counter >40 && counter <=50)
      {
        image(coin[4], x, y);
      } else
      {
        countDir = -countDir;
        if (counter < 0)
          image(coin[0], x, y);

        if (counter > 50)
          image(coin[4], x, y);
      }
      counter = counter + countDir;
    }
  
  
  void Update()
  {
    movement();
    render();
  }
  
  void reset()
  {
    y = height + 50;
  }

}
