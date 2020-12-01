class healthBar{

  int xpos =380;
  int ypos;

  healthBar(int xpos, int ypos)
  {
    this.xpos = xpos;
    this.ypos = ypos;
  }

  void showHealth()
  {
    text("Health:",220,20);
    noStroke();
    fill(0, 255, 0);
    rect(280, 10, 100, 10);
  }

  void Update()
  {
    showHealth();
  }
}
