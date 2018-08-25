
// Set of Dots

class DotSet {
	
	// Collection of dots along line
	public ArrayList<PVector> dots;
	// Centroid of set of dots
	PVector centroid;

	//Constructor
	public DotSet(){
		dots = new ArrayList<PVector>();
	}

	// Creates a set of num. of dots using different modes.
	public void setDots(float num, int mode){
		dots = new ArrayList<PVector>();
	}

	// Add a dot to the set
	public void addDot(PVector p){
		dots.add(p);
		centroid = getCentroid();
	}

	// Return the collection of dots
	public ArrayList<PVector> getDots(){
		return dots;
	}

	// Return num of dots of set.
	public int getNumDots(){
		return dots.size();
	}

	// Calculate de centroide of the set of dots
	public PVector getCentroid(){
		PVector c = new PVector();
		for(PVector p : dots){
			c.add(p);
		}
		
		return c.div(dots.size());
	}

	// Display dots of set.
	public void displayDots(){
		stroke(0); //noStroke();
		for(int i=0; i<dots.size(); i++){
			PVector p = dots.get(i);
			//ellipse(p.x, p.y, 5, 5);
			line(p.x, p.y-5, p.x, p.y+5);
		}
	}

	// Display centroid
	public void displayCentroid(){
		fill(255, 0, 0); noStroke();
		ellipse(centroid.x, centroid.y, 5, 5);
	}

}