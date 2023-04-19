
PImage myImage;

int[] myIntArray = new int[10];
int[] cols = new int[10];


void setup () {
  myImage = loadImage("image.bmp");
  println(myImage.width);
  println(myImage.height);
  //can't use variables in size()
  //size(myImage.width, myImage.height); 
  size(1024, 765);
  //myImage.loadPixels();
  //for(int i = 0; i < myImage.pixels.length; i++)
  //{
  //  println(myImage.pixels[i]);
  //}
  for(int i = 0; i < 10; i++)
  {
    myIntArray[i] = i * 100;
    cols[i] = i * 100;
  }
  print(myIntArray[myIntArray.length - 1]);
}

void draw () {
  //image(myImage, 0, 0);
  //image(myImage, 100, 0);
  //image(myImage, 200, 0);
  //image(myImage, 300, 0);
  //image(myImage, 400, 0);
  //image(myImage, 500, 0);
  //image(myImage, 600, 0);
  //image(myImage, 700, 0);
  //image(myImage, 800, 0);
  //image(myImage, 900, 0);
  
  for(int i = 0; i < 10; i++){
    //do stuff
    PImage temp = myImage.get(myIntArray[i], 0, 100, height);
    image(temp, cols[i], 0);
    myIntArray[i] = (myIntArray[i] + i) % width;
  }
}
