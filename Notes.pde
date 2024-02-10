// Vectors hold more than ONE value.
// Scalars are singular values.

// Vectors will hold as many values as there are dimensions.

// 2D-CARTESIAN COORDINATE SPACE
//    If you are using vector to represent a point:
//        x - coordinate
//        y - coordinate
//    If you are using vector to represent size:
//        width - horizontal size
//        height - vertical size

// 2D-POLAR COORDINATE SPACE
//    If you are using vector to represent a point:
//        magnitude - distance from a point
//        angle - direction from a point



// VECTOR AS A POINT - is a single variable
//    x - coordinate - is a single variable
//    y - coordinate - is a single variable


// 2D VECTOR is a STRUCTURE made up of 2 variables


// CHARACTER - Structure
//    Name - String
//    Age - Integer
//    Avatar - Texture
//    Display Image - Texture
//    Health - Float
//    Inventory - Array
//    Levels - Integer
//    Move Speed - Float
//    Job - String (Structure)
//    Jump Height - Float



// TAKEN ON 1/17
// 1. use the keyword "extends" to esatblish a parent child relationship between classes. //
// 2. never declare variables with the same name and type in child classes if they are allready
//    decalred in the parent class. //
// 3. variables and functions declared in the parent class can always be used / called / modified 
//    in child classes. //
// 4. a child class will trigger the parent class constructor before triggering its own constructor 
//    when program is ran. //
// 5. A child class will not trigger any other parent class functions even if the child class is 
//    using the same names for those functions. //
// 6. the "super" keyword in java refrences the parent class. //
// 7. To call or use functions/variables from a parent class within a child class, we use 
//    super.functionName() / super.variableName to reference them. //



// Taken on 1/24
// ?: Ternary Condition Operator / if you want to assign a variable based on a condition, you use this operator / : is the condition //
// variable = condition ? a : b;
// Value "a" will be assigned to "variable" if condition is true.
// Value "b" will be assigned to "variable" if condition is false.

// floor() rounds down, ceil() rounds up, round() rounds to closest value 


// taken on 1/31
// steps to spawn eneimes on other sides of screen and follow player
// 1. roll random number.
// 2. if the number is between 0-0.24 = spawn on left side
//     else if the number is between 0.25-0.49 = spawn on the top
//      else if the number is between 0.5-0.74 = spawn on the right
//       else if the the number is between 0.75-0.99 
// 3. if left - x = -50; y = random(height);
//    if top - x = random(width; y = -50;
// 4. update - CalcAngleToPlayer.
// 5. update - Move enemies using the angle.






//float spawnLocation = random(0, 1);

//if(spawnLocation =< .33) {
//  position.x = width + radius;
//  position.y = random(400, height);
//}
//if(spawnLocation =< .66 && spawnLocation > .33){
//  position.x = 0 - radius;
//  position.y = random(400, height);
//}
//if(spawnLocation =< 1 && spawnLocation > .66) {
//  position.x = random(width);
//  position.y = height - radius;
//}

//calcAngle(player.position.x, player.position.y)







// pixilart.com


//TAKEN ON 2/5

// COLOR STUFF
//class enemy {     
  
//  float hue

// enemy(){
// 
//  }

//void update(){
//  hue = map(speed, 0, 300, 0, 256);
//   }

//void draw(){
//  fill(hue, 255, 255)
//  }
//}


//POWER UP TYPES + POWERUP SETUP
//class PowerUp

//int powerType = 0 // 0 = slowdown, 1 = small enemys
//PowerUp() {
//   int rand = (int)random(0, 3);
//   powerType = rand;

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
// }
//
//for (int i = 0; i <powerUps.size(); i++) {
  
//   if p.checkCollision(player)){
//      if(p.powerType == 0) {
//    }
//      else if(p.powerType == 1) {
//    }
//      else if(p.powerType == 2) {
//    }
// 
//   p.isDead
// }
