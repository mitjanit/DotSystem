
DotLine dlu, dlr;

void setup(){
	size(800, 800);
	background(255);

	/*PVector a = new PVector(100,100);
	PVector b = new PVector(700,700);
	dlu = new DotLine(a, b);
	dlu.setDots(5);*/


	dlr = new DotLine(new PVector(100, 100), new PVector(700, 700));
	dlr.setOutCubicDots(6);
}


void draw(){
	//dlu.display(true, true);
	dlr.display(true, true);
}