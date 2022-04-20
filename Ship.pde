// This parent class should also be used to create classes for powerups

class Ship {
  PVector pos;
  int health;
  float hurtX, hurtY;
  boolean alive;
  boolean moveMe;
  
  Ship(float posX, float posY, int health) {
    pos = new PVector(posX, posY);
    this.health = health;
    alive = true;
  }
  
  boolean boundCheck(int x) {
    if (x > 0 && pos.x > width - 63) {
     moveMe = false;
     return moveMe;
    }
    if (x <= 0 && pos.x < 0) {
      moveMe = false;
      return moveMe;
    }
    moveMe = true;
    return moveMe;
  }
  void move(int x) {
    if (boundCheck(x)) {
     pos.x += x; 
    }
  }
}
