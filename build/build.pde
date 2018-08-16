
DotLine dlu, dlr;

void setup(){
	size(800, 800);
	background(255);

	dlr = new DotLine(new PVector(100, 100), new PVector(700, 100));
	dlr.setDots(10, Ease.LINEAR);

	dlu = new DotLine(new PVector(100, 200), new PVector(700, 200));
	dlu.setDots(10, Ease.INELASTIC);
}


void draw(){
	dlr.display(true, true);
	dlu.display(true, true);
}