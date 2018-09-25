
//********************** Basic Settings ***********************//

int    sceneWidth   	= 1750;
int    sceneHeight  	= 900;
color  bgColor    		= #FCFCFC;

//********************* DotLine Settings ***********************//

DotPolygon dp;

IntRange numVertexs		= new IntRange(4, 3, 12, 1, true);
IntRange numDots		= new IntRange(10, 3, 20, 1, true);
IntRange mode 			= new IntRange(3, 0, new Ease().METHODS.length-1, 1, true);

float angle				= 0;
boolean updatePolygon 	= true;

PFont font;
String title 			= "DOT SYSTEM v02.";
String description		= "DOTS DISTRIBUTION ALONG POLYGON LINE USING EASING FUNCTIONS.";

void settings() {
	size(sceneWidth,sceneHeight,P2D);
}

void setup(){
	background(bgColor);
	smooth();

	font = createFont("Arial", 14);
	textFont(font);

	createDotPolygon(numVertexs.getValue(), new PVector(width/2, height/2), 400, PI/numVertexs.getValue());
}


void draw(){

	int nd = (int) map(mouseX, 0, width, numDots.getMinValue(), numDots.getMaxValue());

	if(nd!=numDots.getValue() || updatePolygon){
		numDots.setValue(nd);
		updatePolygon = false;

		background(bgColor);
		createDotPolygon(numVertexs.getValue(), new PVector(width/2, height/2), 400, angle);
		dp.display(true, true, true);
		displayInfo(60, 60, 20);

		/**/
		for(Dot p : dp.dots){
			for(Dot q : dp.dots){
				stroke(0); strokeWeight(1);
				line(p.pos.x, p.pos.y, q.pos.x, q.pos.y);
			}
		}
		/**/
	}

}

void createDotPolygon(int numV, PVector c, float r, float a0){
	dp = new DotPolygon();
	float angle=a0;
	for(int i=0; i<numV; i++){
		float x = c.x + r*cos(angle);
		float y = c.y + r*sin(angle);
		dp.addVertex(new PVector(x,y));
		angle += TWO_PI/(float)numV;
	}

	dp.setDots(numDots.getValue(), mode.getValue());
}


void displayInfo(float x, float y, float stepY){
	textAlign(LEFT); fill(0);
	text(title, x, y);
	text(description, x, y + stepY);
	text("NUM VERTEXS: "+numVertexs+".", x, y +stepY*2);
	text("NUM DOTS: "+numDots+".", x, y + stepY*3);
	text("EASING MODE: "+new Ease().METHODS[mode.getValue()]+".", x, y + stepY*4);
}


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