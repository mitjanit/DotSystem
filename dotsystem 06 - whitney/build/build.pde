
//********************** Basic Settings ***********************//

int    sceneWidth 		= 1750;
int    sceneHeight 		= 900;
color  bgColor    		= #FCFCFC;

//********************* DotLine Settings ***********************//

DotWhitney dw;

IntRange 	numDots		= new IntRange(30, 1, 300, 1, true);
FloatRange 	angle 		= new FloatRange(0, 0, 3*TWO_PI, 0.1, false);
float r;
FloatRange 	phase 		= new FloatRange(0, 0, 50, 1, false);
FloatRange 	amplitude 	= new FloatRange(0, 0, 50, 1, false);
IntRange 	mode 		= new IntRange(3, 0, new Ease().METHODS.length-1, 1, true);

boolean updatePolygon 	= true;
float magnify = 250;

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
	createWhitney();

}


void draw(){

	float p = map(mouseX, 0, width, phase.getMinValue(), phase.getMaxValue());
	float a = map(mouseX, 0, width, amplitude.getMinValue(), amplitude.getMaxValue());
	if(p!=phase.getValue() || a!=amplitude.getValue()){
		background(bgColor);
		phase.setValue(p);
		amplitude.setValue(a);
		createWhitney();
		dw.display(true, true, true);
		displayInfo(60, 60, 20);
	}
}

void createWhitney(){
	dw = new DotWhitney(new PVector(width/2, height/2), magnify, phase.getValue(), amplitude.getValue());
	dw.setDots(numDots.getValue(), mode.getValue());
}


void displayInfo(float x, float y, float stepY){
	textAlign(LEFT); fill(0);
	text(title, x, y);
	text(description, x, y + stepY);
	text("EASING: "+new Ease().METHODS[mode.getValue()]+".", x, y + stepY*2);
	text("NUM DOTS: "+numDots+".", x, y + stepY*3);
	text("RADIUS: "+magnify+".", x, y + stepY*4);
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
	else if(key=='p'){
		saveFrame("frame/dotsystem04-######.png");
	}

}
