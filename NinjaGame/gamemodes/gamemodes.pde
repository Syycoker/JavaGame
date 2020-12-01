PImage background;
PImage background2;

boolean gameOn = false;

int x, y;
void setup()
{
  size(500,500);
  background = loadImage("backG.jpg");
  background.resize(width, height);
  background2 = loadImage("background.jpg"); 
  background2.resize(width,height);
}

void draw()
{
  image(background, x, y);
  playListing();
  playButton();
  gameMode();
}

void gameMode()
{

  if(gameOn == true){
  image(background2, 0, y); //draw background below the current image
  image(background2, 0, y+background2.height); 
  
  y -=4; 
  if(y == -background2.height) 
      y=0; //wrap background
  }
  
}


void playButton()
{
  rect(130,255,210,65);
  if(mousePressed)
  {
    gameOn = true;
  }
  
}


void playListing()
{
  int x = 210;
  int y = 290;
  textSize(32);
  text("Play", x, y);
  fill(250, 252, 145);
  
  if(mouseX >= 130 && mouseX <= 340 && mouseY >= 255 && mouseY <= 320)
  {
    fill(50, 191, 67);
  }
}
// if playListing is mousePressed then gameOn is true;
