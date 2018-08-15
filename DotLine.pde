


class DotLine {
	
	// Collection of dots along line
	ArrayList<PVector> dots;

	// Line vertexs
	PVector a, b;

	// Constructor
	DotLine(PVector a, PVector b){
		this.a = a;
		this.b = b;
	}

	// Creates an uniform distribution of num points along line.
	void setDots(int num){
		dots = new ArrayList<PVector>();
		for(int i=0; i<num; i++){
			float x = lerp(a.x, b.x, i/num);
			float y = lerp(a.y, b.y, i/num);
			dots.add(new PVector(x, y));
		}
	}

	// Creates an uniform distribution of num points along line with randomness.
	void setDots(int num, float randX, float randY){
		dots = new ArrayList<PVector>();
		for(int i=0; i<num; i++){
			float x = lerp(a.x, b.x, i/num) + random(-randX, randX);
			float y = lerp(a.y, b.y, i/num) + random(-randY, randY);
			dots.add(new PVector(x, y));
		}
	}

	ArrayList<PVector> getDots(){
		return dots;
	}

	// Return num of dots along line.
	int getNumDots(){
		return dots.size();
	}
}