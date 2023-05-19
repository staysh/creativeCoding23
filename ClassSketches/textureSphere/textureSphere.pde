
PShape moon;
PImage surface;
float step = 0.05;
float angle = 0.0;
float z = 0.0;

void setup () {
  size(800,1000,P3D);
  surface = createImage(200, 400, RGB);
  for(int x = 0; x < surface.width; x++){
    for(int y = 0; y < surface.height; y++){
      color c = color(0, noise(x*step, y*step) * 255, 0 );
      surface.set(x, y, c);
    }
  }
  noStroke();
  moon = createShape(SPHERE, 200);
  moon.setTexture(surface);
}

void draw () {
  background(0);
  translate(width/2, height/2);
  lights();
  pushMatrix();
  rotateY(angle);
  shape(moon);
  popMatrix();
  angle += 0.01;
  for(int x = 0; x < surface.width; x++){
    for(int y = 0; y < surface.height; y++){
      color c = color(0, noise(x*step, y*step, z) * 255, 0 );
      surface.set(x, y, c);
    }
  }
  z += 0.05;
}
