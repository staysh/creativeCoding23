import processing.video.*;

Capture cam;

PImage[] p = new PImage[2];

void setup(){
  size(640,480);
  String[] cameras = Capture.list();
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    
    cam = new Capture(this, cameras[1]);
    cam.start();
  }
  p[0] = new PImage();
  p[1] = new PImage();
}

void draw(){
  if (cam.available() == true) {
    cam.read();
  }
  //image(cam, 0, 0);
  p[0].blend(cam,
    0,
    0,
    cam.width,
    cam.height,
    0,
    0,
    cam.width,
    cam.height,
    SUBTRACT);
  
  p[1] = p[0].get();
    
  image(p[0], 0, 0);
  
  image(p[1], 400, 100, 50, 50);
  
  p[0] = cam.get();
}
