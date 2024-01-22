float dt;
float prevTime;
Player player;

ArrayList<Enemy> enemies = new ArrayList();
float enemySpawnCD = 2;

float gameTime = 0;

// setup for window //
void setup(){          // This Function is called upon launch, and is called only once. //
  size(1280, 720);    // Sets the size of the window // 
  player = new Player();
}

void draw() {         // This function is  called every time. // 
  
  // CALCULATE DELTA TIME
  calcDeltaTime();
  background(128);   // Sets the background color for the window //
  
  gameTime += dt;
  int gTime = floor(gameTime);      // floor() rounds down, ceil() rounds up, round() rounds to closest value //


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
   
   if(e.checkCollision(player)) {
     e.isDead = true;
   }
   
   if(e.isDead) enemies.remove(i);              // checks if any enemy in the arraylist is dead //
  }
  
  
  player.update(); // ALWAYS UPDATE PLAYER LAST!!!!! //
 
  
  // DRAW ALL OBJECTS UNDER THIS LINE

  for(int i = 0; i < enemies.size(); i++) {      
   Enemy e = enemies.get(i);
   e.draw();
   
  }
  
  player.draw();    // ALWAYS UPDATE PLAYER LAST!!!!! //
  
  textSize(20);
  text("Game Time: " + gTime, width/2, 50);
  
  // PREP FOR NEXT FRAME UNDER THIS LINE
  
}



void calcDeltaTime() {                  
  float currTime = millis();
  dt = (currTime - prevTime) / 1000.0;
  prevTime = currTime; 
}
