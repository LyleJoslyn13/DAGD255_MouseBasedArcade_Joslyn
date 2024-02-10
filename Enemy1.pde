class Enemy1 extends RadialObject { 

  PImage enemySprite2;
  float bulletTimer = random(3, 5);


  float gameTime = 0;
  int gTime = 0;
  
  Enemy1() {
    position = new PVector();
    position.x = -radius; 
    position.y = random(100, height-350);
    
    radius = 25;
    
    velocity = new PVector(random(100, 200), 0);
       
    enemySprite2 = loadImage("pixil-frame-2.png");
  }
  
  void update() {
    
    gameTime += dt;
    gTime = floor(gameTime);
    
    position.x += velocity.x * dt;
    position.y += velocity.y * dt;
    
    bulletTimer -= dt;        // Spawn enemy code //
    if (bulletTimer <= 0) {
     calcAngle(position.x, 0); 
     Rocket r = new Rocket(position.x, position.y + radius*2, -angle); 
     scenePlay.rockets.add(r);
    
    if(position.x >= width + radius) isDead = true;
    bulletTimer = random(4, 5);
    }
  }
  
  void draw() {
    fill(#FF74B0);
    // how to set sprite with collision
    // rect(position.x - radius, position.y - radius, radius*2, radius*2);
    //ellipse(position.x, position.y, radius*2, radius*2);
    image(enemySprite2, position.x-radius, position.y-radius);
    
  }
  
}
