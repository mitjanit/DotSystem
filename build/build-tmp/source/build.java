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

public class build extends PApplet {


DotLine dlu, dlr;

public void setup(){
	
	background(255);

	/*PVector a = new PVector(100,100);
	PVector b = new PVector(700,700);
	dlu = new DotLine(a, b);
	dlu.setDots(5);*/


	dlr = new DotLine(new PVector(100, 100), new PVector(700, 700));
	dlr.setOutCubicDots(6);
}


public void draw(){
	//dlu.display(true, true);
	dlr.display(true, true);
}



class DotLine {
	
	// Collection of dots along line
	ArrayList<PVector> dots;

	// Line vertexs
	PVector a, b;

	// Constructor
	DotLine(PVector a, PVector b){
		this.a = new PVector(a.x, a.y);
		this.b = new PVector(b.x, b.y);
	}

	// Creates an equidistant distribution of num points along line.
	public void setEquiDots(float num){
		dots = new ArrayList<PVector>();
		for(float i=0; i<num; i++){
			float x = lerp(a.x, b.x, i/(num-1));
			float y = lerp(a.y, b.y, i/(num-1));
			dots.add(new PVector(x, y));
		}
	}

	public void setInQuadDots(float num){
		dots = new ArrayList<PVector>();
		for (float i = 0; i <= num; i++){
  			float v = i / num;
  			v = v * v ;
  			float x = (b.x * v) + (a.x * (1 - v));
  			float y = (b.y * v) + (a.y * (1 - v));
  			dots.add(new PVector(x, y));
		} 
	}

	public void setOutQuadDots(float num){
		dots = new ArrayList<PVector>();
		for (float i = 0; i <= num; i++){
  			float v = i / num;
  			v = v * (2 - v) ;
  			float x = (b.x * v) + (a.x * (1 - v));
  			float y = (b.y * v) + (a.y * (1 - v));
  			dots.add(new PVector(x, y));
		} 
	}

	public void setInOutQuadDots(float num){
		dots = new ArrayList<PVector>();
		for (float i = 0; i <= num; i++){
  			float v = i / num;
  			v = v<0.5f ? 2*v*v : -1+(4-2*v)*v ;
  			float x = (b.x * v) + (a.x * (1 - v));
  			float y = (b.y * v) + (a.y * (1 - v));
  			dots.add(new PVector(x, y));
		} 
	}

	public void setInCubicDots(float num){
		dots = new ArrayList<PVector>();
		for (float i = 0; i <= num; i++){
  			float v = i / num;
  			v = v * v * v ;
  			float x = (b.x * v) + (a.x * (1 - v));
  			float y = (b.y * v) + (a.y * (1 - v));
  			dots.add(new PVector(x, y));
		} 
	}

	public void setOutCubicDots(float num){
		dots = new ArrayList<PVector>();
		for (float i = 0; i <= num; i++){
  			float v = i / num;
  			v = (--v)*v*v+1;
  			float x = (b.x * v) + (a.x * (1 - v));
  			float y = (b.y * v) + (a.y * (1 - v));
  			dots.add(new PVector(x, y));
		} 
	}


	public void setSmoothDots(float num){
		dots = new ArrayList<PVector>();
		for (float i = 0; i <= num; i++){
  			float v = i / num;
  			v = v * v * (3 - 2 * v);
  			float x = (b.x * v) + (a.x * (1 - v));
  			float y = (b.y * v) + (a.y * (1 - v));
  			dots.add(new PVector(x, y));
		} 
	}

	public void setSmootherDots(float num){
		dots = new ArrayList<PVector>();
		for (float i = 0; i <= num; i++){
  			float v = i / num;
  			v = v * v * v * ( v * (6* v - 15) +10);
  			float x = (b.x * v) + (a.x * (1 - v));
  			float y = (b.y * v) + (a.y * (1 - v));
  			dots.add(new PVector(x, y));
		} 
	}

	public void setSinusDots(float num){
		dots = new ArrayList<PVector>();
		for (float i = 0; i <= num; i++){
  			float v = i / num;
  			v = sin(v*HALF_PI);
  			float x = (b.x * v) + (a.x * (1 - v));
  			float y = (b.y * v) + (a.y * (1 - v));
  			dots.add(new PVector(x, y));
		} 
	}

	// Creates an equidistant distribution of num points along line with randomness.
	public void setEquiDots(float num, float randX, float randY){
		dots = new ArrayList<PVector>();
		for(float i=0; i<num; i++){
			float x = lerp(a.x, b.x, i/(num-1)) + random(-randX, randX);
			float y = lerp(a.y, b.y, i/(num-1)) + random(-randY, randY);
			dots.add(new PVector(x, y));
		}
	}

	// Return the collection of dots
	public ArrayList<PVector> getDots(){
		return dots;
	}

	// Return num of dots along line.
	public int getNumDots(){
		return dots.size();
	}


	// Dsiplay line and dots
	public void display(boolean showLine, boolean showDots){
		if(showLine){
			displayLine();
		}
		if(showDots){
			displayDots();
		}
	}


	public void displayLine(){
		stroke(0); strokeWeight(1);
		line(a.x, a.y, b.x, b.y);
	}

	public void displayDots(){
		fill(0); noStroke();
		for(int i=0; i<dots.size(); i++){
			PVector p = dots.get(i);
			ellipse(p.x, p.y, 5, 5);
		}
	}
}
  public void settings() { 	size(800, 800); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "build" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
