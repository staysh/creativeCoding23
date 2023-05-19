
float step = 0.01;
float offset = 0.0;

void setup (){
  size(400,400);
}

void draw (){
  background(255);
  //circle(width/2, height/2, 200*noise(frameCount*step));
  for(int i = 0; i < width; i++)
  {
    int h = int(noise(i*step+offset)*height/2);
    set(i, height/2-h, color(0));
  }
  offset += 0.01;
  
  
  step = map(mouseX, 0, width, 0.003, 0.03);
}
