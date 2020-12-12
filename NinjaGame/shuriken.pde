class shuriken extends obstacle {
  
  PImage [] star = new PImage[6];
  PImage dead;
  
  int counter = 0;
  int countDir = 1;
  

  shuriken(int x, int y, int speedX, int speedY)
  {
    super(x, y, speedX, speedY);
    for (int i = 0; i < star.length; i++)
    {
      star[i] = loadImage("img/star"+i+".gif");
      star[i].resize(75,75);
    }
    
    dead = loadImage("img/Dead.png");
    dead.resize(75,75);
    
    collision(main);
  }
  
  boolean collision(player main)
  {
    if (abs(this.x - main.x) < 25 && abs(this.y - main.y) < 25)
    {
      return true;
    }
    return false;
  }


  void death()
  {
    //delay(500);
    image(dead,x,y);
  }
  
  void render()
  {
      if (counter >= 0 && counter <=10)
      {
        image(star[0], x, y);
        
      } else if (counter >10 && counter <=20)
      {
        image(star[1], x, y);
        
      } else if (counter >20 && counter <=30)
      {
        image(star[2], x, y);
        
      } else if (counter >30 && counter <=40)
      {
        image(star[3], x, y);
        
      } else if (counter >40 && counter <=50)
      {
        image(star[4], x, y);
        
      }
      else if (counter >40 && counter <=50)
      {
        image(star[5], x, y);
        
      }
      else
      {
        countDir = -countDir;
        if (counter < 0)
          image(star[0], x, y);

        if (counter > 50)
          image(star[5], x, y);
      }
      counter = counter + countDir;
    } 

  void movement()
  {
    y-=speedY;
    float coX = random(-5, 5);
    y = y + (int)coX;
    
    if(y <= -50)
    {
      float newPosX = random(20,490);
      y = height + 50;
      x = (int)newPosX;
    }  
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

//ctrl T to complete indentation
