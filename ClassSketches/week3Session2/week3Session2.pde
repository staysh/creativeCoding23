//review of loops and arrays
//different ways of initializing arrays
//PVector
//P3D
//exporting mov files (or images?)
//colors...
//keyPressed specific key

//0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F
// 0xFF = a byte
//color[] myColors = new color[10];

int colorIndex = 0;
int lastChange = 0;
color myColors[] = { 0xFF0059AA,
                     0xFF32990a,
                     0xFFac14d4,
                     0xFF77F0b3};
                     
PVector speeds[] = { PVector.random2D(),
                     PVector.random2D(),
                     PVector.random2D(),
                     PVector.random2D()};                    


PVector[] points = new PVector[80];
color[] colors = new color[80];

void setup () {
  size(400, 400);
  for(int i = 0; i < points.length; i++){
    points[i] = new PVector(random(width), random(height));
    colors[i] = color(random(255));
  }
  colorMode(HSB, 255);
}

void draw () {
  background(myColors[colorIndex]);
  if( millis() - lastChange > 2000){
    colorIndex++;
    colorIndex %= 4;
    lastChange = millis();
  }
  for(PVector point : points){
    fill(point.x % 255, point.x, point.y);
    ellipse(point.x, point.y, 50, 50);
    point.add(PVector.random2D().mult(4.0));
  }
  
  for(int i = 0; i < points.length; i++){
   
  }
  
}
