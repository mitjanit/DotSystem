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


ArrayList<DotLine> dls;

int numDots = 50;
float colX = 60;
float startY = 50;
float stepY = 60;
float lineLength = 600;

public void setup(){
	
	background(255);
	fill(0);

	createAllEasing();


}


public void draw(){
	background(255);
	displayAllEasing();

	for(DotLine dl : dls){
		//dl.moveRandom(-1,1);
		dl.moveRound(new PVector(width/2, height/2),frameCount/10000.0f);
	}
}

public void createAllEasing(){
	
	dls = new ArrayList<DotLine>();

	int numCol = 1;
	int j=0;
	for(int i=0; i<Ease.METHODS.length-6; i++){
		float y = startY + stepY*j;
		float x = colX + (4*colX + lineLength)*(numCol-1);
		float xt = x + lineLength + colX;
		text (Ease.METHODS[i], xt, y);
		DotLine dl = new DotLine(new PVector(x, y), new PVector(x+lineLength, y));
		dl.setDots(numDots, i);
		dls.add(dl);
		j++;
		if(y>=height-3*startY){
			j=1; numCol++;
		}
	}
}

public void displayAllEasing(){
	for(int i=0; i<dls.size(); i++){
		dls.get(i).display(true, true);
	}
}

class Dot {
	
	// Posotion of the dot
	PVector pos;

	// Constructor
	Dot(PVector p){
		pos = new PVector(p.x, p.y, p.z);
	}

	// Display the dot
	public void display(){
		stroke(0);
		line(pos.x, pos.y-5, pos.x, pos.y+5);
	}

	//Target movement
	public void moveTarget(PVector target, float amt){
		float x = lerp(pos.x, target.x, amt);
		float y = lerp(pos.y, target.y, amt);
		pos = new PVector(x, y);
	}

	//Circle movement
	public void moveRound(PVector centre, float angle){
		float radius = dist(pos.x, pos.y, centre.x, centre.y);
		float x = centre.x + radius*cos(angle); 
		float y = centre.y + radius*sin(angle); 
		pos = new PVector(x, y);
	}

	//Circle movement
	public void moveRound(PVector centre, float radius, float angle){
		float x = centre.x + radius*cos(angle); 
		float y = centre.y + radius*sin(angle); 
		pos = new PVector(x, y);
	}

	//Random walk movement
	public void moveRandom(float minValue, float maxValue){
		float randX = random(minValue, maxValue); 
		float randY = random(minValue, maxValue); 
		pos.add(new PVector(randX, randY));
	}

	//Step movement
	public void moveStep(float stepX, float stepY){
		pos.add(new PVector(stepX, stepY));
	}

	// Display the dot as a centroid or normal
	public void display(boolean isCentroid){
		if(isCentroid){
			displayCentroid();
		}
		else {
			display();
		}
	}

	// Display dot as a centroid
	public void displayCentroid(){
		fill(255, 0, 0); noStroke();
		ellipse(pos.x, pos.y, 5, 5);
	}
}


// Line of Dots
class DotLine extends DotSet {
	
	// Line vertexs
	PVector a, b;

	// Constructor
	DotLine(PVector a, PVector b){
		super();
		this.a = new PVector(a.x, a.y);
		this.b = new PVector(b.x, b.y);
	}


	// Creates a set of num. of dots using an Easing function.
	@Override
	public void setDots(float num, int mode){
		dots = new ArrayList<Dot>();
		for(float i=0; i<num; i++){
			float v = i / (num-1);
			v = Ease.ease(v, mode);
  			float x = (b.x * v) + (a.x * (1 - v));
  			float y = (b.y * v) + (a.y * (1 - v));
  			addDot(new Dot(new PVector(x, y)));
		}
	}


	public void setSmoothDots(float num){
		dots = new ArrayList<Dot>();
		for (float i = 0; i <= num; i++){
  			float v = i / num;
  			v = v * v * (3 - 2 * v);
  			float x = (b.x * v) + (a.x * (1 - v));
  			float y = (b.y * v) + (a.y * (1 - v));
  			dots.add(new Dot(new PVector(x, y)));
		} 
	}

