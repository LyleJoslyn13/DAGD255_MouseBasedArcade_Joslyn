class PowerUp extends RadialObject { 
  
  int powerType;
  
  PowerUp() { 
    position = new PVector();
    position.x = random(width); 
    position.y = -50;
    
    radius = 25;
    
    velocity = new PVector(0, random(50, 200));
    
    int rand = (int)random(0, 3);
    powerType = rand;
    
//switch(powerType) {          // changes sprite
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
    if(powerType == 0){
      fill(#FFFF00);
    }
    else if(powerType == 1){
      fill(#00ff00);
    }
    else if(powerType == 2){
    fill(#0000FF);
    }
    ellipse(position.x, position.y, radius*2, radius*2);
  }
}
