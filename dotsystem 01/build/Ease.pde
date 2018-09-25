// Easing 
// Based on https://gist.github.com/gre/1650294

public static class Ease {

	public static String METHODS[] = {"LINEAR", 
									  "INQUAD", "OUTQUAD", "INOUTQUAD", 
									  "INSINE", "OUTSINE", "INOUTSINE",
									  "INCUBIC", "OUTCUBIC", "INOUTCUBIC",
									  "INQUART", "OUTQUART", "INOUTQUART",
									  "INQUINT", "OUTQUINT", "INOUTQUINT",
									  "INEXPO", "OUTEXPO", "INOUTEXPO",
									  "INCIRC", "OUTCIRC", "INOUTCIRC",
									  "INBOUNCE", "OUTBOUNCE", "INOUTBOUNCE",
									  "INELASTIC", "OUTELASTIC", "INOUTELASTIC",
									  "INBACK", "OUTBACK", "INOUTBACK"
									};
	//EQUI
	public static final int LINEAR 		= 0;

	// QUAD
	public static final int INQUAD 		= 1;
	public static final int OUTQUAD 	= 2;
	public static final int INOUTQUAD 	= 3;

	// SINE
	public static final int INSINE 		= 4;
	public static final int OUTSINE 	= 5;
	public static final int INOUTSINE 	= 6;

	// CUBIC
	public static final int INCUBIC 	= 7;
	public static final int OUTCUBIC 	= 8;
	public static final int INOUTCUBIC 	= 9;

	// QUART
	public static final int INQUART 	= 10;
	public static final int OUTQUART 	= 11;
	public static final int INOUTQUART 	= 12;

	// QUINT
	public static final int INQUINT 	= 13;
	public static final int OUTQUINT 	= 14;
	public static final int INOUTQUINT 	= 15;

	// EXPO
	public static final int INEXPO 		= 16;
	public static final int OUTEXPO 	= 17;
	public static final int INOUTEXPO 	= 18;

	// CIRC
	public static final int INCIRC		= 19;
	public static final int OUTCIRC 	= 20;
	public static final int INOUTCIRC 	= 21;

	// BOUNCE
	public static final int INBOUNCE	= 22;
	public static final int OUTBOUNCE 	= 23;
	public static final int INOUTBOUNCE = 24;

	// ELASTIC
	public static final int INELASTIC	 = 25;
	public static final int OUTELASTIC 	 = 26;
	public static final int INOUTELASTIC = 27;

	// BACK
	public static final int INBACK	 	 = 28;
	public static final int OUTBACK 	 = 29;
	public static final int INOUTBACK 	 = 30;
	

	// EASING FUNCTIONS

	public static float ease(float v, int mode){
		switch(mode){
			case Ease.LINEAR:		return v;
			case Ease.INCUBIC: 		return Ease.inCubic(v);
			case Ease.OUTCUBIC: 	return Ease.outCubic(v);
			case Ease.INOUTCUBIC: 	return Ease.inOutCubic(v);
			case Ease.INQUAD: 		return Ease.inQuad(v);
			case Ease.OUTQUAD: 		return Ease.outQuad(v);
			case Ease.INOUTQUAD: 	return Ease.inOutQuad(v);
			case Ease.INQUART: 		return Ease.inQuart(v);
			case Ease.OUTQUART: 	return Ease.outQuart(v);
			case Ease.INOUTQUART: 	return Ease.inOutQuart(v);
			case Ease.INQUINT: 		return Ease.inQuint(v);
			case Ease.OUTQUINT: 	return Ease.outQuint(v);
			case Ease.INOUTQUINT: 	return Ease.inOutQuint(v);
			case Ease.INEXPO: 		return Ease.inExpo(v);
			case Ease.OUTEXPO: 		return Ease.outExpo(v);
			case Ease.INOUTEXPO: 	return Ease.inOutExpo(v);
			case Ease.INSINE: 		return Ease.inSine(v);
			case Ease.OUTSINE: 		return Ease.outSine(v);
			case Ease.INOUTSINE: 	return Ease.inOutSine(v);
			case Ease.INCIRC: 		return Ease.inCirc(v);
			case Ease.OUTCIRC: 		return Ease.outCirc(v);
			case Ease.INOUTCIRC: 	return Ease.inOutCirc(v);
			case Ease.INBOUNCE: 	return Ease.inBounce(v);
			case Ease.OUTBOUNCE: 	return Ease.outBounce(v);
			case Ease.INOUTBOUNCE: 	return Ease.inOutBounce(v);
			case Ease.INELASTIC: 	return Ease.inElastic(v);
			case Ease.OUTELASTIC: 	return Ease.outElastic(v);
			case Ease.INOUTELASTIC: return Ease.inOutElastic(v);
			case Ease.INBACK: 		return Ease.inBack(v);
			case Ease.OUTBACK: 		return Ease.outBack(v);
			case Ease.INOUTBACK: 	return Ease.inOutBack(v);
			default: return v;
		}
	}

