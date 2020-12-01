class prize{
  int x,y;
  int speedX,speedY;
  int score = 0;
  String scoreText = "";
  boolean touching = false;
  PImage [] coin = new PImage[8];
  int counter = 0;
  int countDir = 1;

  prize(int x, int y, int speedX, int speedY)
  {
    this.x = x;
    this.y = y;
    this.speedX = speedX;
    this.speedY = speedY;

    for (int i = 0; i < coin.length; i++)
      {
        coin[i] = loadImage("coin"+i+".gif");
        coin[i].resize(50, 50);
      }
  }

  void movement()
  {
    y = y - 1;
  }
  
  void render()
  {
    if (x < width - 50)
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
          } else
          {
            x=0;
          }
        }
    

  
          
   void collision(player main, prize good)
   {
     if (abs(this.x - main.x) < 50 && abs(this.y - main.y) < 50)
     {
      
     }
   }
     
     

}
