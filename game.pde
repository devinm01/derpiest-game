void game() {
  background(white);


  //ball
  strokeWeight(6);
  stroke(bblack);
  fill(green);
  circle(bx, by, bd);

  //line
  strokeWeight(7);
  stroke(0, 0, 255);
  line(px, py, px2, py2);


  //player 1
  strokeWeight(5);
  stroke(black);
  fill(white);
  circle(px, py, pd);
  circle(px2, py2, pd2);

  //ball movement
  bx = bx + vx;
  by = by + vy;

  //bouncing code
  if (by <= 0) { //top
    vy = -vy;
    by = 0;
  }
  if (by >= height) {
    vy = -vy;
    by = height;
  }

  if (bx <= 0) {
    vx = -vx;
    bx = 0;
  }
  if (bx >= width) {
    vx = -vx;
    bx = width;
  }

  // b bouncing off player
  if ( dist(px, py, bx, by) <= pd/2 + bd/2) {
    vx = (bx - px)/5;
    vy = (by - py)/5;
  }

  if ( dist(px2, py2, bx, by) <= pd2/2 + bd/2) {
    vx = (bx - px2)/5;
    vy = (by - py2)/5;
  }

  float maxdist = 350;

  //movement
  if ( dist(px, py, px2, py2) <= maxdist) {
    if (wKey) py -= 5;
    if (sKey) py += 5;
    if (aKey) px -= 5;
    if (dKey) px += 5;

    if (upKey) py2 -= 5;
    if (downKey) py2 += 5;
    if (leftKey) px2 -= 5;
    if (rightKey) px2 += 5;
  } else {
    px = px + (px2-px)/150;
    py = py + (py2-py)/150;
    px2 = px2 + (px-px2)/150;
    py2 = py2 + (py-py2)/150;
  }

  fill(0);
  textSize(40);
  text("score", 475, 45);
  text(score, 550, 45);


  if (scorecooldown > 0) {
    scorecooldown = scorecooldown - 1;
  }
  color c = get((int)bx, (int)by);
  if (c == blue && scorecooldown == 0) {
    score += 1;
    println("?");
    scorecooldown = 30;
  }
  
  
  //spawning red ball
  if (score == 10 && !ball2) {
    bx2 = random(50, width - 50);
    by2 = random(50, height - 50);
    bvx = random(-3, 3);
    bvy = random(-3, 3);
    bd2 = 50;
    ball2 = true;
  }

  if (ball2) {
    bx2 = bx2 + bvx;
    by2 = by2 + bvy;

    //boucne
    if (by2 <= 0) { //top
      bvy = -bvy;
      by2 = 0;
    }
    if (by2 >= height) {
      bvy = -bvy;
      by2 = height;
    }

    if (bx2 <= 0) {
      bvx = -bvx;
      bx2 = 0;
    }
    if (bx2 >= width) {
      bvx = -bvx;
      bx2 = width;
    }

    if ( dist(px, py, bx2, by2) <= pd/2 + bd2/2) {
      bvx = (bx2 - px)/5;
      bvy = (by2 - py)/5;
    }

    if ( dist(px2, py2, bx2, by2) <= pd2/2 + bd2/2) {
      bvx = (bx2 - px2)/5;
      bvy = (by2 - py2)/5;
    }

    stroke(0);
    fill(red);
    strokeWeight(3);
    circle(bx2, by2, bd2);

    color y = get((int)bx2, (int)by2);
    if (y == blue) {
      mode = GAMEOVER;
      println("!!!");
    }
  }
}

void gameclicks() {
  mode = PAUSE;
}