	public void setSmootherDots(float num){
		dots = new ArrayList<Dot>();
		for (float i = 0; i <= num; i++){
  			float v = i / num;
  			v = v * v * v * ( v * (6* v - 15) +10);
  			float x = (b.x * v) + (a.x * (1 - v));
  			float y = (b.y * v) + (a.y * (1 - v));
  			dots.add(new Dot (new PVector(x, y)));
		} 
	}

	public void setOutSinusDots(float num){
		dots = new ArrayList<Dot>();
		for (float i = 0; i <= num; i++){
  			float v = i / num;
  			v = sin(v*HALF_PI);
  			float x = (b.x * v) + (a.x * (1 - v));
  			float y = (b.y * v) + (a.y * (1 - v));
  			dots.add(new Dot(new PVector(x, y)));
		} 
	}

	// Creates an equidistant distribution of num points along line with randomness.
	public void setEquiDots(float num, float randX, float randY){
		dots = new ArrayList<Dot>();
		for(float i=0; i<num; i++){
			float x = lerp(a.x, b.x, i/(num-1)) + random(-randX, randX);
			float y = lerp(a.y, b.y, i/(num-1)) + random(-randY, randY);
			dots.add(new Dot(new PVector(x, y)));
		}
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

}

// Set of Dots

class DotSet {
	
	// Collection of dots along line
	public ArrayList<Dot> dots;
	// Centroid of set of dots
	Dot centroid;

	//Constructor
	public DotSet(){
		dots = new ArrayList<Dot>();
	}

	// Creates a set of num. of dots using different modes.
	public void setDots(float num, int mode){
		dots = new ArrayList<Dot>();
	}

	// Add a dot to the set
	public void addDot(Dot d){
		dots.add(d);
		centroid = getCentroid();
	}

	// Return the collection of dots
	public ArrayList<Dot> getDots(){
		return dots;
	}

	// Return num of dots of set.
	public int getNumDots(){
		return dots.size();
	}

	//*************** CENTROID, MAX, MIN *******************//

	// Calculate de centroide of the set of dots
	public Dot getCentroid(){
		PVector c = new PVector();
		for(Dot d : dots){
			c.add(d.pos);
		}
		c.div(dots.size());
		return new Dot(c);
	}

	// Return the dot of the set with minim X coordinate
	public Dot getMinX(){
		Dot dMinX = dots.get(0);
		float minX = 100000;
		for(Dot d : dots){
			if(d.pos.x<minX){
				minX = d.pos.x;
				dMinX = d;
			}
		}
		return dMinX;
	}

	// Return the dot of the set with minim Y coordinate
	public Dot getMinY(){
		Dot dMinY = dots.get(0);
		float minY = 100000;
		for(Dot d : dots){
			if(d.pos.y<minY){
				minY = d.pos.y;
				dMinY = d;
			}
		}
		return dMinY;
	}

	// Return the dot of the set with maximum X coordinate
	public Dot getMaxX(){
		Dot dMaxX = dots.get(0);
		float maxX = -100000;
		for(Dot d : dots){
			if(d.pos.x>maxX){
				maxX = d.pos.x;
				dMaxX = d;
			}
		}
		return dMaxX;
	}

	// Return the dot of the set with maximum Y coordinate
	public Dot getMaxY(){
		Dot dMaxY = dots.get(0);
		float maxY = -100000;
		for(Dot d : dots){
			if(d.pos.y>maxY){
				maxY = d.pos.y;
				dMaxY = d;
			}
		}
		return dMaxY;
	}



	//************** DISPLAY FUNCTIONS ***************//

	// Display dots of set.
	public void displayDots(){
		for(Dot d : dots){
			d.display();
		}
		centroid.display(true);
	}



	//************** MOTION FUNCTIONS ***************//

	// Move all dots with random walk.
	public void moveRandom(float minValue, float maxValue){
		for(Dot d : dots){
			d.moveRandom(minValue,maxValue);
		}
	}

