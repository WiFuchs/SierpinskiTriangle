color c;
ArrayList<Mover> points = new ArrayList<Mover>();

public void setup() {
  size(600, 600);
  noStroke();
  sierpinski(100, 500, 200);
}
public void draw() {
  background(147);
  for(Mover m : points){
    m.move();
    m.show();
  }
}

public void sierpinski(int x, int y, int len) {
  //fill(clr, len*2);
  //triangle(x, y, x+len/2, y-len, x+len, y);
  //triangle(x+len/2, y-len, x+len, y-2*len, x+(3*len)/2, y-len);
  //triangle(x+len, y, x+(3*len)/2, y-len, x+2*len, y);
  if(len>20){
    sierpinski(x, y, len/2);
    sierpinski(x+len/2, y-len, len/2);
    sierpinski(x+len, y, len/2);
  } else {
    fill(0);
    color tempClr = color((int)(Math.random()*250),(int)(Math.random()*250),(int)(Math.random()*250));
    for(int i=1; i<dist(x, y, x+len/2, y-len)-10; i++){
      float[] coords = pointsLine(x, y, x+len/2, y-len, i);
      points.add(new Mover(random(10, 590), random(10, 590), coords[0], coords[1], tempClr));
    //triangle(x, y, x+len/2, y-len, x+len, y);
    }
    for(int i=1; i<dist(x, y, x+len/2, y-len)-10; i++){
      float[] coords = pointsLine(x+len/2, y-len, x+len, y, i);
      points.add(new Mover(random(10, 590), random(10, 590), coords[0], coords[1], tempClr));
    //triangle(x, y, x+len/2, y-len, x+len, y);
    }
    for(int i=1; i<dist(x, y, x+len/2, y-len)-10; i++){
      float[] coords = pointsLine(x+len, y, x, y, i);
      points.add(new Mover(random(10, 590), random(10, 590), coords[0], coords[1], tempClr));
    //triangle(x, y, x+len/2, y-len, x+len, y);
    }
  }
}

class Mover {
  float myX;
  float myY;
  float destX;
  float destY;
  color colr;
  Mover(float x, float y, float dX, float dY, color clr){
    myX=x;
    myY=y;
    destX=dX;
    destY=dY;
    colr = clr;
  }
  void move(){
    if(myX>destX){myX--;}
    if(myX<destX){myX++;}
    if(myY>destY){myY--;}
    if(myY<destY){myY++;}
  }
  void show(){
    fill(colr);
    ellipse(myX, myY, 6, 6);
  }
}

float[] pointsLine(int x1, int y1, int x2, int y2, int position){
  float[] coordinates = new float[2];
  float b;
  float a = y2-y1;
  if(x1==x2){
    a=0;
  } else {
    a /= x2-x1;
  }
  b = y1-x1*a;
  coordinates[0] = x1+position;
  coordinates[1] = a*coordinates[0]+b;
  return coordinates;
}