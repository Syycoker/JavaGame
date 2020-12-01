class scoreBoard{
  
  int x, y;
  
  scoreBoard(int x, int y)
  {
    this.x = x;
    this.y = y;
  }
  
  void render()
  {
    fill(0);
    rect(x,y,width,30);
    fill(255);
    textSize(15);
    text("Points: " + pointCount,20,20);
    
    text("Lives: " + livesCount,125,20);
  }
  
  
  void Update()
  {
    render();
  }
  
  
}