	// Move all dots with circle movement.
	public void moveRound(PVector centre, float stepAng){
		for(Dot d : dots){
			d.moveRound(centre,stepAng);
		}
	}


}
// Easing 
// Based on https://gist.github.com/gre/1650294

public static class Ease {

	public static String METHODS[] = {"LINEAR", 
									  "INQUAD", "OUTQUAD", "INOUTQUAD", 
									  "INSINE", "OUTSINE", "INOUTSINE",
									  "INCUBIC", "OUTCUBIC", "INOUTCUBIC",
									  "INQUART", "OUTQUART", "INOUTQUART",
									  "INQUINT", "OUTQUINT", "INOUTQUINT",
									  "INEXPO", "OUTEXPO", "INOUTEXPO",
									  "INCIRC", "OUTCIRC", "INOUTCIRC",
									  "INBOUNCE", "OUTBOUNCE", "INOUTBOUNCE",
									  "INELASTIC", "OUTELASTIC", "INOUTELASTIC",
									  "INBACK", "OUTBACK", "INOUTBACK"
									};
	//EQUI
	public static final int LINEAR 		= 0;

	// QUAD
	public static final int INQUAD 		= 1;
	public static final int OUTQUAD 	= 2;
	public static final int INOUTQUAD 	= 3;

	// SINE
	public static final int INSINE 		= 4;
	public static final int OUTSINE 	= 5;
	public static final int INOUTSINE 	= 6;

	// CUBIC
	public static final int INCUBIC 	= 7;
	public static final int OUTCUBIC 	= 8;
	public static final int INOUTCUBIC 	= 9;

	// QUART
	public static final int INQUART 	= 10;
	public static final int OUTQUART 	= 11;
	public static final int INOUTQUART 	= 12;

	// QUINT
	public static final int INQUINT 	= 13;
	public static final int OUTQUINT 	= 14;
	public static final int INOUTQUINT 	= 15;

	// EXPO
	public static final int INEXPO 		= 16;
	public static final int OUTEXPO 	= 17;
	public static final int INOUTEXPO 	= 18;

	// CIRC
	public static final int INCIRC		= 19;
	public static final int OUTCIRC 	= 20;
	public static final int INOUTCIRC 	= 21;

	// BOUNCE
	public static final int INBOUNCE	= 22;
	public static final int OUTBOUNCE 	= 23;
	public static final int INOUTBOUNCE = 24;

	// ELASTIC
	public static final int INELASTIC	 = 25;
	public static final int OUTELASTIC 	 = 26;
	public static final int INOUTELASTIC = 27;

	// BACK
	public static final int INBACK	 	 = 28;
	public static final int OUTBACK 	 = 29;
	public static final int INOUTBACK 	 = 30;
	

	// EASING FUNCTIONS

	public static float ease(float v, int mode){
		switch(mode){
			case Ease.LINEAR:		return v;
			case Ease.INCUBIC: 		return Ease.inCubic(v);
			case Ease.OUTCUBIC: 	return Ease.outCubic(v);
			case Ease.INOUTCUBIC: 	return Ease.inOutCubic(v);
			case Ease.INQUAD: 		return Ease.inQuad(v);
			case Ease.OUTQUAD: 		return Ease.outQuad(v);
			case Ease.INOUTQUAD: 	return Ease.inOutQuad(v);
			case Ease.INQUART: 		return Ease.inQuart(v);
			case Ease.OUTQUART: 	return Ease.outQuart(v);
			case Ease.INOUTQUART: 	return Ease.inOutQuart(v);
			case Ease.INQUINT: 		return Ease.inQuint(v);
			case Ease.OUTQUINT: 	return Ease.outQuint(v);
			case Ease.INOUTQUINT: 	return Ease.inOutQuint(v);
			case Ease.INEXPO: 		return Ease.inExpo(v);
			case Ease.OUTEXPO: 		return Ease.outExpo(v);
			case Ease.INOUTEXPO: 	return Ease.inOutExpo(v);
			case Ease.INSINE: 		return Ease.inSine(v);
			case Ease.OUTSINE: 		return Ease.outSine(v);
			case Ease.INOUTSINE: 	return Ease.inOutSine(v);
			case Ease.INCIRC: 		return Ease.inCirc(v);
			case Ease.OUTCIRC: 		return Ease.outCirc(v);
			case Ease.INOUTCIRC: 	return Ease.inOutCirc(v);
			case Ease.INBOUNCE: 	return Ease.inBounce(v);
			case Ease.OUTBOUNCE: 	return Ease.outBounce(v);
			case Ease.INOUTBOUNCE: 	return Ease.inOutBounce(v);
			case Ease.INELASTIC: 	return Ease.inElastic(v);
			case Ease.OUTELASTIC: 	return Ease.outElastic(v);
			case Ease.INOUTELASTIC: return Ease.inOutElastic(v);
			case Ease.INBACK: 		return Ease.inBack(v);
			case Ease.OUTBACK: 		return Ease.outBack(v);
			case Ease.INOUTBACK: 	return Ease.inOutBack(v);
			default: return v;
		}
	}

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

