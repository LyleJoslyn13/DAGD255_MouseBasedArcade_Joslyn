// this class defines a "Game Over" scene
class SceneGameOver {
  SceneGameOver(){
    
  }
  
  void update(){
    if(rightPressed) {
      switchToPlay();
    }
  }
  
  void draw(){
    background(#972020);
    textAlign(CENTER, CENTER);
    fill(#FFFFFF);
    text("GAME OVER", width/2, height/2);
    text("Click to Try Again", width/2 + 20, height/2 + 20);
  }
  

}
