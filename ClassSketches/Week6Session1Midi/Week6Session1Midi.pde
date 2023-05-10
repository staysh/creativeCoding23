import themidibus.*;

MidiBus midi;

void setup () {
  size(400,400);
  MidiBus.list();
  midi = new MidiBus(this, 1, 0);
}
