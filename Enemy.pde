class Enemy extends RadialObject { 

  int enemyType = 0
  
  Enemy() {
    position = new PVector();
    position.x = random(width); 
    position.y = -50;
    
    radius = 50;
    
    velocity = new PVector(0, random(200, 300));
    
    int rand = (int)random(0, 3);
    enemyType = rand;
    
    //switch(enemyType) {          // changes sprite
//    case 0:
//      img = loadImage();
//      break;
//
//    case 1:
//      img = loadImage();
//      break;

//    case 2:
//      img = loadImage();
//      break;
    
  }
  
  void update() {
    
    position.x += velocity.x * dt;
    position.y += velocity.y * dt;
    
    if(position.y >= height + radius) isDead = true;
    
  }
  
  void draw() {
    fill(#FF74B0);
    // how to set sprite with collision
    // rect(position.x - radius, position.y - radius, radius*2, radius*2);
    ellipse(position.x, position.y, radius*2, radius*2);
    
  }
  
}
