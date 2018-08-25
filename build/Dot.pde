
class Dot {
	
	PVector pos;

	Dot(PVector p){
		pos = new PVector(p.x, p.y, p.z);
	}

	public void display(){
		stroke(0);
		line(pos.x, pos.y-5, pos.x, pos.y+5);
	}

	public void display(boolean isCentroid){
		if(isCentroid){
			fill(255, 0, 0); noStroke();
			ellipse(pos.x, pos.y, 5, 5);
		}
		else {
			display();
		}
	}
}