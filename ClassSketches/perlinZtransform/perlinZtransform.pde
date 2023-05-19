
float step = 0.005;
float z = 0.0;
int incr = 0;

void setup (){
  size(400,400);
}

void draw (){
  loadPixels();
  for(int x = 0; x < width; x++){
    for(int y = 0; y < height; y++){
      color c = color(noise((x)*step, (y)*step, z)*255);
      //println(c);
      pixels[x+y*width] = c;
    }
  }
  updatePixels();
  z += 0.003;
  //step = map(mouseX, 0, width, 0.001, 0.01);
  incr++;
}
