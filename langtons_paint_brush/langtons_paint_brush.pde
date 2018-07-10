//By Leighton Covington
//Created in early 2018
//This program utilizes langtons ant and a randomized grid to create random sketches on the screen
//It works by taking every pixel langtons ant travels to and giving it a randomized color
//There is a saved color variable, and every time the ant moves, the color is randomly changed by a small amount

//This was created in a coding challenge fashion, and is by no means optimal or properly commented/ structured
//I was really shooting for functionality and creating cool images

int[][] grid; // the two dimensional grid holding the 0's and 1's the ant will be reading to make decisions and move

final int sizeX = 1200;//x width of the app screen
final int sizeY = 800;//y height of the app screen

int size;//meant to be the size of each grid space drawn to screen, currently this is not completely implemented, leave as one
  //one could incorporate zooming and moving a camera around and this variable could help leverage that behavior, or draw at a scale larger or smaller than a 1 square to 1 pixel ratio

int x; //x position of the ant
int y; //y position of the ant

int red, green, blue; //variables to hold the rgb values of the random color that will be drawn to the screen
int colorDifferential; //variable to hold the delta value that we will change the color by

int direction;//variable representing where the ant is facing
//If memory serves me correctly 0 is north, 1 is east, 2 is south, and 3 is west, any other values for direction are invalid

int iterationsToRun; //How many iterations/step updates for the ant that will be done until we apply our next draw


public void setup(){
  
  stroke(1);
  
  size = 1;//meant to be the size of each grid space drawn to screen, currently this is not completely implemented, leave as one
  //one could incorporate zooming and moving a camera around and this variable could help leverage that behavior, or draw at a scale larger or smaller than a 1 square to 1 pixel ratio
  
  direction = 0;

  size(1200,800);//this function demands that literals be passed in rather than variables

  background(255); //set the background as white

  x = floor(width/2)/size; //start the ant in the center
  y = floor(height/2)/size; //start the ant in the center
  
  grid = new int[sizeX][sizeY];//initialize the grid
  
  iterationsToRun = 1; //start off by drawing every single update step
  
  red = 0; //start off the color being drawn as black
  green = 0;
  blue = 0;
  
  colorDifferential = 1;
  
  
  //randomly initialize the grid with 0's and 1's this is so we get different drawings each time we run the app
  for(int i = 0; i < grid.length; i++){
    for(int j = 0; j < grid[i].length; j++){
      float randomFloat = random(1);
      int randomNumber = (randomFloat > 0.5) ? 0 : 1; 
      grid[i][j] = randomNumber;
      if(grid[i][j] == 1){
        drawCell(i,j,255,255,255);//draw the cell white
      }
      else{
        drawCell(i,j,0,0,0); //draw the cell black
      }
      
    }
  }
      
  
}

public void drawCell(int xpos, int ypos, int r, int g, int b){
  //TODO: put checks in for parameters to make sure they are valid
  
  stroke(r,g,b);
  fill(r,g,b);
  rect(xpos, ypos, size, size);
}

public void update(){
  
  //update logic for the ant for flipping the bit and adjusting direction
  if(grid[x][y] == 1){
    grid[x][y] = 0;
    drawCell(x,y,red,green,blue);
    direction = direction + 1;
    direction = direction % 4;
  }
  else if(grid[x][y] == 0){
    grid[x][y] = 1;
    drawCell(x,y,red,green,blue);
    direction = direction - 1;
    if(direction < 0){
      direction = 3; 
    }
  }
  
  //Logic that checks direction of the ant and then properly updates its position
  if(direction == 0){
    y = y - 1;
  }
  else if (direction == 1){
    x = x + 1;
  }
  else if (direction == 2){
    y = y + 1;
  }
  else if (direction == 3){
    x = x - 1;
  }
  //-----------------------------------------------------------------------------

  //this block ensures the ant wraps the screen
  if(x > width - 1){
     x = 0;
     
  }
  else if(x < 0){
   x = width - 1;
   
  }
  
  if(y > height - 1){
    y = 0;
  }
  else if (y < 0){
    y = height - 1;
  }
  //-------------------------------------------
  
  drawCell(x,y,255,0,0);//Draw the ant
  
  //Update the random color values slightly
  float randomFloat = random(1);
  boolean randomBool = random(1) < 0.5 ? false : true; 
  
  if(randomBool){
    colorDifferential *= -1; 
  }
  
  if(randomFloat < 0.33){
   red += colorDifferential;
   red = red % 255;
  }
  else if(randomFloat > 0.33 && randomFloat < 0.66){
    green += colorDifferential;
    green = green % 255;
  }
  else {
    blue += colorDifferential;
    blue = blue % 255;
  }
  
  
}


public void draw(){
   for(int i = 0; i < iterationsToRun; i++){
     update();
   }
   if(keyPressed == true){//logic for key inputs, set up so only one can be pressed at a time
     if(key == 'a'){
       iterationsToRun += 10;
     }
     else if(key == 'b'){
       iterationsToRun-=10;
       if(iterationsToRun <= 1){
         iterationsToRun = 1;
       }
     
     }
    else if(key == 'z'){
      iterationsToRun += 10000; 
    }
    else if(key == 'x'){
      iterationsToRun = 1; 
    }
    else if(key == 'p'){
      saveFrame();
      delay(1000);
    }
    else if(key == 'r'){
      setup(); 
    }
    
     println(iterationsToRun);//send how many updates are being run per draw for debugging purposes
   }
   
}
