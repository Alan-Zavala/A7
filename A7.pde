Player player;
Enemy enemy;
int time;
PFont pixels;
Timer timer;
stat_laser lz;
ArrayList<Laser> laserz;
boolean beg = false;
boolean first = true;

void setup() {
  time = 30;
  pixels = createFont("pixels.ttf", 32);
  timer = new Timer(1000);

  // player and enemy initialization
  player = new Player(100, 400, 3);
  player.load();
  enemy = new Enemy(100, 100, 1);
  enemy.load();

  // adding one laser into array, can add based on player and AI actions
  laserz = new ArrayList<Laser>();
  PVector pos = new PVector(100, 50);
  PVector sp = new PVector(0, 2);
  color c = color(255, 100, 0);
  //lz new stat_laser(pos, sp, c);
  //lasz.add(lz);

  size(500, 500);
  background(20);
  
  textFont(pixels);
  textSize(20);
  textAlign(CENTER);
  
  fill(0, 255, 0);
  text("KNOCKOFF GALAGA", width / 2, height / 2 - 80);
  
  textSize(14);
  
  fill(0, 0, 255);
  text("HOW TO PLAY:", width / 2, height / 2 - 40);
  fill(255);
  text("use a and d to move left or right", width / 2, height / 2 - 20);
  text("press space to shoot lasers", width/2, height / 2);
  text("press p to pause", width / 2, height / 2 + 20);
  fill(255, 0, 0);
  text("Press b to begin", width / 2, height / 2 + 80);
}

void displayTime() {
  textFont(pixels);
  textSize(25);
  text(time, 10, 32);
  // reduce time by 1 each second
  if (timer.hasElapsed()) {
    time -= 1;
  }
}

void play() {
  if (player.paused == false) {
    background(20);
    fill(0, 255, 0);
    displayTime();

    fill(255);
    player.control();
    player.display();
    player.shoot(laserz);

    enemy.oscillate();
    enemy.display();
    
    for (Laser ls : laserz) {
      ls.move();
      ls.display();
      if (ls.onScreen == false) {
        laserz.remove(ls);
      }
    }
  }
}

// cannot currently restart at game over, must rerun the program
void gameOverCheck() {
  if (time <= -1) {
    player.paused = true;
    player.dead = true;
    fill(255, 0, 20);
    text("GAME OVER", width / 4, height / 2);
  }
}

void draw() {
  if (keyPressed && key == 'b') {
    beg = true;
  } 

  gameOverCheck();
  player.pause();
  
  if (player.paused == true) {
    fill(255, 0, 0);
    text("paused", width / 2, height / 2 - 20);
    text("press p to resume", width / 2, height / 2 + 20);
  }
  
  if (beg == true) {
    if (first == true) {
      first = false;
      background(0);
    }
    play();
  }
}

// TODO: implement shooting/collision detection, pause
// screen, game over screen
