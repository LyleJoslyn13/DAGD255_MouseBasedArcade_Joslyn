import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// This program plays a mouse based arcade game. //
// Copyright Lyle Joslyn 2024 //
// Left Click - 
// Right Click - 

// create a variable to hold each scene:
SceneTitle sceneTitle;
ScenePlay scenePlay;
SceneGameOver sceneGameOver;

Minim minim

float dt;
float prevTime;

boolean leftPressed, pLeftPressed;
boolean rightPressed, pRightPressed;

// setup for window //
void setup(){          // This Function is called upon launch, and is called only once. //
  size(1280, 720);    // Sets the size of the window // 
  switchToTitle();
  minim = new Minim(this);
}

void draw() {         // This function is  called every frame. // 
  
  // CALCULATE DELTA TIME
  calcDeltaTime();
  background(128);   // Sets the background color for the window //
 
    // update and draw any active scenes:
  
  if(sceneTitle != null){
    sceneTitle.update();
    if(sceneTitle != null) sceneTitle.draw(); // this extra if statement exists because the sceneTitle.update() might result in the scene switching...
  }
  else if(scenePlay != null){
    scenePlay.update();
    if(scenePlay != null) scenePlay.draw(); // this extra if statement exists because the scenePlay.update() might result in the scene switching...
  }
  else if(sceneGameOver != null){
    sceneGameOver.update();
    if(sceneGameOver != null) sceneGameOver.draw(); // this extra if statement exists because the sceneGameOver.update() might result in the scene switching...
  }

 // PREP FOR NEXT FRAME UNDER THIS LINE
    pLeftPressed = leftPressed;
    pRightPressed = rightPressed;

}
  void mousePressed() {
    if(mouseButton == LEFT) leftPressed = true;
    if(mouseButton == RIGHT) rightPressed = true;
  }
  
  void mouseReleased() {
    if(mouseButton == LEFT) leftPressed = false;
    if(mouseButton == RIGHT) rightPressed = false;
  }


void calcDeltaTime() {                  
  float currTime = millis();
  dt = (currTime - prevTime) / 1000.0;
  prevTime = currTime; 
}

void switchToTitle(){                      // setting the scene to title screen //
  sceneTitle = new SceneTitle();
  scenePlay = null;
  sceneGameOver = null;
}
void switchToPlay(){                      // setting the scene to Gameplay screen //
  scenePlay = new ScenePlay();
  sceneTitle = null;
  sceneGameOver = null;
}
void switchToGameOver(){
  sceneGameOver = new SceneGameOver();
  scenePlay = null;
  sceneTitle = null;
}
