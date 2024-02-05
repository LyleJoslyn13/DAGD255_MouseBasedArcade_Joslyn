class Player extends RadialObject {  // *extends* code makes RadialObject a parent class // 
  
  float easing = 3;
  float x;
  float y;
  
  Player() {
    radius = 20;  // *radius* is created in parent class // 
    position = new PVector(); // creates a zero vector (0,0) // 
    position.x = width/2;
    position.y = 600;
    //PLAYER SPRITE HERE 
  }
  
  void update() {
    
  // easing = leftPressed ? 1 : .1;      // Refer to 1/24 notes //
  //    THIS IS THE SAME CODE /\ /\ /\      \\
  //  if(leftPressed) {
  //    easing = 1;
  //  }
  //  else {
  //   easing = .1;
  // }
    
    if(leftPressed && !pLeftPressed) {
     calcAngle(mouseX, mouseY); 
     Rocket r = new Rocket(position.x, position.y, angle); 
     scenePlay.rockets.add(r);
    }
    
    float dx = mouseX - position.x;
    float dy = mouseY - position.y;
    
    position.x += dx * easing * dt;
    // position.y += dy * easing * dt;
    
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
