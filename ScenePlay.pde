// this class defines a "Play" scene
class ScenePlay {

  Player player;

  ArrayList<Rocket> rockets = new ArrayList();
  ArrayList<Enemy> enemies = new ArrayList();
  ArrayList<Particle> particlse = new Arraylist();

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
    
    Particle p = newParticle(player.position.x, player.position.y);
    particles.add(p);

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
        }
      }

      if (r.isDead) rockets.remove(r);
    }

 for (int i = 0; i < enemies.size(); i++) {      // updates enemy information //
      Particles pa = articles.get(i);
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

 for (int i = 0; i < enemies.size(); i++) {      // updates enemy information //
      Particles pa = particles.get(i);
      pa.draw();

    player.draw();    // ALWAYS UPDATE PLAYER LAST!!!!! //

    textSize(20);
    text("Game Time: " + gTime, width/2, 50);
  }
}
