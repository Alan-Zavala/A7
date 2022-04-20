// This parent class should also be used to create classes for powerups

class Ship {
  PVector pos;
  int health;
  PVector hurtboxDim;
  boolean alive;
  
  Ship(float posX, float posY, int health, float hurtX, float hurtY) {
    pos = new PVector(posX, posY);
    this.health = health;
    hurtboxDim = new PVector(hurtX, hurtY);
    alive = true;
  }
  
  void move(int x, int y) {
    pos.x += x;
    pos.y += y;
  }
}
