int s = 150;
float[] posx = new float[s]; float[] posy = new float[s];
float[] velx = new float[s]; float[] vely = new float[s];
color[] cols = new color[s];
void setup() {
  size(1000,300);
  float theta;
  for(int i=0; i<=s-1; i++) {
    theta = random(2*PI);
    posx[i] = random(width);
    posy[i] = random(height);
    velx[i] = 8*cos(theta);
    vely[i] = 8*sin(theta);
    cols[i] = color(random(255),random(255),random(255));
  }
}

void draw() {
  background(255);
  noStroke();
  for(int i=0; i <=s-1; i++) {
    fill(cols[i]);
    ellipse(posx[i],posy[i],10,10);
    posx[i]+=velx[i];
    posy[i]+=vely[i];
    if(posx[i]<mouseX) {
      velx[i]*=-1;
      posx[i] = mouseX;
    }
    if(posx[i]>width) {
      velx[i]*=-1;
    }
    if(posy[i]>=height-5||posy[i]<=5) {
      vely[i]*=-1;
    }
  }
  stroke(0);
  strokeWeight(10);
  line(mouseX,0,mouseX,height);
}