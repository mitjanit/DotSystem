
//********************** Basic Settings ***********************//

int    sceneWidth 		= 1750;
int    sceneHeight 		= 900;
color  bgColor    		= #FCFCFC;

//********************* DotLine Settings ***********************//

DotPolySpiral dps;

IntRange 	numDots		= new IntRange(150, 1, 300, 1, true);
FloatRange 	angle 		= new FloatRange(0, 0, 8*TWO_PI, 0.1, false);
FloatRange 	radius 		= new FloatRange(10, 10, 400, 5, false);
IntRange 	mode 		= new IntRange(0, 0, new Ease().METHODS.length-1, 1, true);

boolean updatePolygon 	= true;
float angleStart = PI/4;
int direction = 1;

PFont font;
String title 			= "DOT SYSTEM v05.2";
String description		= "DOTS DISTRIBUTION ALONG POLYGONAL SPIRAL.";

void settings() {
	size(sceneWidth,sceneHeight,P3D);
}

void setup(){
	background(bgColor);
	smooth();

	font = createFont("Arial", 14);
	textFont(font);

	createPolySpiral();

}


void draw(){

	int nd = (int) map(mouseX, 0, width, numDots.getMinValue(), numDots.getMaxValue());
	float aMax  = map(mouseY, 0, height, angle.getMinValue(), 15*TWO_PI);

	if(nd!=numDots.getValue() || aMax!=angle.getMaxValue() || updatePolygon){
		numDots.setValue(nd);
		angle.setMaxValue(aMax);
		updatePolygon = false;
		
		background(255, 200, 200);
		createPolySpiral();
		dps.display(true, true, true);
		displayInfo(60, 60, 20);
	}
}

void createPolySpiral(){
	dps = new DotPolySpiral(new PVector(width/2, height/2), 12, angle, radius);
	dps.setDirection(direction);
	dps.setDots(numDots.getValue(), angleStart, mode.getValue());
}


void displayInfo(float x, float y, float stepY){
	textAlign(LEFT); fill(0);
	text(title, x, y);
	text(description, x, y + stepY);
	text("EASING: "+new Ease().METHODS[mode.getValue()]+".", x, y + stepY*2);
	text("NUM DOTS: "+numDots+".", x, y + stepY*3);
	text("RADIUS: "+radius.getMaxValue()+".", x, y + stepY*4);
	text("NUM LAPS: "+angle.getMaxValue()/TWO_PI+".", x, y + stepY*5);
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
		direction*=-1;
		updatePolygon = true;
	}
	else if(key=='p'){
		saveFrame("frame/dotsystem05b-######.png");
	}

}
