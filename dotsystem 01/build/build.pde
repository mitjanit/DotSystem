
//********************** Basic Settings ***********************//

int    sceneWidth   = 1750;
int    sceneHeight  = 900;
color  bgColor    = #FCFCFC;

//********************* DotLine Settings ***********************//
ArrayList<DotLine> dls;

int numDots = 10;
int minNumDots = 5;
int maxNumDots = 50;
float colX = 60;
float startY = 50;
float stepY = 60;
float lineLength = 600;

PFont font;
String description="DOT SYSTEM v01.\nDOTS DISTRIBUTION ALONG LINE USING EASING FUNCTIONS.";

void settings() {
	size(sceneWidth,sceneHeight,P2D);
}

void setup(){
	background(bgColor);
	createAllEasing();
	displayAllEasing();

	font = createFont("Arial", 14);
	textFont(font);
}


void draw(){
	int nd = (int)map(mouseX, 0, width, minNumDots, maxNumDots);
	if(nd!=numDots){
		numDots = nd;
		background(bgColor);
		createAllEasing();
		displayAllEasing();
		displayInfo();
	}
}

void createAllEasing(){
	
	dls = new ArrayList<DotLine>();

	int numCol = 1;
	int j=0;
	for(int i=0; i<Ease.METHODS.length-6; i++){
		float y = startY + stepY*j;
		float x = colX + (4*colX + lineLength)*(numCol-1);
		float xt = x + lineLength + colX;
		fill(0);
		text (Ease.METHODS[i], xt, y);
		DotLine dl = new DotLine(new PVector(x, y), new PVector(x+lineLength, y));
		dl.setDots(numDots, i);
		dls.add(dl);
		j++;
		if(y>=height-3*startY){
			j=1; numCol++;
		}
	}
}

void displayAllEasing(){
	for(int i=0; i<dls.size(); i++){
		dls.get(i).display(true, true);
		if(i>0 && i%3==1){
			displayGroup(i, i+2);
		}
	}
}

void displayInfo(){
	textAlign(LEFT, CENTER);
	text(description+"\nNUM DOTS: "+numDots+".", colX, height - stepY);
}

void displayGroup(int i, int j){
	PVector a = dls.get(i).b;
	PVector b = dls.get(j).b;
	stroke(100); strokeWeight(1);
	line(a.x + colX/4, a.y, a.x + colX/2, a.y);
	line(a.x + colX/2, a.y, b.x + colX/2, b.y);
	line(b.x + colX/4, b.y, b.x + colX/2, b.y);
}

void keyPressed(){
	if(key=='p'){
		saveFrame("frame/dotsystem01-######.png");
	}
}