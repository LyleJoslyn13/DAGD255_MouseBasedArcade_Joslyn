class Player extends RadialObject {  // *extends* code makes RadialObject a parent class // 
  
  float easing = 3;
  float x;
  float y;
  
  Player() {
    radius = 20;  // *radius* is created in parent class // 
    position = new PVector(); // creates a zero vector (0,0) // 
    position.x = width/2;
    position.y = height/2;
  }
  
  void update() {
    
    float dx = mouseX - position.x;
    float dy = mouseY - position.y;
    
    position.x += dx * easing * dt;
    position.y += dy * easing * dt;
    
    //position.x = mouseX; // snaps the mouse cursor to the circle // 
    //position.y = mouseY;
    
    //super.update();  // *super* refers to its parent class of RadialObject //
    //                // this line is a call to the parent class *update()* //
  }
  
  void draw() {
    strokeWeight(3);
    fill(#1FEA86);
    ellipse(position.x, position.y, radius*2, radius*2);
  }
  
}
