// Review Logical Operators
// Load Images
// copy() get()
// for loops

PImage axo;
float angle = 0.0;
float angle2 = 0.0;

void setup () {
  size(400,400);
  axo = loadImage("axolotl-illustration.png");
  imageMode(CENTER);
  rectMode(CENTER);
}

void draw () {
  //background(0);
  
  translate(width/2, height/2);
  angle += 0.01;
  angle2 -= 0.01;
  
  pushMatrix();
  rotate(angle);
  image(axo, 0, 0, 400, 400);
  popMatrix();
  
  pushMatrix();
  rotate(angle2);
  fill(get(mouseX, mouseY));
  rect(0, 0, 50, 50);
  popMatrix();
  
  PImage sample = get(mouseX, mouseY, 100, 100);
  image(sample, 0, 200);
  //image(axo, width/2, height/2);
}
