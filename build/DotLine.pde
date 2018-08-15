


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
	void setEquiDots(float num){
		dots = new ArrayList<PVector>();
		for(float i=0; i<num; i++){
			float x = lerp(a.x, b.x, i/(num-1));
			float y = lerp(a.y, b.y, i/(num-1));
			dots.add(new PVector(x, y));
		}
	}

	void setInQuadDots(float num){
		dots = new ArrayList<PVector>();
		for (float i = 0; i <= num; i++){
  			float v = i / num;
  			v = Ease.inQuad(v);
  			float x = (b.x * v) + (a.x * (1 - v));
  			float y = (b.y * v) + (a.y * (1 - v));
  			dots.add(new PVector(x, y));
		} 
	}

	void setOutQuadDots(float num){
		dots = new ArrayList<PVector>();
		for (float i = 0; i <= num; i++){
  			float v = i / num;
  			v = Ease.outQuad(v);
  			float x = (b.x * v) + (a.x * (1 - v));
  			float y = (b.y * v) + (a.y * (1 - v));
  			dots.add(new PVector(x, y));
		} 
	}

	void setInOutQuadDots(float num){
		dots = new ArrayList<PVector>();
		for (float i = 0; i <= num; i++){
  			float v = i / num;
  			v = Ease.inOutQuad(v);
  			float x = (b.x * v) + (a.x * (1 - v));
  			float y = (b.y * v) + (a.y * (1 - v));
  			dots.add(new PVector(x, y));
		} 
	}

	void setInSineDots(float num){
		dots = new ArrayList<PVector>();
		for (float i = 0; i <= num; i++){
  			float v = i / num;
  			v = Ease.inSine(v);
  			float x = (b.x * v) + (a.x * (1 - v));
  			float y = (b.y * v) + (a.y * (1 - v));
  			dots.add(new PVector(x, y));
		} 
	}

	void setOutSineDots(float num){
		dots = new ArrayList<PVector>();
		for (float i = 0; i <= num; i++){
  			float v = i / num;
  			v = Ease.outSine(v);
  			float x = (b.x * v) + (a.x * (1 - v));
  			float y = (b.y * v) + (a.y * (1 - v));
  			dots.add(new PVector(x, y));
		} 
	}

	void setInOutSineDots(float num){
		dots = new ArrayList<PVector>();
		for (float i = 0; i <= num; i++){
  			float v = i / num;
  			v = Ease.inOutSine(v);
  			float x = (b.x * v) + (a.x * (1 - v));
  			float y = (b.y * v) + (a.y * (1 - v));
  			dots.add(new PVector(x, y));
		} 
	}

	void setInCubicDots(float num){
		dots = new ArrayList<PVector>();
		for (float i = 0; i <= num; i++){
  			float v = i / num;
  			v = Ease.inCubic(v) ;
  			float x = (b.x * v) + (a.x * (1 - v));
  			float y = (b.y * v) + (a.y * (1 - v));
  			dots.add(new PVector(x, y));
		} 
	}

	void setOutCubicDots(float num){
		dots = new ArrayList<PVector>();
		for (float i = 0; i <= num; i++){
  			float v = i / num;
  			v = Ease.outCubic(v);
  			float x = (b.x * v) + (a.x * (1 - v));
  			float y = (b.y * v) + (a.y * (1 - v));
  			dots.add(new PVector(x, y));
		} 
	}

	void setInOutCubicDots(float num){
		dots = new ArrayList<PVector>();
		for (float i = 0; i <= num; i++){
  			float v = i / num;
  			v = Ease.inOutCubic(v);
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

	// Return the collection of dots
	ArrayList<PVector> getDots(){
		return dots;
	}

	// Return num of dots along line.
	int getNumDots(){
		return dots.size();
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

	void displayDots(){
		fill(0); noStroke();
		for(int i=0; i<dots.size(); i++){
			PVector p = dots.get(i);
			ellipse(p.x, p.y, 5, 5);
		}
	}
}