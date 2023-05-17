
int rows = 10;
int cols = 10;
int cellwidth;
int cellheight;


void setup (){
  size(400, 400);
  cellwidth = width / cols;
  cellheight = height / rows;
  noStroke();
}

void draw () {
  //loadPixels();
  
  for(int x = 0; x < cols; x++){
    for(int y = 0; y < rows; y++){  
       fill(color(map(x, 0, cols, 0, 255),
                  map(y, 0, rows, 0, 255),
                  127));
       rect(x*cellwidth, y*cellheight, cellwidth, cellheight);

    }
  }
  //println("hi");
  //updatePixels();
}
