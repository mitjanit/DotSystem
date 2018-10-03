

class DotWave extends DotSet {
	
	PVector a, b;
	float amplitude;

	// Constructor
	DotWave(PVector a, PVector b, float amp){
		super();
		this.a = new PVector(a.x, a.y);
		this.b = new PVector(b.x, b.y);
		this.amplitude = amp;
	}


	void setDots(int num, float angStart, int mode){
		dots = new ArrayList<Dot>();
		float angle=angStart;
		float dx = abs(a.x - b.x);
		float dy = abs(a.y - b.y);
		for (float i = 0; i <= num; i++){
			float v = i / (num-1);
			v = Ease.ease(v, mode);
  			float x = (b.x * v) + (a.x * (1 - v));
  			float y = (b.y * v) + (a.y * (1 - v));
  			if(dx >= dy){
  				y += amplitude*sin(angle);
  			}
  			else {
  				x += amplitude*sin(angle);
  			}
			PVector p = new PVector(x, y);
  			addDot(new Dot(new PVector(x, y)));
  			angle +=0.51;
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
		line(a.x, a.y, b.x, b.y);
		for(int i=0; i<dots.size()-1; i++){
			Dot a = dots.get(i);
			Dot b = dots.get(i+1);
			line(a.pos.x, a.pos.y, b.pos.x, b.pos.y);
		}
	}

}