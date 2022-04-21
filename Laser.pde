class Laser {
  PVector pos;
  PVector sp;
  color c;
  boolean onScreen;
  
  Laser(PVector pos, color c) {
    this.pos = pos;
    this.c = c;
    onScreen = true;
  }
  
  void display() {
    fill(c);
    ellipse(pos.x + 32, pos.y, 4, 4);
    stroke(c);
    line(pos.x + 32, pos.y + 10, pos.x + 32, pos.y);
  }
  
  void move() {
    pos.y -= 10;
  }
  
  void ifOffScreen() {
    if (pos.x <0 || pos.x>width || pos.y > height) {
      onScreen = false; 
    }
  }
}
