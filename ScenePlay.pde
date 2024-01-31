// this class defines a "Play" scene
class ScenePlay {

  Player player;

  ArrayList<Rocket> rockets = new ArrayList();
  ArrayList<Enemy> enemies = new ArrayList();
  ArrayList<Particle> particles = new ArrayList();

  float enemySpawnCD = 2;

  float gameTime = 0;

  int gTime = 0;

  ScenePlay() {
    player = new Player();
  }

  void update() {
    gameTime += dt;
    gTime = floor(gameTime);      // floor() rounds down, ceil() rounds up, round() rounds to closest value //


    // SPAWN OBJECTS UNDER THIS LINE //

    enemySpawnCD -= dt;        // Spawn enemy code //
    if (enemySpawnCD <= 0) {
      Enemy e = new Enemy();
      enemies.add(e);
      enemySpawnCD = random(0.5, 1);
    }
    
    

    // UPDATE ALL OBJECTS UNDER THIS LINE

    for (int i = 0; i < enemies.size(); i++) {      // updates enemy information //
      Enemy e = enemies.get(i);
      e.update();

      if (e.checkCollision(player)) {
        e.isDead = true;
        switchToGameOver();
      }

      if (e.isDead) enemies.remove(i);              // checks if any enemy in the arraylist is dead //
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

      if (r.isDead) rockets.remove(r);
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

    for (int i = 0; i < rockets.size(); i++) {
      Rocket r = rockets.get(i);
      r.draw();
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
