
ArrayList<DotLine> dls;

int numDots = 50;
float colX = 60;
float startY = 50;
float stepY = 60;
float lineLength = 600;

void setup(){
	size(1800, 900);
	background(255);
	fill(0);

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


void draw(){
	for(int i=0; i<dls.size(); i++){
		dls.get(i).display(true, true);
	}
}