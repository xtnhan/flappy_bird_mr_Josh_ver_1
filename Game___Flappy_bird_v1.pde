Bird b = new Bird (200, 100, 255, 255, 0);
Bird b2 = new Bird (200, 100, 255, 0, 0);
Gameover go = new Gameover ();
//pipes p = new pipes (500);



boolean isGameover = false;



ArrayList<pipes> p = new ArrayList<pipes> ();

float gravity = 0.5;


void setup() {
  size(1000, 500);
  background(51, 204, 255);
  
  
  for (float x = 0; x <= 2000; x+= 500) {
    p.add (new pipes (x));
    println(x);
  }
}

void draw() {     
  background(51, 204, 255);



  b.draw();
  b.update();

  b2.draw();
  b2.update();




  for (pipes pip : p) {
    pip.draw();
    pip.update();
    pip.counter(b);
    pip.counter(b2);


    if (b.hitPipes (pip)) {
      b.speedx = -15;      
      b.speedy = 15;
      b.isAlive = false;
      b.isBringback = true;
    }
    if ( b2.hitPipes (pip)) {

      b2.speedx = -15;    
      b2.speedy = 15;
      b2.isAlive = false;
      b2.isBringback = true;
    }

    if (b.isOver && b2.isOver) { //Game over when both birds die
      pip.dx = 0;
      isGameover = true;
    }


    if (b.hitGround()) { //Hit ground => die
      b.isAlive = false;
      b.speedx = -pip.dx;
    }
    if (b2.hitGround()) {//Hit ground => die
      b2.isAlive = false;
      b2.speedx = -pip.dx;
    }
  }


  if (isGameover == false) {

    textSize(20);
    textAlign(LEFT);
    fill(0, 0, 0);
    if (b.isAlive == true) {    

      text("Player 1's score: " + b.score, 200, 50);
    } else {

      if (b.score >=50) {    
        text("You died!! Press'+' to revive! Need 50 points!", 200, 50);
      } else {
        text("GAME OVER!", 200, 50);
        b.isOver = true;
      }
    }

    if (b2.isAlive == true) {    

      text("Player 2's score: " + b2.score, 200, 80);
    } else {

      if (b2.score >=50) {    
        text("You died!! Press'-' to revive! Need 50 points!", 200, 80);
      } else {
        text("GAME OVER!", 200, 80);
        b2.isOver = true;
      }
    }
  } else {

    go.draw();
  }
}

void keyPressed () {
  if (key == ' ') {
    b.flap();
  }
  if (key == '3') {
    b2.flap();
  }

  if (key == '+' && b.isOver == false && b.isAlive == false) {
    b.isBringback = true;
    b.isAlive = true;
    b.speedx = 0;
    b.speedy = 0;

    b.x = 100;
    b.y = 100;

    b.score = b.score -50;
  }

  if (key == '-' && b2.isOver == false && b2.isAlive == false) {
    b2.isBringback = true;
    b2.isAlive = true;
    b2.speedx = 0;
    b2.speedy = 0;

    b2.x = 100;
    b2.y = 100;

    b2.score = b2.score -50;
  }
}
