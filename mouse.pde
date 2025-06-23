void mouseReleased(){
  if (mode == INTRO){
    introclicks();
  } else if (mode == GAME) {
    gameclicks();
  } else if (mode == PAUSE) {
    pauseclicks();
  } else if (mode == GAMEOVER){
    gameoverclicks();
  }
}  


void keyPressed() {
  if (key == 'w') wKey = true;
  if (key == 'a') aKey = true;
  if (key == 's') sKey = true;
  if (key == 'd') dKey = true;

  if (keyCode == UP) upKey = true;
  if (keyCode == DOWN) downKey = true;
  if (keyCode == LEFT) leftKey = true;
  if (keyCode == RIGHT) rightKey = true;
}

void keyReleased() {
  if (key == 'w') wKey = false;
  if (key == 'a') aKey = false;
  if (key == 's') sKey = false;
  if (key == 'd') dKey = false;

  if (keyCode == UP) upKey = false;
  if (keyCode == DOWN) downKey = false;
  if (keyCode == LEFT) leftKey = false;
  if (keyCode == RIGHT) rightKey = false;
}
