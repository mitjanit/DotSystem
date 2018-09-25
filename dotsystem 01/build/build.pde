
ArrayList<DotLine> dls;

int numDots = 10;
float colX = 60;
float startY = 50;
float stepY = 60;
float lineLength = 600;

String description="DOT SYSTEM v01.\nDOTS DISTRIBUTION ALONG LINE USING EASING FUNCTIONS.";

void setup(){
	size(1750, 900);
	background(255);
	fill(0);

	createAllEasing();
	displayAllEasing();
	//noLoop();

}


void draw(){

	int nd = (int)map(mouseX, 0, width, 3, 50);
	if(nd!=numDots){
		numDots = nd;
		background(255);
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
	}
}

void displayInfo(){
	textSize(14);
	textAlign(LEFT, CENTER);
	text(description+"\nNUM DOTS: "+numDots+".", colX, height - stepY);
}