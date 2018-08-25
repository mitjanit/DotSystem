
class Dot {
	
	// Posotion of the dot
	PVector pos;

	// Constructor
	Dot(PVector p){
		pos = new PVector(p.x, p.y, p.z);
	}

	// Display the dot
	public void display(){
		stroke(0);
		line(pos.x, pos.y-5, pos.x, pos.y+5);
	}

	// Display the dot as a centroid or normal
	public void display(boolean isCentroid){
		if(isCentroid){
			displayCentroid();
		}
		else {
			display();
		}
	}

	// Display dot as a centroid
	void displayCentroid(){
		fill(255, 0, 0); noStroke();
		ellipse(pos.x, pos.y, 5, 5);
	}
}