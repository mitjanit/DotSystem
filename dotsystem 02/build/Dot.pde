
class Dot {
	
	// Posotion of the dot
	PVector pos;

	// Constructor
	Dot(PVector p){
		pos = new PVector(p.x, p.y, p.z);
	}

	// Display the dot
	public void display(){
		fill(0);
		ellipse(pos.x, pos.y, 5, 5);
	}

	//Target movement
	public void moveTarget(PVector target, float amt){
		float x = lerp(pos.x, target.x, amt);
		float y = lerp(pos.y, target.y, amt);
		pos = new PVector(x, y);
	}

	//Circle movement
	public void moveRound(PVector centre, float angle){
		float radius = dist(pos.x, pos.y, centre.x, centre.y);
		float x = centre.x + radius*cos(angle); 
		float y = centre.y + radius*sin(angle); 
		pos = new PVector(x, y);
	}

	//Circle movement
	public void moveRound(PVector centre, float radius, float angle){
		float x = centre.x + radius*cos(angle); 
		float y = centre.y + radius*sin(angle); 
		pos = new PVector(x, y);
	}

	//Random walk movement
	public void moveRandom(float minValue, float maxValue){
		float randX = random(minValue, maxValue); 
		float randY = random(minValue, maxValue); 
		pos.add(new PVector(randX, randY));
	}

	//Step movement
	public void moveStep(float stepX, float stepY){
		pos.add(new PVector(stepX, stepY));
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