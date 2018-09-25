
// Polygon of Dots
class DotPolygon extends DotSet {
	
	// Polygon vertexs
	ArrayList<PVector> vertexs;

	// Constructor
	DotPolygon(){
		super();
		this.vertexs = new ArrayList<PVector>();
	}

	void addVertex(PVector p){
		this.vertexs.add(p);
	}

	void addVertexs(ArrayList<PVector> vs){
		this.vertexs.addAll(vs);
	}


	// Creates a set of num. of dots using an Easing function.
	@Override
	public void setDots(float num, int mode){
		dots = new ArrayList<Dot>();
		for(int n=0; n<vertexs.size(); n++){
			for(float i=0; i<num; i++){
				float v = i / (num-1);
				v = Ease.ease(v, mode);
				PVector a = vertexs.get(n);
				PVector b = vertexs.get((n+1)%vertexs.size());
	  			float x = (b.x * v) + (a.x * (1 - v));
	  			float y = (b.y * v) + (a.y * (1 - v));
	  			addDot(new Dot(new PVector(x, y)));
			}
		}
	}



	// Display polygon lines and dots
	void display(boolean showLines, boolean showDots, boolean showCentroid){
		if(showLines){
			displayLines();
		}
		if(showDots){
			displayDots(showCentroid);
		}
	}


	void displayLines(){
		stroke(0); strokeWeight(2);
		for(int i=0; i<vertexs.size(); i++){
			PVector a = vertexs.get(i);
			PVector b = vertexs.get((i+1)%vertexs.size());
			line(a.x, a.y, b.x, b.y);
		}
	}

}