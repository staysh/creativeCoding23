float angle = 0.0;
float speed = 0.01;

void setup(){
  size(400,400,P3D);
  noFill();
}

void draw(){
  //speed = mouseX/(float)width;
  println(width);
  translate(width/2, height/2);
  background(0);
  stroke(color(100, 200, 50));
  pushMatrix();
  rotateX( -angle );
  box(200, 200, 200);
  popMatrix();
  angle += speed;
  
  stroke(200,75,80);
  float incr = TWO_PI / 6.0;
  for(int i = 0; i < 6; i++){
    float hexAngle = i * incr;
    float r = 50.0;
    float x = cos(hexAngle + angle) * r;
    float y = sin(hexAngle + angle) * r;
    float z = 0.0;
    pushMatrix();
    translate(x, y, z);
    sphere(10);
    popMatrix();
    //draw shape;
  }
}
