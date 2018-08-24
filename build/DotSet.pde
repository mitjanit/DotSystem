
class DotSet {
	
	// Collection of dots along line
	public ArrayList<PVector> dots;

	//Constructor
	public DotSet(){
		dots = new ArrayList<PVector>();
	}

	// Creates a set of num. of dots using different modes.
	public void setDots(float num, int mode){
		dots = new ArrayList<PVector>();
	}

	// Return the collection of dots
	public ArrayList<PVector> getDots(){
		return dots;
	}

	// Return num of dots along line.
	public int getNumDots(){
		return dots.size();
	}


	public void displayDots(){
		stroke(0); //noStroke();
		for(int i=0; i<dots.size(); i++){
			PVector p = dots.get(i);
			//ellipse(p.x, p.y, 5, 5);
			line(p.x, p.y-5, p.x, p.y+5);
		}
	}

}