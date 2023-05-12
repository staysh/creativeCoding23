import processing.video.*;

Capture cam;

PImage prev;

int maxBright = 0;

float[] signal = new float[50];

void setup () {
  size(640, 480);
  String[] cameras = Capture.list();
  cam = new Capture(this, cameras[1]);
  cam.start();
  prev = new PImage();
  
}

void draw() {
  //read in "now" image
  if (cam.available() == true) {
    cam.read();
  }
  //check what's "different"
  prev.blend(
    cam,
    0,
    0,
    width,
    height,
    0,
    0,
    width,
    height,
    SUBTRACT
  );
  //take and account of the difference
  int sum = 0;
  prev.loadPixels();
  
  for(int i  = 0; i < prev.pixels.length; i++){
    sum += brightness(prev.pixels[i]);
  }
  prev.updatePixels();
  
  //get max of sum over time
  if(sum > maxBright){
    maxBright = sum;
  } 
  
  //scale the brightness sum to a usable range
  float control = map(sum, 0, 7000000, 0, 1.0);
  
  //iterate over our "buffer" and shift values down
  for(int i = signal.length - 1; i > 0; i--){
    signal[i] = signal[i - 1];
  }
  //take in the new value
  signal[0] = control;
  
  //place cam or prev to view camera or the "sensor"
  image(cam, 0, 0);
  
  fill(255);
  textSize(40);
  text(control, 50, 50); //visual feedback for testing
  
  //visualize our buffer on the screen and get a total for taking average
  float sigsum = 0.0;
  for(int i = 0; i < signal.length; i++){
    circle(i*width/60, height/2 - height/2*signal[i], width/60);
    sigsum += signal[i];
  }
  //control is now the average of the entire buffer
  control = sigsum/signal.length;
  
  //raise the ball with movement
  circle(width/2, (height - 50) - height*control, 100);

  //make prev the current image for the next time through
  prev = cam.get();
}
