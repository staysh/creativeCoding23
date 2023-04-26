
boolean mySwitch = false;
int weird = 1;
void setup(){
  size(400,400);
}

void draw(){
  background(127);
  loadPixels();
  for(int i = 0; i < pixels.length; i++){
    if(i % weird == 0){
      mySwitch = !mySwitch;
    }
    if(mySwitch){
      pixels[i] = color(0);
    } 
  }
  weird++;
  updatePixels();
}
