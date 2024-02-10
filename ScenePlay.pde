// this class defines a "Play" scene
class ScenePlay {

  Player player;
  

  ArrayList<Rocket> rockets = new ArrayList();
  ArrayList<Enemy> enemies = new ArrayList();
  ArrayList<Enemy1> enemies1 = new ArrayList();
  ArrayList<Enemy2> enemies2 = new ArrayList();
  ArrayList<Particle> particles = new ArrayList();
  ArrayList<PowerUp> powerUps = new ArrayList(); 

  float enemySpawnCD = 3.5;
  float powerUpSpawnCD = 5;      //random(15, 25);

  float gameTime = 0;
  int gTime = 0;
  
  int enemyType = (int)random(0, 3);

  ScenePlay() {
    player = new Player();
  }

  void update() {
    gameTime += dt;
    gTime = floor(gameTime);      // floor() rounds down, ceil() rounds up, round() rounds to closest value //


    // SPAWN OBJECTS UNDER THIS LINE //

    enemySpawnCD -= dt;        // Spawn enemy code //
    if (enemySpawnCD <= 0) {
      if(enemyType == 0) {
        Enemy e = new Enemy();
        enemies.add(e);
        enemySpawnCD = random(1, 4);
        enemyType = (int)random(0, 3);
      }
      else if (enemyType == 1) {
        Enemy1 e1 = new Enemy1();
        enemies1.add(e1);
        enemySpawnCD = random(1, 4);
        enemyType = (int)random(0, 3);
      }
      else if (enemyType == 2) {
        Enemy2 e2 = new Enemy2();
        enemies2.add(e2);
        enemySpawnCD = random(1, 4);
        enemyType = (int)random(0, 3);
      }
  }
    
    powerUpSpawnCD -= dt;        // Spawn powerup code //
    if (powerUpSpawnCD <= 0) {
      PowerUp pu = new PowerUp();
      powerUps.add(pu);
      powerUpSpawnCD = random(5, 7);
    }
    

    // UPDATE ALL OBJECTS UNDER THIS LINE
    
    for (int i = 0; i <powerUps.size(); i++) {
      PowerUp pu = powerUps.get(i);
      pu.update();
      
      if(pu.checkCollision(player)){
         if(pu.powerType == 0) {
           player.powerUp1 = true;
          }
         else if(pu.powerType == 1) {
           for (int k = 0; k < enemies.size(); k++) {
             Enemy e = enemies.get(k);
             e.isDead = true;
           }
           for (int k = 0; k < enemies1.size(); k++) {
             Enemy1 e1 = enemies1.get(k);
             e1.isDead = true;
           }
           for (int k = 0; k < enemies2.size(); k++) {
             Enemy2 e2 = enemies2.get(k);
             e2.isDead = true;
           }
          }
         else if(pu.powerType == 2) {
           player.radiusChange = 25;
           player.playerSprite.resize(50,50);
          }
 
       pu.isDead = true;
       PowerUp.play();
       PowerUp.rewind();
     }
     if (pu.isDead) powerUps.remove(i);
    }

    for (int i = 0; i < enemies.size(); i++) {      // updates enemy information //
      Enemy e = enemies.get(i);
      e.update();

      if (e.checkCollision(player)) {              // player death by collision by enemy //
        e.isDead = true;
        switchToGameOver();
        Death.play();
        Death.rewind();
      }

      if (e.isDead) enemies.remove(i);              // checks if any enemy in the arraylist is dead //
    }

     for (int i = 0; i < enemies1.size(); i++) {      // updates enemy1 information //
      Enemy1 e1 = enemies1.get(i);
      e1.update();

      if (e1.isDead) enemies1.remove(i);              // checks if any enemy1 in the arraylist is dead //
    }
    
    for (int i = 0; i < enemies2.size(); i++) {      // updates enemy2 information //
      Enemy2 e2 = enemies2.get(i);
      e2.update();

      if (e2.isDead) enemies2.remove(i);              // checks if any enemy2 in the arraylist is dead //
    }

    for (int i = 0; i < rockets.size(); i++) {
      Rocket r = rockets.get(i);
      r.update();

      for (int j = 0; j < enemies.size(); j++) {

        if (r.checkCollision(enemies.get(j))) {    // Collision code for rocket with enemies //
          r.isDead = true;
          enemies.get(j).isDead = true;
          
           int numParticles = (int)random(25,50);
            for(int k = 0; k< numParticles; k++) {
              Particle p = new Particle(r.position.x, r.position.y);
              p.angle = radians(random(359));
              p.velocity = new PVector(random(300,500), random(300, 500));
              p.friction = 0.98;
              particles.add(p);
          }
        }
      }
      
      for (int j = 0; j < enemies1.size(); j++) {

        if (r.checkCollision(enemies1.get(j))) {    // Collision code for rocket with enemies1 //
          r.isDead = true;
          enemies1.get(j).isDead = true;
          
           int numParticles = (int)random(25,50);
            for(int k = 0; k< numParticles; k++) {
              Particle p = new Particle(r.position.x, r.position.y);
              p.angle = radians(random(359));
              p.velocity = new PVector(random(300,500), random(300, 500));
              p.friction = 0.98;
              particles.add(p);
          }
        }
        
        if (r.checkCollision(player)) {
        r.isDead = true;
        switchToGameOver();
        Death.play();
        Death.rewind();
      }
      }
      
      for (int j = 0; j < enemies2.size(); j++) {

        if (r.checkCollision(enemies2.get(j))) {    // Collision code for rocket with enemies2 //
          r.isDead = true;
          enemies2.get(j).isDead = true;
          
           int numParticles = (int)random(25,50);
            for(int k = 0; k< numParticles; k++) {
              Particle p = new Particle(r.position.x, r.position.y);
              p.angle = radians(random(359));
              p.velocity = new PVector(random(300,500), random(300, 500));
              p.friction = 0.98;
              particles.add(p);
          }
        }
      }

      if (r.isDead) rockets.remove(r);
      if (r.checkCollision(player)) {
        r.isDead = true;
        switchToGameOver();
        Death.play();
        Death.rewind();
      }
    }

    for (int i = 0; i < rockets.size(); i++) {
      Rocket ra = rockets.get(i);
      ra.update();

      for (int j = 0; j < enemies.size(); j++) {

        if (ra.checkCollision(enemies.get(j))) {    // Collision code for rocket a with enemies //
          ra.isDead = true;
          enemies.get(j).isDead = true;
          
           int numParticles = (int)random(25,50);
            for(int k = 0; k< numParticles; k++) {
              Particle p = new Particle(ra.position.x, ra.position.y);
              p.angle = radians(random(359));
              p.velocity = new PVector(random(300,500), random(300, 500));
              p.friction = 0.98;
              particles.add(p);
          }
        }
      }
      
      for (int j = 0; j < enemies1.size(); j++) {

        if (ra.checkCollision(enemies1.get(j))) {    // Collision code for rocket a with enemies1 //
          ra.isDead = true;
          enemies1.get(j).isDead = true;
          
           int numParticles = (int)random(25,50);
            for(int k = 0; k< numParticles; k++) {
              Particle p = new Particle(ra.position.x, ra.position.y);
              p.angle = radians(random(359));
              p.velocity = new PVector(random(300,500), random(300, 500));
              p.friction = 0.98;
              particles.add(p);
          }
        }
      }
      
      for (int j = 0; j < enemies2.size(); j++) {

        if (ra.checkCollision(enemies2.get(j))) {    // Collision code for rocket a with enemies2 //
          ra.isDead = true;
          enemies2.get(j).isDead = true;
          
           int numParticles = (int)random(25,50);
            for(int k = 0; k< numParticles; k++) {
              Particle p = new Particle(ra.position.x, ra.position.y);
              p.angle = radians(random(359));
              p.velocity = new PVector(random(300,500), random(300, 500));
              p.friction = 0.98;
              particles.add(p);
          }
        }
      }

      if (ra.isDead) rockets.remove(ra);
    }

    for (int i = 0; i < rockets.size(); i++) {
      Rocket rb = rockets.get(i);
      rb.update();

      for (int j = 0; j < enemies.size(); j++) {

        if (rb.checkCollision(enemies.get(j))) {    // Collision code for rocket b with enemies //
          rb.isDead = true;
          enemies.get(j).isDead = true;
          
           int numParticles = (int)random(25,50);
            for(int k = 0; k< numParticles; k++) {
              Particle p = new Particle(rb.position.x, rb.position.y);
              p.angle = radians(random(359));
              p.velocity = new PVector(random(300,500), random(300, 500));
              p.friction = 0.98;
              particles.add(p);
          }
        }
      }
      
      for (int j = 0; j < enemies1.size(); j++) {

        if (rb.checkCollision(enemies1.get(j))) {    // Collision code for rocket b with enemies1 //
          rb.isDead = true;
          enemies1.get(j).isDead = true;
          
           int numParticles = (int)random(25,50);
            for(int k = 0; k< numParticles; k++) {
              Particle p = new Particle(rb.position.x, rb.position.y);
              p.angle = radians(random(359));
              p.velocity = new PVector(random(300,500), random(300, 500));
              p.friction = 0.98;
              particles.add(p);
          }
        }
      }
      
       for (int j = 0; j < enemies2.size(); j++) {

        if (rb.checkCollision(enemies2.get(j))) {    // Collision code for rocket b with enemies2 //
          rb.isDead = true;
          enemies2.get(j).isDead = true;
          
           int numParticles = (int)random(25,50);
            for(int k = 0; k< numParticles; k++) {
              Particle p = new Particle(rb.position.x, rb.position.y);
              p.angle = radians(random(359));
              p.velocity = new PVector(random(300,500), random(300, 500));
              p.friction = 0.98;
              particles.add(p);
          }
        }
      }

      if (rb.isDead) rockets.remove(rb);
    }

 for (int i = 0; i < particles.size(); i++) {      // updates enemy information //
      Particle pa = particles.get(i);
      pa.update();

    if(pa.isDead) particles.remove(pa);
 }
  
    player.update(); // ALWAYS UPDATE PLAYER LAST!!!!! //

    // if(player.health <= 0) switchtoGameOver();
  }

