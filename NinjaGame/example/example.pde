player main;
prize good;


void setup()
{
  size(500,500);
  
}

void draw()
{
  main.playerAssets();
  good.render();
  good.movement();
  
}
