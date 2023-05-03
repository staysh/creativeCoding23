
HLine[] lines = new HLine[300];

void setup (){
  size(400,400);
  frameRate(60);
  for(int i = 0; i < 300; i++){
    float y = random(height);
    float speed = i / 300.0;
    lines[i] = new HLine(y, speed);
  }
  
}

void draw() {
  background(200);
  for(HLine x : lines){
    x.update();
  }
}

class HLine {
  float ypos, speed;
  color shade;
  HLine (float y, float s) {
    ypos = y;
    speed = s;
    shade = color(random(255));
  }
  void update() {
    ypos += speed;
    if( ypos > height) {
      reset();
    }
    fill(shade);
    circle(speed*width, ypos, 25);
  }
  void reset () {
    ypos = 0;
  }
}
