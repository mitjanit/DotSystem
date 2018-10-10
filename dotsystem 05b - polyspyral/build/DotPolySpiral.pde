

class DotPolySpiral extends DotSet {
	
	int direction;
	PVector c;
	FloatRange angle;
	FloatRange radius;
	int numSides;

	// Constructor
	DotPolySpiral(PVector c, int n, FloatRange a, FloatRange r){
		super();
		this.c = new PVector(c.x, c.y);
		this.angle = a; //new FloatRange(0, 0, 15*TWO_PI, TWO_PI/(float)n, false);
		this.radius = r;
		this.direction = 1; //CW
		this.numSides = n;
	}

	void setDirection(int d){
		this.direction = d;
	}


	void setDots(int num, float a0, int mode){
		
		dots = new ArrayList<Dot>();

		for (float i = 0; i < num; i++){
			float v = i / (num-1);
			v = Ease.ease(v, mode);

  			float a = (angle.getMaxValue() * v) + (angle.getMinValue() * (1 - v));
  			float r = (radius.getMaxValue() * v) + (radius.getMinValue() * (1 - v));
  			a+=a0;
  			float x = c.x + r*cos(direction*a);
  			float y = c.y + r*sin(direction*a);
  			PVector p = new PVector(x, y);
  			addDot(new Dot(new PVector(x, y)));
  			radius.next();
  			angle.next();
  		}

		/*
		int n=0;
		while(radius.hasNext() && angle.hasNext() && n<num){
			float r = radius.getValue();
			float a = angle.getValue() + a0;
			float x = c.x + r*cos(direction*a);
			float y = c.y + r*sin(direction*a);
			PVector p = new PVector(x, y);
  			addDot(new Dot(new PVector(x, y)));
  			radius.next();
  			angle.next();
  			n++;
		}
		*/
	}


	// Display line and dots
	void display(boolean showLine, boolean showDots, boolean showCentroid){
		if(showLine){
			displayLine();
		}
		if(showDots){
			displayDots(showCentroid);
		}
	}


	void displayLine(){
		stroke(0); strokeWeight(1); noFill();
		for(int i=0; i<dots.size()-1; i++){
			Dot a = dots.get(i);
			Dot b = dots.get(i+1);
			line(a.pos.x, a.pos.y, b.pos.x, b.pos.y);
		}
	}

}