
DotLine dlu, dlr;

void setup(){
	size(800, 800);
	background(255);

	dlr = new DotLine(new PVector(100, 100), new PVector(700, 100));
	dlr.setInOutCubicDots(10);

	dlu = new DotLine(new PVector(100, 200), new PVector(700, 200));
	dlu.setInSineDots(10);
}


void draw(){
	dlr.display(true, true);
	dlu.display(true, true);
}