
//********************** Basic Settings ***********************//

int    sceneWidth 		= 1750;
int    sceneHeight 		= 900;
color  bgColor    		= #FCFCFC;

//********************* DotLine Settings ***********************//

DotBezier db;
PVector c1, c2, a1, a2;

IntRange 	numDots		= new IntRange(2, 2, 100, 1, true);
IntRange 	mode 		= new IntRange(0, 0, new Ease().METHODS.length-1, 1, true);

boolean updatePolygon 	= true;

PFont font;
String title 			= "DOT SYSTEM v07.";
String description		= "DOTS DISTRIBUTION ALONG BEZIER CURVE.";

void settings() {
	size(sceneWidth,sceneHeight,P3D);
}

void setup(){
	background(bgColor);
	smooth();

	font = createFont("Arial", 14);
	textFont(font);

	c1 = new PVector(650, 400);
	c2 = new PVector(900, 680);
	a1 = new PVector(500, 500);
	a2 = new PVector(1200, 600);
	db = new DotBezier(c1, c2, a1, a2);

	createBezier();

}


void draw(){

	int nd = (int)map(mouseX, 0, width, numDots.getMinValue(), numDots.getMaxValue());

	if(nd!=numDots.getValue() || updatePolygon){
		numDots.setValue(nd);
		updatePolygon = false;
		background(bgColor);
		createBezier();
		db.display(true, true, true);
		displayInfo(60, 60, 20);
	}
}

void createBezier(){
	db.setDots(numDots.getValue(), mode.getValue());
}


void displayInfo(float x, float y, float stepY){
	textAlign(LEFT); fill(0);
	text(title, x, y);
	text(description, x, y + stepY);
	text("EASING: "+new Ease().METHODS[mode.getValue()]+".", x, y + stepY*2);
	text("NUM DOTS: "+numDots+".", x, y + stepY*3);
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


boolean draggingPoint(PVector p){
	return (dist(mouseX, mouseY, p.x, p.y)<20);
}

void mouseDragged(){
	if(draggingPoint(db.c1)){
		db.setControl1(mouseX, mouseY);
		updatePolygon = true;
	}
	else if(draggingPoint(db.c2)){
		db.setControl2(mouseX, mouseY);
		updatePolygon = true;
	}
	else if(draggingPoint(db.a1)){
		db.setAnchor1(mouseX, mouseY);
		updatePolygon = true;
	}
	else if(draggingPoint(db.a2)){
		db.setAnchor2(mouseX, mouseY);
		updatePolygon = true;
	}
}
