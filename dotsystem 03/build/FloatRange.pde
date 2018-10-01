
class FloatRange {
	
	float currentValue;
	float minValue;
	float maxValue;

	float step;
	boolean loop;

	FloatRange(float value, float minv, float maxv, float s, boolean loop){
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

	void setValue(float v){
		this.currentValue = v;
	}

	float getValue(){
		return this.currentValue;
	}

	float getMinValue(){
		return this.minValue;
	}

	float getMaxValue(){
		return this.maxValue;
	}

	@Override
	public String toString(){
		return new Float(currentValue).toString();
	}


}