	// Quad Easing (In, Out, In&Out)

	public static float inQuad(float t) {
		return t * t ;
	}

	public static float outQuad(float t) {
		return t * (2 - t) ;
	}

	public static float inOutQuad(float t) {
		return t<0.5 ? 2*t*t : -1+(4-2*t)*t ;
	}

	// Cubic Easing (In, Out, In&Out)
	
	public static float inCubic(float t) {
		return t * t * t ;
	}

	public static float outCubic(float t) {
		return (--t)*t*t+1 ;
	}

	public static float inOutCubic(float t) {
		return t < 0.5 ? 4 * t * t * t : ( t - 1 ) * ( 2 * t - 2 ) * ( 2 * t - 2 ) + 1 ;
	}

	// Quart Easing (In, Out, In&Out)

	public static float inQuart(float t) {
	    return t * t * t * t;
	}

	public static float outQuart(float t) {
	    float t1 = t - 1;
	    return 1 - t1 * t1 * t1 * t1;
	}

	public static float inOutQuart(float t ) {
	    float t1 = t - 1;
	    return t < 0.5 ? 8 * t * t * t * t : 1 - 8 * t1 * t1 * t1 * t1;
	}

	// Quint Easing (In, Out, In&Out)

	public static float inQuint(float t) {
	    return t * t * t * t * t;
	}

	public static float outQuint(float t) {
	    float t1 = t - 1;
	    return 1 + t1 * t1 * t1 * t1 * t1;
	}

	public static float inOutQuint(float t) {
	    float t1 = t - 1;
	    return t < 0.5 ? 16 * t * t * t * t * t : 1 + 16 * t1 * t1 * t1 * t1 * t1;
	}

	// Expo Easing (In, Out, In&Out)

	public static float inExpo(float t) {
	    if(t==0) {
	        return 0;
	    }
	    return pow( 2, 10 * ( t - 1 ) );
	}

	public static float outExpo(float t) {
	    if( t == 1 ) {
	        return 1;
	    }
	    return ( -pow( 2, -10 * t ) + 1 );
	}

	public static float inOutExpo(float t) {
	    if( t == 0 || t == 1 ) {
	        return t;
	    }
	    float scaledTime = t * 2;
	    float scaledTime1 = scaledTime - 1;
	    if( scaledTime < 1 ) {
	        return 0.5 * pow( 2, 10 * ( scaledTime1 ) );
	    }
	    return 0.5 * ( -pow( 2, -10 * scaledTime1 ) + 2 );
	}


	// Sine Easing (In, Out, IN&Out)

	public static float inSine(float t ) {
	    return -1 * cos( t * ( PI / 2 ) ) + 1;
	}

	public static float outSine(float t ) {
	    return sin( t * ( PI / 2 ) );
	}

	public static float inOutSine(float t ) {
	    return -0.5 * ( cos( PI * t ) - 1 );
	}

	// Circ Easing (In, Out, IN&Out)

	public static float inCirc(float t) {
	    float scaledTime = t / 1;
	    return -1 * ( sqrt( 1 - scaledTime * t ) - 1 );
	}

	public static float outCirc(float t) {
		float t1 = t - 1;
	    return sqrt( 1 - t1 * t1 );
	}

	public static float inOutCirc(float t) {
	    float scaledTime = t * 2;
	    float scaledTime1 = scaledTime - 2;
	    if( scaledTime < 1 ) {
	        return -0.5 * ( sqrt( 1 - scaledTime * scaledTime ) - 1 );
	    }
	    return 0.5 * ( sqrt( 1 - scaledTime1 * scaledTime1 ) + 1 );
	}

	// Bounce (In, Out, In&Out)

