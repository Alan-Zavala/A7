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
  
  boolean boundCheck(float x, float bound) {
    if (x > 0 && pos.x > width - bound) {
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
  void move(float x, float bound) {
    if (boundCheck(x, bound)) {
     pos.x += x; 
    }
  }
}
