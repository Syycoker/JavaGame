class rock extends shuriken{
  
  PImage [] rock = new PImage [20];
  int counter = 0;
  int countDir= 1;
  rock(int x, int y,int speedX, int speedY)
  {
    super(x, y, speedX, speedY);
    
    for(int i = 0; i < rock.length ; i++ )
    {
      rock[i] = loadImage("img/rock"+i+".gif");
      rock[i].resize(50,50);
    }
    
    
  }
  
  boolean collision(player main)
  {
    if (abs(this.x - main.x) < 25 && abs(this.y - main.y) < 25)
    {
      return true;
    }
    return false;
  }
  
  void movement()
  {
    y -= speedY;
    
    if(y <= -50)
    {
      float newPosX = random(20,490);
      y = height + 50;
      x = (int)newPosX;
    }
  }
  
  void render()
  {
      if (counter >= 0 && counter <=10)
      {
        image(rock[0], x, y);
      } else if (counter >10 && counter <=20)
      {
        image(rock[1], x, y);
      } else if (counter >20 && counter <=30)
      {
        image(rock[2], x, y);
      } else if (counter >30 && counter <=40)
      {
        image(rock[3], x, y);
      } else if (counter >40 && counter <=50)
      {
        image(rock[4], x, y);
      }
      else if (counter >50 && counter <=60)
      {
        image(rock[5], x, y);
      }
       else if (counter >60 && counter <=70)
      {
        image(rock[6], x, y);
      } else if (counter >70 && counter <=80)
      {
        image(rock[7], x, y);
      } else if (counter >80 && counter <=90)
      {
        image(rock[8], x, y);
      } else if (counter >90 && counter <=100)
      {
        image(rock[9], x, y);
      }
      else if (counter >100 && counter <=110)
      {
        image(rock[10], x, y);
      }
      else if (counter >110 && counter <=120)
      {
        image(rock[11], x, y);
      } else if (counter >120 && counter <=130)
      {
        image(rock[12], x, y);
      } else if (counter >130 && counter <=140)
      {
        image(rock[13], x, y);
      } else if (counter >140 && counter <=150)
      {
        image(rock[14], x, y);
      }
      else if (counter >150 && counter <=160)
      {
        image(rock[15], x, y);
      }
       else if (counter >160 && counter <=170)
      {
        image(rock[16], x, y);
      } else if (counter >170 && counter <=180)
      {
        image(rock[17], x, y);
      } else if (counter >180 && counter <=190)
      {
        image(rock[18], x, y);
      } else if (counter >190 && counter <=200)
      {
        image(rock[19], x, y);
      }
      else
      {
        countDir = -countDir;
        if (counter < 0)
          image(rock[0], x, y);

        if (counter > 50)
          image(rock[19], x, y);
      }
      counter = counter + countDir;
    }
    
    void Update()
    {
      render();
      movement();
      reset();
    }
    
    void reset()
    {
      y = height -50; 
    }
  
}
