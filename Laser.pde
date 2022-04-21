class laser {
  PVector pos;
  PVector sp;
  color c;
  boolean onScreen;
  PShape s;
  
  laser(PVector pos, PVector sp, color c) {
    this.pos = pos;
    this.sp = sp;
    this.c = c;
    onScreen = true;
    s = createShape();
    s.beginShape();
    s.fill(c);
    s.noStroke();
    s.strokeWeight(3);
    s.vertex(pos.x, pos.y);
    s.vertex(pos.x-4, pos.y+10);
    s.vertex(pos.x,pos.y+8);
    s.vertex(pos.x+4,pos.y+10);
    s.endShape(CLOSE);
  }
  
  void display() {
    fill(c);
    shape(s);
  }
  
  void move() {
    pos.x += sp.x;
    pos.y += sp.y;
    s.translate(sp.x, sp.y);
  }
  
  void ifOffScreen() {
    if (pos.x <0 || pos.x>width || pos.y > height) {
      onScreen = false; 
    }
  }
}