  void draw() {
    // DRAW ALL OBJECTS UNDER THIS LINE

    for (int i = 0; i < enemies.size(); i++) {
      Enemy e = enemies.get(i);
      e.draw();
    }
    
    for (int i = 0; i < enemies1.size(); i++) {
      Enemy1 e1 = enemies1.get(i);
      e1.draw();
    }
    
    for (int i = 0; i < enemies2.size(); i++) {
      Enemy2 e2 = enemies2.get(i);
      e2.draw();
    }

    for (int i = 0; i < rockets.size(); i++) {
      Rocket r = rockets.get(i);
      r.draw();
    }
    
    for (int i = 0; i < rockets.size(); i++) {
      Rocket ra = rockets.get(i);
      ra.draw();
    }
    
    for (int i = 0; i < rockets.size(); i++) {
      Rocket rb = rockets.get(i);
      rb.draw();
    }
    
    for (int i = 0; i < powerUps.size(); i++) {
      PowerUp pu = powerUps.get(i);
      pu.draw();
    }

 for (int i = 0; i < particles.size(); i++) {      // updates enemy information //
      Particle pa = particles.get(i);
      pa.draw();
}
    player.draw();    // ALWAYS UPDATE PLAYER LAST!!!!! //

    textSize(20);
    text("Game Time: " + gTime, width/2, 50);
  
}
}
