color white    =#ffffff;
color black    =#000000;
color blue     =#0000ff;
color red      =#FF0000;
color green    =#00FF10;
color bblack   =#0A0A0A;

PFont font;

import processing.sound.*;

//player variables
float px, py, pd, px2, py2, pd2;
float bx, by, bd, bx2, by2, bd2;
float vx, vy, bvx, bvy;
int score;
boolean ball2 = false;
int scorecooldown = 0;

//mode variables
int mode;
final int INTRO    = 1;
final int GAME     = 2;
final int PAUSE    = 3;
final int GAMEOVER = 4;

//keyboard varialbes
boolean wKey, aKey, sKey, dKey, upKey, leftKey, downKey, rightKey;


SoundFile fail, success, music;

void setup() {
  textAlign(CENTER, CENTER);
  
  font = createFont("AgencyFB-Bold-48.vlw", 128);
  textFont(font);
  
  mode = INTRO;

  fail  = new SoundFile(this, "FAILURE.wav");
  music = new SoundFile(this, "MUSIC.mp3");

  size(600, 600, P2D);
  px = width/8;
  py = height/2;
  pd = 60;

  px2 = width-80;
  py2 = height/2;
  pd2 = 60;

  bx = width/2;
  by = height/2;
  bd = 60;

  vx = 2;
  vy = 3;

  //music.loop();

  score = 8;
}

void draw() {

    if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Mode error: " + mode);
  }
}
