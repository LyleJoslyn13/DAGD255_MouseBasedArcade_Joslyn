class Enemy extends RadialObject { 

  
  PImage enemySprite1;
  PImage enemySprite2;
  
  
  
  Enemy() {
    position = new PVector();
    position.x = random(width); 
    position.y = -radius;
    
    radius = 50;
    
    velocity = new PVector(0, random(200, 300));
    
    // SEE ATTACHED FILE ON ENEMY TYPES 
    
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
    
    
    enemySprite1 = loadImage("pixil-frame-1.png");
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
    
    image(enemySprite1, position.x-50, position.y-45);
    
  }
  
}
