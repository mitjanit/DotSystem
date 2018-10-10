

class DotWhitney extends DotSet {
	
	PVector c;
	float magnify, phase, amplitude;

	// Constructor
	DotWhitney(PVector c, float m, float p, float a){
		super();
		this.c = new PVector(c.x, c.y);
		this.magnify = m;
		this.phase = p;
		this.amplitude = a;
	}

	public void setMagnify(float m){
	  this.magnify = m;
	}

	public void setPhase(float p){
	  this.phase = p;
	}

	public void setAmplitude(float a){
	  this.amplitude = a;
	}


	void setDots(int num, int mode){
		
		dots = new ArrayList<Dot>();

		float spacing = TWO_PI / num;

		for(int i=0; i<num; i++){
		  
		  float x = c.x + sin(spacing*amplitude*i)*(cos(spacing*phase*i)*magnify);
		  float y = c.y + sin(spacing*phase*i)*(sin(spacing*amplitude*i)*magnify);

		  PVector pos = new PVector(x, y);
  		  addDot(new Dot(new PVector(x, y)));
  		}

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