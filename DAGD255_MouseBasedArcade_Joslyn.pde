float dt;
float prevTime;
Player player;

ArrayList<Enemy> enemies = new ArrayList();
float enemySpawnCD = 2;

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
  
  enemySpawnCD -= dt;        // Spawn enemy code //
  if(enemySpawnCD <= 0) {
    Enemy e = new Enemy();
    enemies.add(e);
    enemySpawnCD = random(0.5, 1);
  }
  
  // UPDATE ALL OBJECTS UNDER THIS LINE
  
  for(int i = 0; i < enemies.size(); i++) {      // updates enemy information // 
   Enemy e = enemies.get(i);
   e.update();
   
   if(e.isDead) enemies.remove(i);              // checks if any enemy in the arraylist is dead //
  }
  
  
  player.update(); // ALWAYS UPDATE PLAYER LAST!!!!! //
 
  
  // DRAW ALL OBJECTS UNDER THIS LINE
  player.draw();
  
  for(int i = 0; i < enemies.size(); i++) {      // updates enemy information // 
   Enemy e = enemies.get(i);
   e.draw();
   
  }
  
  
  // PREP FOR NEXT FRAME UNDER THIS LINE
}



void calcDeltaTime() {                  
  float currTime = millis();
  dt = (currTime - prevTime) / 1000.0;
  prevTime = currTime; 
}
