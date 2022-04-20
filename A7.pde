Player player;
Enemy enemy;
int time;
PFont pixels;
Timer timer;

void setup() {
  time = 30;

  pixels = createFont("pixels.ttf", 32);
  timer = new Timer(1000);

  player = new Player(100, 400, 3);
  player.load();
  enemy = new Enemy(100, 100, 1);
  enemy.load();

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

void draw() {
  background(20);
  displayTime();

  player.control();
  player.display();

  enemy.oscillate();
  enemy.display();
}

// TODO: implement shooting/collision detection, pause
// screen, game over screen
