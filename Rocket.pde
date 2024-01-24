class Rocket extends RadialObject {
  
 Rocket(float x, float y, float angle){
   position = new PVector(x, y);
   radius = 8;
   
   velocity = new PVector(800, 800);
   
   this.angle = angle; // this. calls context to the varibale used in this class, not the parent //
 }
 
 void update() {
   
    position.x += velocity.x *cos(angle) * dt; // refer to discord chat "course-discussion for angle math //
    position.y += velocity.y *sin(angle) * dt;
   
    if(position.x > width + radius || position.x < - radius || position.y >height + radius || position.y < -radius) {
      isDead = true;
    }
   
 }
 
 void draw() {
   fill(#FFD917);
   ellipse(position.x, position.y, radius*2, radius*2);
  
 }
  
}
