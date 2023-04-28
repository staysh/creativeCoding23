
PVector[] t = new PVector[3];
int last = 0;

void setup (){
  size(800, 600, P3D);
  println(distance(15.0, 7.0));
  for(int i = 0; i < 3; i++){
    t[i] = new PVector(i, i, i);
    println(t[i]);
  }
}

void draw (){
  //pushMatrix();
  //rotate(millis()/1000.0);
  noStroke();
  polyPoints(width/2, height/2, 100, 200, 10);
  //popMatrix();
  translate(width/2, height/2);
  stroke(0);
  triangle(t[0].x, t[0].y, t[1].x, t[1].y, t[2].x, t[2].y);
  if(millis() - last > 100){
    last = millis();
    for(int i = 0; i < 3; i++){
      fill(random(255));
      t[i] = PVector.random3D();
      t[i].mult(100.0);
      println(t[0].x);
    }
  }
  
  
  
}

void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy, random(15));
  }
  endShape(CLOSE);
}

void polyPoints(float x, float y, float ir, float or, int npoints) {
  float angle = TWO_PI / (npoints * 2);
  float finalR = ir;
  beginShape();
  for (int i = 0; i < npoints*2; i++) {
    if(i % 2 == 0){
      finalR = ir;
    } else {
      finalR = or;
    }
    float a = i * angle;
    float sx = x + cos(a + millis()/5000.0) * finalR;
    float sy = y + sin(a + millis()/3000.0) * finalR;
    vertex(sx, sy, 0);
  }
  endShape(CLOSE);
}

float distance(float x1, float x2){
  return abs(x2 - x1);
}
