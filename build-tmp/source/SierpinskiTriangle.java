import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class SierpinskiTriangle extends PApplet {

int c;
ArrayList<Mover> points = new ArrayList<Mover>();

public void setup() {
	size(600, 600);
	noStroke();
	points.add(new Mover(100, 100, 355, 115, color((int)(Math.random()*250),(int)(Math.random()*250),(int)(Math.random()*250))));
}
public void draw() {
	background(147);
	for(Mover m : points){
		m.move();
		m.show();
	}
	sierpinski(100, 100, 100);
}

public void sierpinski(int x, int y, int len) {
	//fill(clr, len*2);
	//triangle(x, y, x+len/2, y-len, x+len, y);
	//triangle(x+len/2, y-len, x+len, y-2*len, x+(3*len)/2, y-len);
	//triangle(x+len, y, x+(3*len)/2, y-len, x+2*len, y);
	if(len>3){
		sierpinski(x, y, len/2);
		sierpinski(x+len/2, y-len, len/2);
		sierpinski(x+len, y, len/2);
	} else {
		fill(0);
		for(int i=x; i<x+len/2; i++){
			for(int q=y; q>q-len; q--){
				point(i, q);
			}
		}
		//triangle(x, y, x+len/2, y-len, x+len, y);
	}
}

class Mover {
	int myX;
	int myY;
	int destX;
	int destY;
	int colr;
	Mover(int x, int y, int dX, int dY, int clr){
		myX=x;
		myY=y;
		destX=dX;
		destY=dY;
		colr = clr;
	}
	public void move(){
		if(myX>destX){myX--;}
		if(myX<destX){myX++;}
		if(myY>destY){myY--;}
		if(myY<destY){myY++;}
	}
	public void show(){
		fill(colr);
		ellipse(myX, myY, 3, 3);
	}
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "SierpinskiTriangle" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