	// Quart Easing (In, Out, In&Out)

	public static float inQuart(float t) {
	    return t * t * t * t;
	}

	public static float outQuart(float t) {
	    float t1 = t - 1;
	    return 1 - t1 * t1 * t1 * t1;
	}

	public static float inOutQuart(float t ) {
	    float t1 = t - 1;
	    return t < 0.5f ? 8 * t * t * t * t : 1 - 8 * t1 * t1 * t1 * t1;
	}

	// Quint Easing (In, Out, In&Out)

	public static float inQuint(float t) {
	    return t * t * t * t * t;
	}

	public static float outQuint(float t) {
	    float t1 = t - 1;
	    return 1 + t1 * t1 * t1 * t1 * t1;
	}

	public static float inOutQuint(float t) {
	    float t1 = t - 1;
	    return t < 0.5f ? 16 * t * t * t * t * t : 1 + 16 * t1 * t1 * t1 * t1 * t1;
	}

	// Expo Easing (In, Out, In&Out)

	public static float inExpo(float t) {
	    if(t==0) {
	        return 0;
	    }
	    return pow( 2, 10 * ( t - 1 ) );
	}

	public static float outExpo(float t) {
	    if( t == 1 ) {
	        return 1;
	    }
	    return ( -pow( 2, -10 * t ) + 1 );
	}

