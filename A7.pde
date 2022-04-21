Player player;
Enemy enemy;
int time;
PFont pixels;
Timer timer;
stat_laser lz;
ArrayList<stat_laser> laserz;

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
  laserz = new ArrayList<stat_laser>();
  PVector pos = new PVector(100, 50);
  PVector sp = new PVector(0, 2);
  color c = color(255, 100, 0);
  lz = new stat_laser(pos, sp, c);
  laserz.add(lz);

  size(500, 500);
  background(20);
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

    enemy.oscillate();
    enemy.display();
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
  gameOverCheck();
  player.pause();
  play();
}

// TODO: implement shooting/collision detection, pause
// screen, game over screen
