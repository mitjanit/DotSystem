
//********************** Basic Settings ***********************//

int    sceneWidth   	= 1750;
int    sceneHeight  	= 900;
color  bgColor    		= #FCFCFC;

//********************* DotLine Settings ***********************//

ArrayList<DotCircle> dcs;
int numCircles = 8;

IntRange numDots		= new IntRange(10, 1, 30, 1, true);
FloatRange angle		= new FloatRange(0, 0, TWO_PI, 0.01, true);
boolean updatePolygon 	= true;

PFont font;
String title 			= "DOT SYSTEM v03.";
String description		= "DOTS DISTRIBUTION ALONG CIRCLE LINE USING LINEAR EASING.";

void settings() {
	size(sceneWidth,sceneHeight,P3D);
}

void setup(){
	background(bgColor);
	smooth();

	font = createFont("Arial", 14);
	textFont(font);

	dcs = new ArrayList<DotCircle>();
	for(int i=0; i<numCircles; i++){
		DotCircle dc = 	createDotCircle(numDots.getValue(), new PVector(width/2, height/2), 50 + 50*i, PI/(i+1));
		dcs.add(dc);
	}

}


void draw(){

	int nd = (int) map(mouseX, 0, width, numDots.getMinValue(), numDots.getMaxValue());
	float a = map(mouseY, 0, height, angle.getMinValue(), angle.getMaxValue());

	if(nd!=numDots.getValue() || a!=angle.getValue() || updatePolygon){
		numDots.setValue(nd);
		angle.setValue(a);
		background(bgColor);
		//createDotCircle(numDots.getValue(), new PVector(width/2, height/2), 400, 0);
		dcs = new ArrayList<DotCircle>();
		for(int i=0; i<numCircles; i++){
			DotCircle dc = 	createDotCircle(numDots.getValue(), new PVector(width/2, height/2), 50 + 50*i, a);
			dcs.add(dc);
		}
		for(DotCircle dc : dcs){
			dc.display(true, true, true);
		}
		displayInfo(60, 60, 20);
	}

}

DotCircle createDotCircle(int n, PVector c, float r, float a0){
	DotCircle dc = new DotCircle(c, r);
	dc.setDots(n, a0);
	return dc;
}


void displayInfo(float x, float y, float stepY){
	textAlign(LEFT); fill(0);
	text(title, x, y);
	text(description, x, y + stepY);
	text("NUM DOTS: "+numDots+".", x, y + stepY*2);
	text("ANGLE: "+angle+".", x, y + stepY*3);
}

/*
void keyPressed(){
	if(key==CODED && keyCode==LEFT){
		numVertexs.previous();
		updatePolygon = true;
	}
	else if(key==CODED && keyCode==RIGHT){
		numVertexs.next();
		updatePolygon = true;
	}
	else if(key==CODED && keyCode==UP){
		mode.next();
		updatePolygon = true;
	}
	else if(key==CODED && keyCode==DOWN){
		mode.previous();
		updatePolygon = true;
	}
	else if(key=='a'){
		angle +=0.1;
		updatePolygon=true;
	}
	else if(key=='p'){
		saveFrame("frame/dotsystem02-######.png");
	}

}

*/