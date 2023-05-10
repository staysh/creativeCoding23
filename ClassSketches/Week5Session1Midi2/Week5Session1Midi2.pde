import themidibus.*; //Import the library

MidiBus myBus; // The MidiBus
int bg = 0;
float etchX = 0.0;
float etchY = 0.0;

void setup() {
  size(400, 400);
  background(0);

  MidiBus.list(); // List all available Midi devices on STDOUT. This will show each device's index and name.

  // Either you can
  //                   Parent In Out
  //                     |    |  |
  //myBus = new MidiBus(this, 0, 1); // Create a new MidiBus using the device index to select the Midi input and output devices respectively.

  // or you can ...
  //                   Parent         In                   Out
  //                     |            |                     |
  //myBus = new MidiBus(this, "IncomingDeviceName", "OutgoingDeviceName"); // Create a new MidiBus using the device names to select the Midi input and output devices respectively.

  // or for testing you could ...
  //                 Parent  In        Out
  //                   |     |          |
  myBus = new MidiBus(this, 1, -1); // Create a new MidiBus with no input device and the default Java Sound Synthesizer as the output device.
}

void draw() {
  //background(bg);
  
  ellipse(etchX*width, etchY*height, 5, 5);
}

void noteOn(int channel, int pitch, int velocity) {
  
  // Receive a noteOn
  bg = pitch*2;
  /*
  println();
  println("Note On:");
  println("--------");
  println("Channel:"+channel);
  println("Pitch:"+pitch);
  println("Velocity:"+velocity);
  */
}

void noteOff(int channel, int pitch, int velocity) {
  // Receive a noteOff
  println();
  println("Note Off:");
  println("--------");
  println("Channel:"+channel);
  println("Pitch:"+pitch);
  println("Velocity:"+velocity);
}

void controllerChange(int channel, int number, int value) {
  // Receive a controllerChange
  if(number == 8){
    etchX = float(value) / 127.0;
    //etchX = map(value, 0, 127, 0.0, 1.0)
  }
  if(number == 9){
    etchY = float(value) / 127.0;
  }
  /*
  println();
  println("Controller Change:");
  println("--------");
  println("Channel:"+channel);
  println("Number:"+number);
  println("Value:"+value);
  */
}

void delay(int time) {
  int current = millis();
  while (millis () < current+time) Thread.yield();
}
