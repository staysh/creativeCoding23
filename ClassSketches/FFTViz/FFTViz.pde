import processing.sound.*;

AudioIn mic;
//Amplitude vol;
FFT fft;
//LowPass lp;
//HighPass hp;

int bands = 128;
int begin = 3;
int end = 64;
int range = end - begin;

float atten = 0.2;

float[] sum = new float[bands];

float scale = 300.0;

float theta = TWO_PI / range;

float s = 0.0;
float next = 200.0;

int off = 0;

void setup () {
  size(720, 680, P3D);
  mic = new AudioIn(this, 0);
  mic.start();
  noStroke();
  //lp = new LowPass(this);
  //hp = new HighPass(this);
  //lp.freq(1000);
  //hp.freq(500);
  //hp.process(mic);
  //lp.process(mic);
  fft = new FFT(this, bands);
  fft.input(mic);
}

void draw () {
  background(0);
  fft.analyze();

  for(int i = begin; i < end; i++){
    sum[i] += fft.spectrum[i];
    
    float x = cos(i * theta) * noise(sum[i]) * scale;
    float y = sin(i * theta) * noise(sum[i]) * scale;
    
    pushMatrix();
    translate(width/2, height/2);
    fill(255);
    circle(x, y, 10);
    popMatrix();

    int d = height / range;
    String v = nf(fft.spectrum[i], 0, 4);
    fill(255, 0, 0);
    text(v, 10, (i - begin) * d);
  }
  off += 1;
  
  //lp.freq(map(mouseX, 0, width, 20, 20000));
  //circle(0, 0, s);
  //s += (next - s) * atten;

}
