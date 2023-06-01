import processing.sound.*;

ArrayList<BBall> bouncies = new ArrayList<BBall>();

void setup () {
  size(400, 400);
}

void draw () {
  background(0);
  for(BBall ball : bouncies){
    ball.update();
    ball.draw();
  }
}

void mouseClicked () {
  bouncies.add(new BBall(mouseX, mouseY));
}
