class Player extends RadialObject {  // *extends* code makes RadialObject a parent class // 
  
  float easing = 3;
  float x;
  float y;
  boolean powerUp1 = false;
  
  PImage playerSprite;
  
  
  Player() {
    //radius = radiusChange;  // *radius* is created in parent class // 
    position = new PVector(); // creates a zero vector (0,0) // 
    position.x = width/2;
    position.y = 600;
    
    //PLAYER SPRITE HERE 
    playerSprite = loadImage("pixil-frame-0.png");
    playerSprite.resize(100,100);
  }
  
  void update() {
    
    radius = radiusChange;
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
     Rocket r = new Rocket(position.x, position.y - radius*1.5, angle); 
     scenePlay.rockets.add(r);
     if(powerUp1 == true) {                                            
       Rocket ra = new Rocket(position.x + 30, position.y - radius*1.5, angle); 
       scenePlay.rockets.add(ra);
       Rocket rb = new Rocket(position.x - 30, position.y - radius*1.5, angle); 
       scenePlay.rockets.add(rb);
     }
    
      Shoot.play();
      Shoot.rewind();
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
    //ellipse(position.x, position.y, radius*2, radius*2);
    image(playerSprite, position.x-radius,position.y-radius);
  }
}