	public static float inOutExpo(float t) {
	    if( t == 0 || t == 1 ) {
	        return t;
	    }
	    float scaledTime = t * 2;
	    float scaledTime1 = scaledTime - 1;
	    if( scaledTime < 1 ) {
	        return 0.5f * pow( 2, 10 * ( scaledTime1 ) );
	    }
	    return 0.5f * ( -pow( 2, -10 * scaledTime1 ) + 2 );
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

	// Circ Easing (In, Out, IN&Out)

	public static float inCirc(float t) {
	    float scaledTime = t / 1;
	    return -1 * ( sqrt( 1 - scaledTime * t ) - 1 );
	}

	public static float outCirc(float t) {
		float t1 = t - 1;
	    return sqrt( 1 - t1 * t1 );
	}

	public static float inOutCirc(float t) {
	    float scaledTime = t * 2;
	    float scaledTime1 = scaledTime - 2;
	    if( scaledTime < 1 ) {
	        return -0.5f * ( sqrt( 1 - scaledTime * scaledTime ) - 1 );
	    }
	    return 0.5f * ( sqrt( 1 - scaledTime1 * scaledTime1 ) + 1 );
	}

	// Bounce (In, Out, In&Out)

	public static float inBounce(float t) {
	    return 1 - outBounce( 1 - t );
	}

	public static float outBounce(float t) {
	    float scaledTime = t / 1;
	    if( scaledTime < ( 1 / 2.75f ) ) {
	        return 7.5625f * scaledTime * scaledTime;
	    } else if( scaledTime < ( 2 / 2.75f ) ) {
	        float scaledTime2 = scaledTime - ( 1.5f / 2.75f );
	        return ( 7.5625f * scaledTime2 * scaledTime2 ) + 0.75f;
	    } else if( scaledTime < ( 2.5f / 2.75f ) ) {
	        float scaledTime2 = scaledTime - ( 2.25f / 2.75f );
	        return ( 7.5625f * scaledTime2 * scaledTime2 ) + 0.9375f;
	    } else {
	        float scaledTime2 = scaledTime - ( 2.625f / 2.75f );
	        return ( 7.5625f * scaledTime2 * scaledTime2 ) + 0.984375f;
	    }
	}

	public static float inOutBounce(float t) {
	    if( t < 0.5f ) {
	        return inBounce( t * 2 ) * 0.5f;
	    }
	    return ( outBounce( ( t * 2 ) - 1 ) * 0.5f ) + 0.5f;
	}


	// Elastic (In, Out, In&Out)

	public static float inElastic( float t) {
		return inElastic(t, 0.7f);
	}

	public static float inElastic( float t, float magnitude) {
	    if( t == 0 || t == 1 ) {
	        return t;
	    }

	    float scaledTime = t / 1;
	    float scaledTime1 = scaledTime - 1;

	    float p = 1 - magnitude;
	    float s = p / ( 2 * PI ) * asin( 1 );

	    return -(pow( 2, 10 * scaledTime1 ) * sin( ( scaledTime1 - s ) * ( 2 * PI ) / p ));
	}

	public static float outElastic(float t) {
		return outElastic(t, 0.7f);
	}

	public static float outElastic(float t, float magnitude) {
	    float p = 1 - magnitude;
	    float scaledTime = t * 2;

	    if( t == 0 || t == 1 ) {
	        return t;
	    }

	    float s = p / ( 2 * PI ) * asin( 1 );
	    return (pow( 2, -10 * scaledTime ) * sin( ( scaledTime - s ) * ( 2 * PI ) / p )) + 1;
	}

	public static float inOutElastic(float t) {
	    return inOutElastic(t, 0.65f);
	}

	public static float inOutElastic(float t, float magnitude) {
	    float p = 1 - magnitude;

	    if( t == 0 || t == 1 ) {
	        return t;
	    }

	    float scaledTime = t * 2;
	    float scaledTime1 = scaledTime - 1;
	    float f = 0.0f; 
	    float s = p / ( 2 * PI ) * asin( 1 );

	    if( scaledTime < 1 ) {
	        return -0.5f * (pow( 2, 10 * scaledTime1 ) *sin( ( scaledTime1 - s ) * ( 2 * PI ) / p ));
	    }
	    return (pow( 2, -10 * scaledTime1 ) *sin( ( scaledTime1 - s ) * ( 2 * PI ) / p ) * 0.5f) + 1;
	}


	// BACK (In, Out, In&Out)

	public static float inBack(float t) {
		return inBack(t, 1.70158f);
	}

	public static float inBack(float t, float magnitude) {
	    return t * t * ( ( magnitude + 1 ) * t - magnitude );
	}

	public static float outBack(float t) {
		return outBack(t, 1.70158f);
	}

	public static float outBack(float t, float magnitude) {
	    float scaledTime = ( t / 1 ) - 1;
	    return (scaledTime * scaledTime * ( ( magnitude + 1 ) * scaledTime + magnitude )) + 1;
	}

	public static float inOutBack(float t) {
		return inOutBack(t, 1.70158f);
	}

	public static float inOutBack(float t, float magnitude) {
	    float scaledTime = t * 2;
	    float scaledTime2 = scaledTime - 2;
	    float s = magnitude * 1.525f;

	    if( scaledTime < 1) {
	        return 0.5f * scaledTime * scaledTime * (( ( s + 1 ) * scaledTime ) - s);
	    }
	    return 0.5f * (scaledTime2 * scaledTime2 * ( ( s + 1 ) * scaledTime2 + s ) + 2);
	}

}
  public void settings() { 	size(1800, 900); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "build" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
