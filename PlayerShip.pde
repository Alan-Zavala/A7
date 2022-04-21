class Player extends Ship {
  PShape playerShape;
  boolean paused;
  boolean dead;

  Player(float posX, float posY, int health) {
    super(posX, posY, health);
    paused = false;
  }
 
  void load() {
    playerShape = loadShape("galaga.svg"); 
    // reassign hurtbox dimensions
    hurtX = playerShape.width;
    hurtY = playerShape.height;
    
    //scale
    playerShape.disableStyle();
    playerShape.scale(0.5);
  }

  void control() {
    if (keyPressed && key == 'a') {
      player.move(-5, hurtX / 2);
    }
    else if (keyPressed && key == 'd') {
      player.move(5, hurtX / 2);
    }
  }
  void display() {
    shape(playerShape, pos.x, pos.y);
  }
  
  void shoot() {
    /*
    you can't move and shoot at the same time, but you couldn't
    move and shoot at the same time in Resident Evil 4 and they
    call it a classic
    */
  }
  
  void pause() {
    if (keyPressed && key == 'p' && dead == false) {
      paused = !paused;
      println(paused);
    }
  }
}
