class RadialObject {  // Declares a new class //
  
  PVector position;
  PVector velocity;
  float radius;
  boolean isDead;
  
  RadialObject() {    // Declares a new function //
  
  }
  
  void update() { // Logical and Artithmetic updates happen in this function // 
  
  }
  
  void draw() {   // Graphical updates happen in this function //
  
  }
  
  boolean checkCollision(RadialObject other) {       // pythagorean theorem in code (see discord chatroom: course-discussion) //
    float dx = other.position.x - position.x;
    float dy = other.position.y - position.y;
    float dis = sqrt(dx * dx + dy * dy);
    if(dis <= radius + other.radius) return true;
    return false;
    
  }
}
