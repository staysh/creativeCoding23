/**
 * Loop. 
 * 
 * Shows how to load and play a QuickTime movie file.  
 *
 */

import processing.video.*;

Movie movie;
int len = 20;
PImage[] cache = new PImage[len];
PImage alphaMask;

void setup() {
  size(560, 406);
  background(0);
  alphaMask = createImage(1, 1, ARGB);
  alphaMask.set(0, 0, color(255, 255, 80, 40));
  alphaMask.resize(width, height);
  for(int i = 0; i < len; i++){
    cache[i] = createImage(width, height, ARGB);
  }
  // Load and play the video in a loop
  movie = new Movie(this, "launch2.mp4");
  movie.loop();
}

void movieEvent(Movie m) {
  m.read();
}

void draw() {
  //if (movie.available() == true) {
  //  movie.read(); 
  //}
  movie.jump(random(movie.duration()));
  for(int i = cache.length - 1; i > 0; i--){
    cache[i] = cache[i - 1].get();
  }
  cache[0] = movie.get();
  cache[0].mask(alphaMask);

  for(PImage img : cache){
    image(img, 0, 0);
  }
}
