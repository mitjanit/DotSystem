
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
		this.centroid = getCentroid();
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
	public void displayDots(boolean showCentroid){
		for(Dot d : dots){
			d.display();
		}
		if(showCentroid){
			if(centroid!=null){
				centroid.display(true);
			}
		}
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