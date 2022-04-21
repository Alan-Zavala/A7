Player player;
Enemy enemy;
int time;
PFont pixels;
Timer timer;
ArrayList<stat_laser> enemy_laserz;
ArrayList<laser> player_laserz;

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
  enemy_laserz = new ArrayList<stat_laser>();
  player_laserz = new ArrayList<laser>();

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
    player.check_hit();

    enemy.oscillate();
    enemy.display();
    enemy.check_hit();
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

void lasers() {
  for (int i = 0; i<player_laserz.size();i++) {
   laser lz = player_laserz.get(i);
   lz.display();
   lz.move();
  }
  for (int i = 0; i<enemy_laserz.size();i++) {
   stat_laser lz = enemy_laserz.get(i);
   lz.display();
   lz.move();}
  
}

void draw() {
  gameOverCheck();
  player.pause();
  play();
  
  for (int i = 0; i<player_laserz.size();i++) {
   laser lz = player_laserz.get(i);
   lz.display();
   lz.move();
  }
}

void keyReleased() {
    if (key == ' ') {
      PVector p = new PVector(player.pos.x+player.hurtX/4, player.pos.y);
      PVector sp = new PVector(0,-3);
      laser lz = new laser(p, sp, color(0,80,255));
      player_laserz.add(lz); 
    }
  }

// TODO: implement shooting/collision detection, pause
// screen, game over screen
