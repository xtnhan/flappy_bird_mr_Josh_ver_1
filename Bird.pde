class Bird {
  float x;
  float y;
  float speedy;
  float s = 35;
  float speedx;

  float r;
  float g;
  float b;
  
  Level lv;
  
  
  int score = 0;

  boolean isAlive;
  boolean isBringback;
  boolean isOver;

  Bird (float xx, float yy, float rr, float gg, float bb) {
    x = xx;
    y = yy;
    r = rr;
    g = gg;
    b = bb;
    isAlive = true;
    isBringback = false;
    isOver = false;
  }

  void draw () {
   
    if (speedy < 0) {
      drawup();
    }
    if (speedy >= 0) {
      drawdown();
    }
    //println(speedy);
  }
  void update() {

    speedy = speedy + gravity;

    y = y + speedy;
    x = x + speedx;

    hitGround(); //Check hitGround true/false
  }

  void flap () {
    speedy -= 13;
    if (speedy <= 55 || speedy >= 55 ) {
      speedy = 0;

      speedy -= 9;
    }
  }

  void drawup () {
    fill(r, g, b);
    circle(x, y, s);
    triangle(x + 10, y, x- 30, y, x - 15, y + 10);
  }
  void drawdown () {
    fill(r, g, b);

    circle(x, y, s);
    triangle(x + 10, y, x- 30, y, x - 15, y - 10);
  }

  boolean hitGround () {

    if (y >= (height-s)) {
      speedy = 5;
      speedy = -speedy; //Bounce up when hit the ground

      return true; //Return true if hit the ground
    }

    return false; //return false if not hit the Ground
  }


  boolean hitPipes (pipes p) {
    if ((x + s/2) >=p.x && (x - s/2) <= (p.x+p.w) && (y + s/2) >= p.y && (y -s/2) <= (p.y + p.h) || 
      (x + s/2)>=p.x && (x-s/2) <= (p.x + p.w) && (y + s/2) >= (p.h + 200) && (y - s/2) <= height  ) {//Top pipe collision detection

      return true;
    }

    return false;
  }
}
