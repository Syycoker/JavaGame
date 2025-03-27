import java.util.Iterator;

PImage background;
PImage background2;
PImage helpBack;
PImage gameOver;

int menuMode = 0; //1 game, 2 for help, 3 for something else
int x, y;
int pointCount = 0;
int livesCount = 5;
int damageCount = 0;

ArrayList<shuriken> baddies = new ArrayList<shuriken>();//declare an arraylist for the shuriken class
ArrayList<prize> goodies = new ArrayList<prize>(); //declare an array list for the prize class
ArrayList<rock> baddies2 = new ArrayList<rock>(); //declare an array list for the prize class


//declaring the classes in the main
player main;
shuriken bad;
prize good;
scoreBoard Board;
healthBar hit;
rock hurt;


void setup() {
  size(500, 500);
  background = loadImage("img/backG.jpg");
  background.resize(width, height);
  background2 = loadImage("img/background.jpg"); 
  background2.resize(width, height);
  helpBack = loadImage("img/helpG.jpg");
  helpBack.resize(width,height);
  gameOver = loadImage("img/gameOver.jpg");
  gameOver.resize(width,height);
  
  main = new player(250, 50, 0, 0);
  Board = new scoreBoard(0, 0);
  hit = new healthBar(380,10);
  
  baddies= new ArrayList <shuriken>();
  goodies = new ArrayList<prize>();
  baddies2 = new ArrayList<rock>();

  //create three instances of shurikens from shuriken class
  baddies.add(new shuriken(250, 400, 1, 1));
  baddies.add(new shuriken(100, 400, 2, 2));
  baddies.add(new shuriken(400,400, 3,3));
  
  baddies2.add(new rock(350,400, 3,3));
  baddies2.add(new rock(230,400, 3,3));
  baddies2.add(new rock(450,400, 3,3));
  
  //create three instances of coins from prize class
  goodies.add(new prize(300,400,5,3));
  goodies.add(new prize(200,400,4,4));
  goodies.add(new prize(50,400,3,5));
}


void draw()
{ 
  if (menuMode == 0)
  {
    image(background, x, y);
    playButton();
    helpButton();
    //creditsButton();
  }

  if (menuMode == 1)
  {
    backgroundScroll();
    showBad();
    showGood();
    main.Update();
    Board.Update();
    collisionBad();
    collisionGood();
    damagePrint();
  }
  
  if(menuMode == 2)
  {
    helpScreen();
    menuButton();
  }
  
  if(menuMode == 3)
  {
    
  }
  
  if(menuMode == 4)
  {
    gameOverBackground();
  }
  
  if(menuMode == 5)
  {
    creditsBackground();
  }
}

  void damagePrint()
  {
  //  print(damageCount);
  //  //show the health
    hit.showHealth();

    //hpos = 360
    //each time collision = true
    //add 1 to the damageCount
    //for each damageCount
    //move the rectangle by 20
    //until damageCount = 5
    //the rectangle would have moved by 100 on the x-axis
    //practically making the green bar, red
    for(int j = 0; j < damageCount; j++)
    {
      int hpos = 360;
      noStroke();
      fill(255,0,0);
      rect((hpos -=j * 20) + j,10,20,10);
    }
  }

void showBad()
{
  //for each instance shuriken, places baddies into this temporary value
  for (shuriken currentObject : baddies)
      {
        //now add these methods from baddies to these "current object values"
        currentObject.render();
        currentObject.movement();
      }
      
  for (shuriken currentObject : baddies2)
      {
        //now add these methods from baddies to these "current object values"
        currentObject.render();
        currentObject.movement();
      }
}

void showGood()
{
  //for each instance prize, places goodies into this temporary value
  for (prize currentObject : goodies)
      {
        //now add these methods from baddies to these "current object values"
        currentObject.render();
        currentObject.movement();
      }
}

