
//********************** Basic Settings ***********************//

int    sceneWidth 		= 1750;
int    sceneHeight 		= 900;
color  bgColor    		= #FCFCFC;

//********************* DotLine Settings ***********************//

ArrayList<DotWave> dws;
int numWaves 			= 3;

IntRange 	numDots		= new IntRange(50, 1, 300, 1, true);
FloatRange 	angle 		= new FloatRange(0, 0, TWO_PI, 0.01, true);
IntRange 	mode 		= new IntRange(3, 0, new Ease().METHODS.length-1, 1, true);

boolean updatePolygon 	= true;

PFont font;
String title 			= "DOT SYSTEM v04.";
String description		= "DOTS DISTRIBUTION ALONG SINUS WAVE LINE USING EASING.";

void settings() {
	size(sceneWidth,sceneHeight,P3D);
}

void setup(){
	background(bgColor);
	smooth();

	font = createFont("Arial", 14);
	textFont(font);

	createWaves();

}


void draw(){

	int nd = (int) map(mouseX, 0, width, numDots.getMinValue(), numDots.getMaxValue());
	float a0 = map(mouseY, 0, height, angle.getMinValue(), angle.getMaxValue());
	if(nd!=numDots.getValue() || a0 !=angle.getValue() || updatePolygon){
		numDots.setValue(nd);
		angle.setValue(a0);
		updatePolygon = false;
		createWaves();

		background(bgColor);
		for(DotWave dw : dws){
			dw.display(true, true, true);
		}
		displayInfo(60, 60, 20);
	}

}

void createWaves(){
	float stepY = 200;
	dws = new ArrayList<DotWave>();
	for(int i=0; i<numWaves; i++){
		PVector start = new PVector(0, height/4 + stepY*i +stepY/2);
		PVector end = new PVector(width, height/4 + stepY*i );
		DotWave dw = createDotWave(numDots.getValue(), start, end, 100, angle.getValue());
		dws.add(dw);
	}
}

DotWave createDotWave(int n, PVector a, PVector b, float amp, float a0){
	DotWave dw = new DotWave(a, b, amp);
	dw.setDots(n, a0, mode.getValue());
	return dw;
}


void displayInfo(float x, float y, float stepY){
	textAlign(LEFT); fill(0);
	text(title, x, y);
	text(description, x, y + stepY);
	text("EASING: "+new Ease().METHODS[mode.getValue()]+".", x, y + stepY*2);
	text("NUM DOTS: "+numDots+".", x, y + stepY*3);
	text("ANGLE: "+angle+".", x, y + stepY*4);
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
