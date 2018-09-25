
class IntRange {
	
	int currentValue;
	int minValue;
	int maxValue;

	int step;
	boolean loop;

	IntRange(int value, int minv, int maxv, int s, boolean loop){
		this.currentValue = value;
		this.minValue = minv;
		this.maxValue = maxv;
		this.step = s;
		this.loop = loop;
	}

	void next(){
		this.currentValue += this.step;
		if(this.currentValue>this.maxValue){
			if(this.loop){
				this.currentValue = this.minValue;
			}
			else {
				this.currentValue = this.maxValue;
			}
		}
	}

	void previous(){
		this.currentValue -= this.step;
		if(this.currentValue<this.minValue){
			if(this.loop){
				this.currentValue = this.maxValue;
			}
			else {
				this.currentValue = this.minValue;
			}
		}
	}

	void setValue(int v){
		this.currentValue = v;
	}

	int getValue(){
		return this.currentValue;
	}

	int getMinValue(){
		return this.minValue;
	}

	int getMaxValue(){
		return this.maxValue;
	}


}