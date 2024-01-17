float dt;
float prevTime;
Player player;

// setup for window *** class on 1/10 //
void setup(){          // This Function is called upon launch, and is called only once. //
  size(1280, 720);    // Sets the size of the window // 
  player = new Player();
}

void draw() {         // This function is  called every time. // 
  
  // CALCULATE DELTA TIME
  calcDeltaTime();
  background(128);   // Sets the background color for the window //

  
  // SPAWN OBJECTS UNDER THIS LINE // 
  
  
  
  // UPDATE ALL OBJECTS UNDER THIS LINE
  player.update();
  
  
  // DRAW ALL OBJECTS UNDER THIS LINE
  player.draw();
  
  
  // PREP FOR NEXT FRAME UNDER THIS LINE
}



void calcDeltaTime() {
  float currTime = millis();
  dt = (currTime - prevTime) / 1000.0;
  prevTime = currTime; 
}
