
public static class Ease {
	
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

}