Player player;

void setup() {
  player = new Player(100, 400, 3);
  player.load();
  size(500, 500);
  background(20);
}

void draw() {
  background(20);
  player.control();
  player.display();
}
