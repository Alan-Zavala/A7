class Enemy extends Ship {
  PShape enemyShape;
  boolean alive;
  float speed;
  
  Enemy(float posX, float posY, int health) {
   super(posX, posY, health); 
  }
  
  void load() {
    // assign a random speed
    speed = random(1, 7);
    enemyShape = loadShape("galaga.svg");
    // initialize variables
    hurtX = enemyShape.width;
    hurtY = enemyShape.height;
    alive = true;
    //scale
    enemyShape.disableStyle();
    enemyShape.rotate(PI);
    enemyShape.scale(0.5);
  }
  
  void oscillate() {
    if (boundCheck(speed, 0) == false) {
      speed *= -1;
    }
    move(speed, 0);
  }
  
  void display() {
   if (alive) {
     shape(enemyShape, pos.x, pos.y);
   }
  }
}
