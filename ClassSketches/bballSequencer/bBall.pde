class BBall {
  //member variables
  PVector pos;
  PVector vel;
  float r;
  
  //constructor
  BBall (int x, int y) {
    pos = new PVector(x,y);
    vel = PVector.random2D();
    r = random(10, 20);
  }
  
  //member functions (or otherwise called methods)
  void update () {
    pos.x += vel.x;
    pos.y += vel.y;
    if(pos.x > width || pos.x < 0){
      vel.x *= -1.0;
      sonify();
    }
    if(pos.y > height || pos.y < 0){
      vel.y *= -1.0;
      sonify();
    }
  }
  
  void draw () {
    circle(pos.x, pos.y, r);
  }
  
  void sonify () {
    //make a sound
    
  }

}
