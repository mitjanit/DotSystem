class DotBezier extends DotSet {

  //Control points
  PVector c1, c2;
  //Anchor points
  PVector a1, a2;

  public DotBezier(PVector c1, PVector c2, PVector a1, PVector a2){
      super();
      this.c1 = c1; this.c2 = c2;  //control points
      this.a1 = a1; this.a2 = a2;  // anchor points
  }

  void setControl1(float x, float y){
    this.c1 = new PVector(x, y);
  }

  void setControl2(float x, float y){
    this.c2 = new PVector(x, y);
  }

  void setAnchor1(float x, float y){
    this.a1 = new PVector(x, y);
  }

  void setAnchor2(float x, float y){
    this.a2 = new PVector(x, y);
  }

  boolean isControlPoint(PVector p){
    return (p.equals(c1) || p.equals(c2));
  }

  boolean isAnchorPoint(PVector p){
    return (p.equals(a1) || p.equals(a2));
  }

  // Creates a set of num. of dots using an Easing function.
  @Override
  public void setDots(float num, int mode){
    dots = new ArrayList<Dot>();
    for (float i = 0; i < num; i++){
      float t = i / (num-1);
      t = Ease.ease(t, mode);
      float t2 = 1.0 - t;
      float x = t2*t2*t2*a1.x  + 3*t2*t2*t*c1.x + 3*t2*t*t*c2.x  + t*t*t*a2.x;
      float y = t2*t2*t2*a1.y  + 3*t2*t2*t*c1.y + 3*t2*t*t*c2.y  + t*t*t*a2.y;
      addDot(new Dot(new PVector(x, y)));
    }
  }


  void display(boolean showLine, boolean showDots, boolean showCentroid){
    if(showLine){
      displayLine();
    }
    if(showDots){
      displayDots(showCentroid);
    }
  }

  void displayLine(){
    //Control points
    noFill();stroke(0,100);
    ellipse(c1.x,c1.y,10,10);
    ellipse(c2.x,c2.y,10,10);
      
    //Bezier curve
    stroke(255,0,0);
    beginShape();
      vertex(a1.x, a1.y);
      bezierVertex(c1.x, c1.y, c2.x, c2.y, a2.x, a2.y);
    endShape();

    //Lines from Anchor to Control points
    stroke(0,100);
    line(a1.x, a1.y, c1.x, c1.y);
    line(a2.x, a2.y, c2.x, c2.y);
  }
}