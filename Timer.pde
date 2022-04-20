class Timer {
 int time;
 int interval;
 int timeElapsed;
 
 Timer(int interval) {
  time = millis();
  this.interval = interval;
  timeElapsed = 0;
 }
 
 boolean hasElapsed() {
   timeElapsed = millis() - time;
  if (timeElapsed > interval) {
    time = millis();
    return true;
  }
  return false;
 }
}
