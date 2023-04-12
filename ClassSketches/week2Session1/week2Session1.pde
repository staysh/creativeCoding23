// quick review single line comment

/*
  Multi line comments
  To do:
  variables
  conditionals
  map
  scope
  mouse/keyboard input
*/
int bg = 0;

float circleX;
float circleY;
color circleBg;

//for the bouncy thing
float bounceX = 0.0;
float bounceY;
float speed = 10.0;

boolean ballState = true;

void setup () {
  size(800,800);
  frameRate(10);
  bounceY = height/2;
}

void draw () {
  background(circleBg);
  bg++;
  if(bg > 255)
  {
    boolean test = bg > 255;
    println(int(test));
    bg = 0;
  }
  float xMapped = map(mouseX, 0, width, 0, 255);
  float yMapped = map(mouseY, 0, height, 0, 255);
  circleBg = color(xMapped, yMapped, (xMapped+yMapped)/2);
  circleX = random(width);
  circleY = random(height);
  fill(circleBg);
  ellipse(circleX, circleY, 50, 50);
  
  fill(255);
  if(ballState)
    bounceX += speed;
  else
    bounceX -= speed;
    
  if(bounceX > width || bounceX < 0.0)
    ballState = !ballState;
  
  ellipse(bounceX, bounceY, 100, 100);
}
