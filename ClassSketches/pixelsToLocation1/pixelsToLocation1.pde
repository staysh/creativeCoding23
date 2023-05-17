
void setup (){
  size(100, 100);
}

void draw () {
  loadPixels();
  
  for(int i = 0; i < pixels.length; i++){
    int x  = (i % width);
    int y = (i / width);
    if(x >= width/2 ){
      //code executed on right hand side
      pixels[i] = color(127);
      if(y >= height/2){
        //code runs when (x > middle && height < middle)
        pixels[i] = color(66);
      }
    } else {
      //code goes runs when i is on left
      pixels[i] = color(random(255));
    }
  }
  
  updatePixels();
}
