stat_laser lz;
ArrayList<stat_laser> laserz;

void setup() {
  size(500, 500);
  background(20);
  
  // adding one laser into array, can add based on player and AI actions
  laserz = new ArrayList<stat_laser>(); //stat for stationary
  PVector pos = new PVector(100,50);
  PVector sp = new PVector(0,2);
  color c = color(255,100,0);
  lz = new stat_laser(pos, sp, c);
  laserz.add(lz);
}

void draw() {
  background(20);
  
  for (int i=0; i<laserz.size();i++) {
     lz = laserz.get(i);
     lz.display();
     lz.move();
     lz.ifOffScreen();
     if (lz.onScreen == false) laserz.remove(lz);
  }
}
