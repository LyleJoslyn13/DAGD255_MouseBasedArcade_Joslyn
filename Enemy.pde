class Enemy extends RadialObject { 

  Enemy() {
    position = new PVector();
    position.x = random(width); 
    position.y = -50;
    
    radius = random(25, 50);
    
    velocity = new PVector(0, random(200, 300));
    
  }
  
  void update() {
    
    position.x += velocity.x * dt;
    position.y += velocity.y * dt;
    
    if(position.y >= height + radius) isDead = true;
    
  }
  
  void draw() {
    fill(#FF74B0);
    // how to set sprite with collision
    rect(position.x - radius, position.y - radius, radius*2, radius*2);
    
    
    ellipse(position.x, position.y, radius*2, radius*2);
    
  }
  
}
