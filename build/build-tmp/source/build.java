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

	dlr = new DotLine(new PVector(100, 100), new PVector(700, 100));
	dlr.setInOutCubicDots(10);

	dlu = new DotLine(new PVector(100, 200), new PVector(700, 200));
	dlu.setInSineDots(10);
}


public void draw(){
	dlr.display(true, true);
	dlu.display(true, true);
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
  			v = Ease.inQuad(v);
  			float x = (b.x * v) + (a.x * (1 - v));
  			float y = (b.y * v) + (a.y * (1 - v));
  			dots.add(new PVector(x, y));
		} 
	}

	public void setOutQuadDots(float num){
		dots = new ArrayList<PVector>();
		for (float i = 0; i <= num; i++){
  			float v = i / num;
  			v = Ease.outQuad(v);
  			float x = (b.x * v) + (a.x * (1 - v));
  			float y = (b.y * v) + (a.y * (1 - v));
  			dots.add(new PVector(x, y));
		} 
	}

	public void setInOutQuadDots(float num){
		dots = new ArrayList<PVector>();
		for (float i = 0; i <= num; i++){
  			float v = i / num;
  			v = Ease.inOutQuad(v);
  			float x = (b.x * v) + (a.x * (1 - v));
  			float y = (b.y * v) + (a.y * (1 - v));
  			dots.add(new PVector(x, y));
		} 
	}

	public void setInSineDots(float num){
		dots = new ArrayList<PVector>();
		for (float i = 0; i <= num; i++){
  			float v = i / num;
  			v = Ease.inSine(v);
  			float x = (b.x * v) + (a.x * (1 - v));
  			float y = (b.y * v) + (a.y * (1 - v));
  			dots.add(new PVector(x, y));
		} 
	}

	public void setOutSineDots(float num){
		dots = new ArrayList<PVector>();
		for (float i = 0; i <= num; i++){
  			float v = i / num;
  			v = Ease.outSine(v);
  			float x = (b.x * v) + (a.x * (1 - v));
  			float y = (b.y * v) + (a.y * (1 - v));
  			dots.add(new PVector(x, y));
		} 
	}

	public void setInOutSineDots(float num){
		dots = new ArrayList<PVector>();
		for (float i = 0; i <= num; i++){
  			float v = i / num;
  			v = Ease.inOutSine(v);
  			float x = (b.x * v) + (a.x * (1 - v));
  			float y = (b.y * v) + (a.y * (1 - v));
  			dots.add(new PVector(x, y));
		} 
	}

	public void setInCubicDots(float num){
		dots = new ArrayList<PVector>();
		for (float i = 0; i <= num; i++){
  			float v = i / num;
  			v = Ease.inCubic(v) ;
  			float x = (b.x * v) + (a.x * (1 - v));
  			float y = (b.y * v) + (a.y * (1 - v));
  			dots.add(new PVector(x, y));
		} 
	}

	public void setOutCubicDots(float num){
		dots = new ArrayList<PVector>();
		for (float i = 0; i <= num; i++){
  			float v = i / num;
  			v = Ease.outCubic(v);
  			float x = (b.x * v) + (a.x * (1 - v));
  			float y = (b.y * v) + (a.y * (1 - v));
  			dots.add(new PVector(x, y));
		} 
	}

	public void setInOutCubicDots(float num){
		dots = new ArrayList<PVector>();
		for (float i = 0; i <= num; i++){
  			float v = i / num;
  			v = Ease.inOutCubic(v);
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

	public void setOutSinusDots(float num){
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

public static class Ease {
	
	// Quad Easing (In, Out, In&Out)

	public static float inQuad(float t) {
		return t * t ;
	}

	public static float outQuad(float t) {
		return t * (2 - t) ;
	}

	public static float inOutQuad(float t) {
		return t<0.5f ? 2*t*t : -1+(4-2*t)*t ;
	}

	// Cubic Easing (In, Out, In&Out)
	
	public static float inCubic(float t) {
		return t * t * t ;
	}

	public static float outCubic(float t) {
		return (--t)*t*t+1 ;
	}

	public static float inOutCubic(float t) {
		return t < 0.5f ? 4 * t * t * t : ( t - 1 ) * ( 2 * t - 2 ) * ( 2 * t - 2 ) + 1 ;
	}


	// Sine Easing (In, Out, IN&Out)

	public static float inSine(float t ) {
	    return -1 * cos( t * ( PI / 2 ) ) + 1;
	}

	public static float outSine(float t ) {
	    return sin( t * ( PI / 2 ) );
	}

	public static float inOutSine(float t ) {
	    return -0.5f * ( cos( PI * t ) - 1 );
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
