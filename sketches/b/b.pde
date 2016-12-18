OPC opc;

int maxsize = 128;

//velocity, position, hue, saturation, brightness
float [] [] rows = {
 {0, 0, 0, 0, 0},
 {0, 0, 0, 0, 0},
 {0, 0, 0, 0, 0},
 {0, 0, 0, 0, 0},
 {0, 0, 0, 0, 0},
 {0, 0, 0, 0, 0},
 {0, 0, 0, 0, 0},
 {0, 0, 0, 0, 0}
};  

void setup()
{
  size(128,128);
  opc = new OPC(this, "127.0.0.1", 7890);
  float spacing = height / 10.0;
  opc.ledGrid8x8(0, width/2, height/2, spacing, 0, false);

  colorMode(HSB, 100);
  
  noStroke();
  rectMode(CENTER);
  frameRate(15);
 
  for(int i=0; i<8; i++) {
    rows[i][0] = 0.1 + random(0.9); //velocity
    rows[i][2] = random(100);  //starting hue
    rows[i][3] = random(100);  //starting saturation
    rows[i][4] = random(100);  //starting brightness
  }

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


  /* float hue1 = (timestamp + 40.0) % 100.0; */
  /* float saturation1 = pow((1 - osc2 * .7), 1.5) * 100; */
  /* float brightness1 = pow((1 - osc1 * .7), 1.5) * 100; */

  for(int i=0; i<8; i++) {
    float velocity = rows[i][0];
    float newPosition = rows[i][1] + velocity * 15;
    rows[i][1] = newPosition;
    
    // adjust hue and rollover if needed
    rows[i][2] = (rows[i][2] + random(20) - 10) % 100.0;
    if(rows[i][2] < 0.0) { rows[i][2] = rows[i][2] + 100; }

    // adjust saturation and rollover if needed
    rows[i][3] = (rows[i][3] + random(2) - 1) % 100.0;
    if(rows[i][3] < 0.0) { rows[i][3] = rows[i][3] + 100; }

    // adjust saturation and rollover if needed
    rows[i][4] = (rows[i][4] + random(2) - 1) % 100.0;
    if(rows[i][4] < 0.0) { rows[i][4] = rows[i][4] + 100; }

    float hue1 = rows[i][2];
    float saturation1 = rows[i][3];
    float brightness1 = rows[i][4];

    random(7); // this seems to make the other random() calls more random;

   if(i == 0) {
   println( saturation1);
   }

    color c1 = color(
        hue1,
        pow(saturation1/100, .5)*100,
        pow(brightness1/100, .5)*100
        );
    fill(c1);
    ellipse(20 + i * height / 10.0, newPosition, 15, 15);

    if(newPosition > maxsize) {
      rows[i][1] = 0;
    }
  }
  
  /* filter(BLUR,1); */
}
