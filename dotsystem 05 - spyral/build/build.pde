
//********************** Basic Settings ***********************//

int    sceneWidth 		= 1750;
int    sceneHeight 		= 900;
color  bgColor    		= #FCFCFC;

//********************* DotLine Settings ***********************//

DotSpiral ds;

IntRange 	numDots		= new IntRange(150, 1, 300, 1, true);
FloatRange 	angle 		= new FloatRange(0, 0, 3*TWO_PI, 0.1, false);
float r;
FloatRange 	radius 		= new FloatRange(0, 0, 400, 4, false);
int direction = 1;
IntRange 	mode 		= new IntRange(3, 0, new Ease().METHODS.length-1, 1, true);

boolean updatePolygon 	= true;

PFont font;
String title 			= "DOT SYSTEM v05.";
String description		= "DOTS DISTRIBUTION ALONG SPIRAL.";

void settings() {
	size(sceneWidth,sceneHeight,P3D);
}

void setup(){
	background(bgColor);
	smooth();

	font = createFont("Arial", 14);
	textFont(font);

	createSpiral();

}


void draw(){

	int nd = (int) map(mouseX, 0, width, numDots.getMinValue(), numDots.getMaxValue());
	//r = map(mouseY, 0, height, 400, 800);
	float aMax  = map(mouseY, 0, height, 0, 5*TWO_PI);

	if(nd!=numDots.getValue() || r !=radius.getValue() || updatePolygon){
		numDots.setValue(nd);
		//radius.setMaxValue(r);
		//radius.setValue(r);
		angle.setMaxValue(aMax);

		updatePolygon = false;
		createSpiral();
		background(bgColor);
		ds.display(true, true, true);
		displayInfo(60, 60, 20);
	}

}

void createSpiral(){
	ds = new DotSpiral(new PVector(width/2, height/2), angle, radius);
	ds.setDirection(direction);
	ds.setDots(numDots.getValue(), mode.getValue());
}


void displayInfo(float x, float y, float stepY){
	textAlign(LEFT); fill(0);
	text(title, x, y);
	text(description, x, y + stepY);
	text("EASING: "+new Ease().METHODS[mode.getValue()]+".", x, y + stepY*2);
	text("NUM DOTS: "+numDots+".", x, y + stepY*3);
	text("RADIUS: "+r+".", x, y + stepY*4);
}


void keyPressed(){
	if(key==CODED && keyCode==LEFT){
		mode.previous();
		updatePolygon = true;
	}
	else if(key==CODED && keyCode==RIGHT){
		mode.next();
		updatePolygon = true;
	}
	else if(key==CODED && (keyCode==UP || keyCode==DOWN)){
		println("ghjkl: ");
		direction*=-1;
		updatePolygon = true;
	}
	else if(key=='p'){
		saveFrame("frame/dotsystem04-######.png");
	}

}
