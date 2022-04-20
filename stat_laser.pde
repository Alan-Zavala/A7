class stat_laser extends laser {
  PShape s;
  
  stat_laser(PVector pos, PVector sp, color c) {
    super(pos, sp, c);
    s = createShape();
    s.beginShape();
    s.fill(c);
    s.noStroke();
    s.strokeWeight(3);
    s.vertex(pos.x, pos.y);
    s.vertex(pos.x-4, pos.y-10);
    s.vertex(pos.x,pos.y-8);
    s.vertex(pos.x+4,pos.y-10);
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
  
  
}