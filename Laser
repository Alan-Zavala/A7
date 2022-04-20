class laser {
  PVector pos;
  PVector sp;
  color c;
  boolean onScreen;
  
  laser(PVector pos, PVector sp, color c) {
    this.pos = pos;
    this.sp = sp;
    this.c = c;
    onScreen = true;
  }
  
  void display() {
    fill(c);
    ellipse(pos.x, pos.y, 4,4);
    stroke(c);
    line(pos.x-3*sp.x, pos.y-3*sp.y, pos.x, pos.y);
  }
  
  void move() {
  }
  
  void ifOffScreen() {
    if (pos.x <0 || pos.x>width || pos.y > height) {
      onScreen = false; 
    }
  }
}