void collisionBad()
{
  for(rock currentObject: baddies2)
  {
    if(currentObject.collision(main) == true)
    {
      currentObject.reset();
      
      damageCount = damageCount + 2;//changing the value of the damage
      
      livesCount = livesCount - 2;//changing how many lives are taken when collision is true
      
      if(livesCount <= 0) //if the lives counter is less than 0
      {
        main.x = 250; //reset player's x & y position
        main.y = 50;
        main.speedX = 0;
        main.speedY = 0;
        
        damageCount = 0; //reset health bar
        livesCount = 5; //reset lives counter back to 5 & point counter back to 0
        pointCount = 0;
        
        x = 0; //the x & y position of the background image will also be reset
        y = 0;
        menuMode = 4; //set the menuMode to the start of the game to give player the options
      }    
    }   
  }
  
  
  
  for(shuriken currentObject : baddies)
  {
    if(currentObject.collision(main) == true)
    {
      currentObject.reset();
      currentObject.death();
      
      damageCount = damageCount + 1;
      
      livesCount = livesCount - 1;
      
      if(livesCount <= 0) //if the lives counter is less than 0
      {
        main.x = 250; //reset player's x & y position
        main.y = 50;
        main.speedX = 0;
        main.speedY = 0;
        
        damageCount = 0; //reset health bar
        livesCount = 5; //reset lives counter back to 5 & point counter back to 0
        pointCount = 0;
        
        x = 0; //the x & y position of the background image will also be reset
        y = 0;
        menuMode = 0; //set the menuMode to the start of the game to give player the options
      }
    }
    
  } 
}

void collisionGood()
{
  for(prize currentObject : goodies)
  {
    if(currentObject.collision(main) == true)
    {
      currentObject.reset();
      currentObject.collected();
      pointCount = pointCount + 10;
    }
    
  } 
}


void backgroundScroll()
{
    image(background2, 0, y); //draw background below the current image
    image(background2, 0, y+background2.height); 

    y -=4; 
    if (y == -background2.height)
    {
      y=0; //wrap background
    }
}

void helpScreen()
{
  image(helpBack,x,y);
  fill(250, 252, 145);
  textSize(18);
  text("To move the Character, use the Arrow Keys",0,200);
  text("Avoid the shurikens, they take one away from your health",0,228);
  text("Avoid the rocks, they take two away from your health",0,246);
  text("Collect the spinning coins to earn Ten points",0,264);
  text("Collect as many points for as long as you can !",0,282);
  textSize(30);
  text("Enjoy!",220,350);
}

void playButton()
{
  noStroke();
  fill(250, 252, 145);
  rect(130, 255, 210, 65);
  textSize(32);
  fill(0);
  text("Play", 205, 300);
  if (mouseX >= 130 && mouseX <= 340 && mouseY >= 255 && mouseY <= 320) {
    if (mousePressed == true) {
      menuMode = 1;
    }
  }
}

void helpButton()
{
  noStroke();
  fill(250, 252, 145);
  rect(130, 330, 210, 65);
  textSize(32);
  fill(0);
  text("Help", 205, 370);
  if (mousePressed == true){
    if (mouseX >= 130 && mouseX <= 340 && mouseY >= 330 && mouseY <= 500){
      menuMode = 2;
   }
  }
 }

void menuButton()
{
  noStroke();
  fill(250, 252, 145);
  rect(150, 400, 210, 65);
  textSize(32);
  fill(0);
  text("Menu", 215, 440);
  if (mouseX >= 130 && mouseX <= 340 && mouseY >= 400 && mouseY <= 500) {
    if (mousePressed) {
      menuMode = 0;
    }
  }
}

void creditsButton()
{
  noStroke();
  fill(250, 252, 145);
  rect(150, 400, 210, 65);
  textSize(32);
  fill(0);
  text("Credits", 215, 440);
  if (mouseX >= 130 && mouseX <= 340 && mouseY >= 400 && mouseY <= 500) {
    if (mousePressed) {
      menuMode = 5;
    }
  }
}

void creditsBackground()
{
  text("Thank you to Dr. David Mclean, please give me 90% and above, i've spent weeks doing this :)",x,y);
}

void gameOverBackground()
{
  image(gameOver,x,y);
  delay(100);
  fill(255);
  text("Click to go back to menu",160,400);
  if (mousePressed == true){
      menuMode = 0;
    }
}

//touching in prize and shuriken has conflicting x and y variables, hence why they don't work
//wake up and fix it!
