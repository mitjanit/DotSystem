

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
		dots = new ArrayList<PVector>();
		for(float i=0; i<num; i++){
			float v = i / (num-1);
			v = Ease.ease(v, mode);
  			float x = (b.x * v) + (a.x * (1 - v));
  			float y = (b.y * v) + (a.y * (1 - v));
			dots.add(new PVector(x, y));
		}
	}


	void setSmoothDots(float num){
		dots = new ArrayList<PVector>();
		for (float i = 0; i <= num; i++){
  			float v = i / num;
  			v = v * v * (3 - 2 * v);
  			float x = (b.x * v) + (a.x * (1 - v));
  			float y = (b.y * v) + (a.y * (1 - v));
  			dots.add(new PVector(x, y));
		} 
	}

	void setSmootherDots(float num){
		dots = new ArrayList<PVector>();
		for (float i = 0; i <= num; i++){
  			float v = i / num;
  			v = v * v * v * ( v * (6* v - 15) +10);
  			float x = (b.x * v) + (a.x * (1 - v));
  			float y = (b.y * v) + (a.y * (1 - v));
  			dots.add(new PVector(x, y));
		} 
	}

	void setOutSinusDots(float num){
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
	void setEquiDots(float num, float randX, float randY){
		dots = new ArrayList<PVector>();
		for(float i=0; i<num; i++){
			float x = lerp(a.x, b.x, i/(num-1)) + random(-randX, randX);
			float y = lerp(a.y, b.y, i/(num-1)) + random(-randY, randY);
			dots.add(new PVector(x, y));
		}
	}


	// Dsiplay line and dots
	void display(boolean showLine, boolean showDots){
		if(showLine){
			displayLine();
		}
		if(showDots){
			displayDots();
		}
	}


	void displayLine(){
		stroke(0); strokeWeight(1);
		line(a.x, a.y, b.x, b.y);
	}

}