	public static float inBounce(float t) {
	    return 1 - outBounce( 1 - t );
	}

	public static float outBounce(float t) {
	    float scaledTime = t / 1;
	    if( scaledTime < ( 1 / 2.75 ) ) {
	        return 7.5625 * scaledTime * scaledTime;
	    } else if( scaledTime < ( 2 / 2.75 ) ) {
	        float scaledTime2 = scaledTime - ( 1.5 / 2.75 );
	        return ( 7.5625 * scaledTime2 * scaledTime2 ) + 0.75;
	    } else if( scaledTime < ( 2.5 / 2.75 ) ) {
	        float scaledTime2 = scaledTime - ( 2.25 / 2.75 );
	        return ( 7.5625 * scaledTime2 * scaledTime2 ) + 0.9375;
	    } else {
	        float scaledTime2 = scaledTime - ( 2.625 / 2.75 );
	        return ( 7.5625 * scaledTime2 * scaledTime2 ) + 0.984375;
	    }
	}

	public static float inOutBounce(float t) {
	    if( t < 0.5 ) {
	        return inBounce( t * 2 ) * 0.5;
	    }
	    return ( outBounce( ( t * 2 ) - 1 ) * 0.5 ) + 0.5;
	}


	// Elastic (In, Out, In&Out)

	public static float inElastic( float t) {
		return inElastic(t, 0.7);
	}

	public static float inElastic( float t, float magnitude) {
	    if( t == 0 || t == 1 ) {
	        return t;
	    }

	    float scaledTime = t / 1;
	    float scaledTime1 = scaledTime - 1;

	    float p = 1 - magnitude;
	    float s = p / ( 2 * PI ) * asin( 1 );

	    return -(pow( 2, 10 * scaledTime1 ) * sin( ( scaledTime1 - s ) * ( 2 * PI ) / p ));
	}

	public static float outElastic(float t) {
		return outElastic(t, 0.7);
	}

	public static float outElastic(float t, float magnitude) {
	    float p = 1 - magnitude;
	    float scaledTime = t * 2;

	    if( t == 0 || t == 1 ) {
	        return t;
	    }

	    float s = p / ( 2 * PI ) * asin( 1 );
	    return (pow( 2, -10 * scaledTime ) * sin( ( scaledTime - s ) * ( 2 * PI ) / p )) + 1;
	}

	public static float inOutElastic(float t) {
	    return inOutElastic(t, 0.65);
	}

	public static float inOutElastic(float t, float magnitude) {
	    float p = 1 - magnitude;

	    if( t == 0 || t == 1 ) {
	        return t;
	    }

	    float scaledTime = t * 2;
	    float scaledTime1 = scaledTime - 1;
	    float f = 0.0; 
	    float s = p / ( 2 * PI ) * asin( 1 );

	    if( scaledTime < 1 ) {
	        return -0.5 * (pow( 2, 10 * scaledTime1 ) *sin( ( scaledTime1 - s ) * ( 2 * PI ) / p ));
	    }
	    return (pow( 2, -10 * scaledTime1 ) *sin( ( scaledTime1 - s ) * ( 2 * PI ) / p ) * 0.5) + 1;
	}


	// BACK (In, Out, In&Out)

	public static float inBack(float t) {
		return inBack(t, 1.70158);
	}

	public static float inBack(float t, float magnitude) {
	    return t * t * ( ( magnitude + 1 ) * t - magnitude );
	}

	public static float outBack(float t) {
		return outBack(t, 1.70158);
	}

	public static float outBack(float t, float magnitude) {
	    float scaledTime = ( t / 1 ) - 1;
	    return (scaledTime * scaledTime * ( ( magnitude + 1 ) * scaledTime + magnitude )) + 1;
	}

	public static float inOutBack(float t) {
		return inOutBack(t, 1.70158);
	}

	public static float inOutBack(float t, float magnitude) {
	    float scaledTime = t * 2;
	    float scaledTime2 = scaledTime - 2;
	    float s = magnitude * 1.525;

	    if( scaledTime < 1) {
	        return 0.5 * scaledTime * scaledTime * (( ( s + 1 ) * scaledTime ) - s);
	    }
	    return 0.5 * (scaledTime2 * scaledTime2 * ( ( s + 1 ) * scaledTime2 + s ) + 2);
	}

}