class Enemy extends Ship {
  PShape enemyShape;
  boolean alive;
  float speed;
  int time;
  
  Enemy(float posX, float posY, int health) {
   super(posX, posY, health);
  }
  
  void load() {
    // assign a random speed
    speed = random(1, 10);
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
    
    //shotting based on timer
    if (alive == true) {
      float interval = 2500;
      float elapsed = millis() - time;
      if (elapsed > interval) {
        PVector p = new PVector(pos.x, pos.y);
        PVector sp = new PVector(0,2);
        stat_laser lz = new stat_laser(p, sp, color(255,0,0));
        laserz.add(lz);
        elapsed = 0;
        time = millis();
      }
    }
  }
  
  void display() {
   if (alive) {
     shape(enemyShape, pos.x, pos.y);
   }
  }
  
  void check_hit() {
    for (int i = 0; i < laserz.size(); i++) {
      stat_laser lz = laserz.get(i);
      if (lz.pos.x > (pos.x-hurtX) || lz.pos.x < (pos.x+hurtX) || lz.pos.y > (pos.y-hurtY) || lz.pos.y <(pos.y+hurtY)); {
        alive = false; 
      }
    }
  }
}
