OPC opc;

int maxsize = 128;
PImage heart;


void setup()
{
  size(128,128);
  opc = new OPC(this, "127.0.0.1", 7890);
  float spacing = height / 10.0;
  opc.ledGrid8x8(0, width/2, height/2, spacing, 0, false);

  colorMode(HSB, 100);
  
  noStroke();
  rectMode(CENTER);
  frameRate(30);
  heart = loadImage("heart.png");
}


float rate = 0.005;

void draw() {
  float s1 = 0.0;
  float s2 = 0.0;

  float timestamp = millis() * rate;
 
  background(#000000);
  float osc1 = (cos(timestamp) + 1)/2; // between zero and 1
  float osc2 = (sin(timestamp) + 1)/2; // between zero and 1
  float osc3 = (-cos(timestamp) + 1)/2; // between zero and 1
  s1 = 0.8 * (1 - 0.15 * osc1);
  s2 = 0.8 * (1 - 0.15 * osc2);

  translate(width/2, height/2);
 
 
 float n = 1.0;
 float m = 1.0;


 // background ellipse
 float hue1 = (timestamp + 40.0 * m) % 100.0;
 float saturation1 = pow((1 - osc2 * .7), 1.5) * 255;
 float brightness1 = pow((1 - osc1 * .7), 1.5) * 255;
 color c1 = color(
     hue1,
     saturation1,
     brightness1
     );
  fill(c1);
  scale(s1); 
  ellipse(0, 0, 120, 120);

  
  // foreground ellipses
  float hue2 = (timestamp + 80.0 + m) % 100.0;
  float saturation2 = pow((.5 + osc2 * .5), 1.5) * 255;
  color c2 = color(
    hue2,
    saturation1,
    saturation2
  );
  fill(c2);
  rotate(timestamp / 2);
  ellipse(0, 0, 100, 50);
  ellipse(0, 0, 50, 100);
  ellipse(0, 0, 100 * osc1, 100 * osc1);


  // ellipse 3
  float hue3 = (timestamp + 120.0 + m) % 100.0;
  float saturation3 = pow((.5 + osc2 * .5), 1.5) * 255;
  color c3 = color(
    hue3,
    saturation3,
    saturation3
  );
  fill(c3);
  ellipse(0, 0, 60 * osc3, 60 * osc3);

 /* image(heart, -width/2, -height/2, width, height); */
  filter(BLUR,3);
}
