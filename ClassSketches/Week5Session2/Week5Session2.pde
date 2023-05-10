import processing.video.*;

Capture cam;
int len = 30;
PImage[] cache = new PImage[len];
PImage alphaMask;

void setup () {
  size(640,480);
  alphaMask = createImage(1, 1, ARGB);
  alphaMask.set(0, 0, color(255, 255, 40, 40));
  alphaMask.resize(width, height);
  for(int i = 0; i < len; i++){
    cache[i] = createImage(width, height, ARGB);
  }
  String[] names = Capture.list();
  cam = new Capture(this, names[1]);
  cam.start();
}

void draw () {
  //background(0);
  if(cam.available() == true){
    cam.read();
  }
  for(int i = cache.length - 1; i > 0; i--){
    cache[i] = cache[i - 1].get();
  }
  cache[0] = cam.get();
  cache[0].mask(alphaMask);
  //alphaMask.blend(cache[0],
  //               0,            //source x
  //               0,            //source y
  //               width,        //width
  //               height,       //height
  //               0,            //dest x
  //               0,            //dest y
  //               width,        //dest w
  //               height,       //dest h
  //               MULTIPLY);    //mode
  //image(cache[0], 0, 0);
  //image(cache[9], width/2, 0);
  
  for(PImage img : cache){
    image(img, 0, 0);
  }
  
}
