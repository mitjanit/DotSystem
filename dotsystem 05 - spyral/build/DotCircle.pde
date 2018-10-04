

class DotCircle extends DotSet {
	
	PVector c;
	float radius;

	// Constructor
	DotCircle(PVector c, float r){
		super();
		this.c = new PVector(c.x, c.y);
		this.radius = r;
	}


	void setDots(int num, float a0){
		dots = new ArrayList<Dot>();
		for (float i = 0; i < num; i++){
  			float a = i * ( TWO_PI / num);
  			float x = c.x + radius*cos(a0+a);
  			float y = c.y + radius*sin(a0+a);
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
		ellipse(c.x, c.y, 2*radius, 2*radius);
	}

}