
int rows = 10;
int cols = 10;



void setup (){
  size(400, 400);
}

void draw () {
  loadPixels();
  
  for(int x = 0; x < width; x++){
    for(int y = 0; y < height; y++){  
      pixels[x+y*width] = color(map(x, 0, width, 0, 255),
                                map(y, 0, height, 0, 255),
                                127);
      
      //SET DOESNT NEED LOAD AND UPDATE PIXELS CALLS
      //set(x, y, color(map(x, 0, width, 0, 255),
      //                map(y, 0, height, 0, 255),
      //                127));
    }
  }
  //println("hi");
  updatePixels();
}
