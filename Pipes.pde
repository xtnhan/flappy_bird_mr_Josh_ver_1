class pipes {
  float x;
  float y;
  float h;
  float w;
  float dx;


  pipes (float xx) {
    x = xx;
    y = 0;
    h = random(300);
    w = 50;
    dx = 3;
  }

  void draw () {
    fill(0, 204, 0);
    rect (x, y, w, h); 

    //rect ((x + w/2), h, 5, h + 200);//Checkpoint



    rect(x, h+200, w, height -h -200); 
  }
  void update() {
    x -= dx;
    if (x <= -100) {
      x = width + 100;
    } 
    
  }


  void counter (Bird b) {

    if (b.x >= (x + w/2) && b.x <= (x + w/2 + 2.5) && b.y >= h && b.y <= (h+200)) {
      b.score += 10;
    }
  }


}
