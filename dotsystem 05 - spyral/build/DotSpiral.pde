

class DotSpiral extends DotSet {
	
	PVector c;
	FloatRange angle;
	FloatRange radius;

	// Constructor
	DotSpiral(PVector c, FloatRange a, FloatRange r){
		super();
		this.c = new PVector(c.x, c.y);
		this.angle = a;
		this.radius = r;
	}


	void setDots(int num, int mode){
		
		dots = new ArrayList<Dot>();

		for (float i = 0; i < num; i++){
			float v = i / (num-1);
			v = Ease.ease(v, mode);
  			float a = (angle.getMaxValue() * v) + (angle.getMinValue() * (1 - v));
  			float r = (radius.getMaxValue() * v) + (radius.getMinValue() * (1 - v));
  			float x = c.x + r*cos(a);
			float y = c.y + r*sin(a);

			PVector p = new PVector(x, y);
  			addDot(new Dot(new PVector(x, y)));
  		}
		
		/*
		while(radius.hasNext()){
			
			float r = radius.getValue();
			float a = angle.getValue();

			println("R: "+r);

			float x = c.x + r*cos(a);
			float y = c.y + r*sin(a);

			PVector p = new PVector(x, y);
  			addDot(new Dot(new PVector(x, y)));

			radius.next();
			angle.next();
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