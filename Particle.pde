class Particle {
  
  PVector position;
  PVector velocity;
  PVector acceleration;
  
  float angle;                 // Travel Direction //
  float rotateAngle;            // Sprite Angle //
  float rotateSpeed;
  float lifeTime;      // How long the sprite will exist //
  float size;
  
  float r, g, b;        // Aesthetic looks //
  float alpha;
 
  boolean isDead = false;
 
  Particle(float x, float y) {
    position = new PVector(x, y);
    velocity = new PVector(random(-150, 150), - 300);
    
    angle = PI/2; 
    rotateAngle = radians(random(359));
    lifeTime = random(0.5, 1.5);
    alpha = random(128, 255);
    r = g = b = random(200);
    rotateSpeed = radians(random(-90, 90));
    size = random(8, 16);
  }
  
  void update() {
    
    lifeTime -= dt;
    if(lifeTime <= 0) isDead = true;
    
    alpha -= 255 * dt;
    
    rotateAngle += rotateSpeed * dt;
    
    position.x += velocity.x * dt;
    position.y += velocity.y * dt;
    
    if(alpha <= 0) isDead = true;
  }
  
  void draw() {
    fill(r, g, b, alpha);
    pushMatrix();
    translate(position.x, position.y);
    rotate(rotateAngle);
    rect(-size/2, -size/2, size, size);
    popMatrix();
    stroke(0);
  }
  
}
