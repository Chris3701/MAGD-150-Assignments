  Target target[];
  PlusOne addition;
  Pointer arrow;
  float angle;        //Angle for rotating the pointer
  int maxTargets;
  boolean bullseyeOneOver = false;
  boolean bullseyeTwoOver = false;
  boolean bullseyeThreeOver = false;
  boolean bullseyeFourOver = false;
  boolean bullseyeFiveOver = false;
  boolean isOneHit = false;
  boolean isTwoHit = false;
  boolean isThreeHit = false;
  boolean isFourHit = false;
  boolean isFiveHit = false;
  
  void setup() {
    size(860,620);
    rectMode(CENTER);
    ellipseMode(CENTER);
    angle = PI/2;
    maxTargets = 5;
    target = new Target[maxTargets];  //There can only be a max of five targets loaded in
    //Each target is then created
    for(int i = 0; i < target.length; i++) {
      target[i] = new Target();
    }
    addition = new PlusOne();    //PlusOne created
    arrow = new Pointer();       //Pointer created
  }
  
  void draw() {
    background(100);
    for(int i = 0; i < target.length; i++) {
    //Display each target
    target[i].display();
    }
    
    //Carnival background
    carnivalBackground();
    
    //Carnival shack
    carnivalShack();
    
    //Display the "+1" object
    addition.display();
    
    //Check if the mouse is over the targets
    update();
    
    //Moves "PlusOne" and the targets off the screen
    updateHit();
    
    //Pointer rotated
    float c = cos(angle);
    //Then the pointer is brought into the middle of the screen
    translate(width/2,height/2);
    //Usage of rotation
    rotate(c);
    showPointer();
  }
  
  /*
  If the bullseye is hit then the target moves down off the screen
  and the "+1" text is moved from left to right
  */
  void updateHit(){
    if(isOneHit){
      target[0].update();
      if(target[0].getY() < height){
        addition.update();
      }
      //I was trying to make sure the "PlusOne" object moved back off the screen
      //but setting the x coordinate would fix the object on that new coordinate and
      //lead to an infinte loop
      //else if(target[0].getY() >= height && addition.getX() < width){
      //    addition.setX(880);
      //    println(addition.getX());
      //}
      }
    if(isTwoHit){
      target[1].update();
      if(target[1].getY() < height){
        addition.update();
      }
    }
    if(isThreeHit){
      target[2].update();
      if(target[2].getY() < height){
        addition.update();
      }
    }
    if(isFourHit){
      target[3].update();
      if(target[3].getY() < height){
        addition.update();
      }
    }
    if(isFiveHit){
      target[4].update();
      if(target[4].getY() < height){
        addition.update();
      }
    }
  }
  
  void carnivalBackground(){
    noStroke();
    //Sky
    fill(#0C73C2);    //Blue
    quad(-5,-5,280,-5,280,height,-5,height);
    quad(width-280,-5,width+5,-5,width+5,height,width-280,height);
    //Grass landscape
    fill(#00DA0E);    //Green
    quad(-5,height/2+50,280,height/2+50,280,height,-5,height);
    quad(width-280,height/2+50,width+5,height/2+50,width+5,height,width-280,height);
    //Sun
    fill(#FFEF00);       //Yellow
    ellipse(-5,-5,150,150);
    noFill();
    stroke(#FFEF00,90);  //Yellow
    strokeWeight(3);
    ellipse(-5,-5,165,165);
    //Grass pieces
    stroke(#00DA0E);  //Green
    strokeWeight(2);
    line(width-150,height/2+40,width-155,height/2+50);
    line(width-165,height/2+40,width-155,height/2+50);
    line(width-160,height/2+37.5,width-155,height/2+50);
    line(125,height/2+35,130,height/2+50);
    line(120,height/2+42.5,130,height/2+50);
    line(137.5,height/2+39.5,130,height/2+50);
  }
  
  void showPointer(){
    arrow.display();
    arrow.update();
  }
  
  void carnivalShack(){
    //Shack
    beginShape();
    noStroke();
    fill(#954400);    //Brown
    vertex((width/2)-150,-5);
    vertex((width/2)+150,-5);
    vertex((width/2)+150,height);
    vertex((width/2)-150,height);
    beginContour();
    vertex((width/2)-125,340);
    vertex((width/2)+125,340);
    vertex((width/2)+125,120);
    vertex((width/2)-125,120);
    endContour();
    endShape(CLOSE);
    //Awning holder -- Part 1
    stroke(#703300);    //Dark brown
    strokeWeight(5);
    line((width/2)-150,-5,(width/2)-150,height);
    line((width/2)+150,-5,(width/2)+150,height);
    strokeWeight(2);
    fill(#B55301);      //Light brown
    rect((width/2)-122.5,50,30,30);
    rect((width/2)+122.5,50,30,30);
    //Overhang
    quad((width/2)-130,117.5,(width/2)+130,117.5,(width/2)+130,130,(width/2)-130,130);
    //Counter that money is handed across
    quad((width/2)-135,337.5,(width/2)+135,337.5,(width/2)+135,355,(width/2)-135,355);
    //Backdrop to the text
    fill(0);        //Black
    rect(width/2,height/2+125,175,50);
    //Instructions
    textSize(20);
    fill(#FF0000);    //Red
    text("Click the bullseye", width/2-85, height/2+135);
    
    //Awning
    stroke(0);        //Black
    strokeWeight(1);
    fill(#510779);    //Purple
    quad(315,60,340,-10,520,-10,545,60);
    noStroke();
    fill(230);        //Light gray
    quad(335,60,360,-10,380,-10,355,60);
    quad(375,60,400,-10,420,-10,395,60);
    quad(525,60,500,-10,480,-10,505,60);
    quad(485,60,460,-10,440,-10,465,60);
    //Awning holder -- Part 2
    fill(#441F00);    //Dark brown
    rect(width/2,60,235,10);
    fill(#703300);    //Dark brown
    //Usage of both scale and translate
    scale(0.5);
    translate(width/2-107.5,65);
    rect((width/2)-137.5,50,30,30);
    rect((width/2)+352.5,50,30,30);
  }
  
  void mouseClicked(){
    if(bullseyeOneOver){
      //If the bullseye was clicked then the boolean is assigned true for later usage
      isOneHit = true;
      println("Clicked One");
    }
    //Each consecutive bullseye is then checked
    else if(bullseyeTwoOver){
      isTwoHit = true;
      println("Clicked Two");
    }
    else if(bullseyeThreeOver){
      isThreeHit = true;
      println("Clicked Three");
    }
    else if(bullseyeFourOver){
      isFourHit = true;
      println("Clicked Four");
    }
    else if(bullseyeFiveOver){
      isFiveHit = true;
      println("Clicked Five");
    }
  }
  
  void update(){
    //The position of the mouse is being evaluated by the method: over__Circle() and confirming whether the mouse is over the target
    if ( overCircle(target[0].getX(), target[0].getY(), target[0].getSize()) ) {
      //The single target being tested is assigned as true and the rest remain false
      bullseyeOneOver = true;
      bullseyeTwoOver = false;
      bullseyeThreeOver = false;
      bullseyeFourOver = false;
      bullseyeFiveOver = false;
    }
    //The positions are then evaluated for each consecutive target in the same manner
    else if ( overCircle(target[1].getX(), target[1].getY(), target[1].getSize()) ) {
      bullseyeTwoOver = true;
      bullseyeOneOver = false;
      bullseyeThreeOver = false;
      bullseyeFourOver = false;
      bullseyeFiveOver = false;
    }
    else if ( overCircle(target[2].getX(), target[2].getY(), target[2].getSize()) ) {
      bullseyeThreeOver = true;
      bullseyeOneOver = false;
      bullseyeTwoOver = false;
      bullseyeFourOver = false;
      bullseyeFiveOver = false;
    }
    else if ( overCircle(target[3].getX(), target[3].getY(), target[3].getSize()) ) {
      bullseyeFourOver = true;
      bullseyeOneOver = false;
      bullseyeTwoOver = false;
      bullseyeThreeOver = false;
      bullseyeFiveOver = false;
    }
    else if ( overCircle(target[4].getX(), target[4].getY(), target[4].getSize()) ) {
      bullseyeFiveOver = true;
      bullseyeOneOver = false;
      bullseyeTwoOver = false;
      bullseyeThreeOver = false;
      bullseyeFourOver = false;
    }
    //The position of the mouse is not above any of the targets
    else
      bullseyeOneOver = bullseyeTwoOver = bullseyeThreeOver = bullseyeFourOver = bullseyeFiveOver = false;
    }
  
  /*
  This method was copied from the 'ButtonExample2' and takes the coordinates along 
  with the dimenstions of a circle. These values are then used to check if the mouse coordinates
  are within the circle.
  */
  boolean overCircle(float x, float y, float diameter){
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
      return true;
  } else {
      return false;
    }
  }
 ---------------- {VSeparate classV} ---------------------
                        VVV
  /*
 * Acceleration with Vectors 
 * by Daniel Shiffman.  
 * 
 * Demonstration of the basics of motion with vector.
 * A "PlusOne" object stores location, velocity, and acceleration as vectors
 * The motion is controlled by clicking the mouse
 */

class PlusOne{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;      //The object's maximum speed
  
  PlusOne(){
    location = new PVector(1180,100);
    velocity = new PVector(0,0);
    topspeed = 8;
  }
  
  void update() {
    //Compute a vector that points from location to under counter
    PVector left = new PVector(1120, getY());
    PVector acceleration = PVector.sub(left,location);
    //Set magnitude of acceleration
    acceleration.setMag(0.3);
    
    //Velocity changes according to acceleration
    velocity.add(acceleration);
    //Limit the velocity by topspeed
    velocity.limit(topspeed);
    //Location changes by velocity
    location.add(velocity);
  }
  
  void display() {
    //"+1" object
    textSize(100);
    fill(#FF0000);    //Red
    text("+1", getX(), getY());
    translate(5,5);
    fill(255);        //White
    text("+1", getX(), getY());
  }
  
  /*
  This method returns the location of the x coordinate of the "PlusOne" object
  */
  float getX(){
    return location.x;
  }
  
  /*
  This method returns the location of the y coordinate of the "PlusOne" object
  */
  float getY(){
    return location.y;
  }
}
 ---------------- {VSeparate classV} ---------------------
                        VVV
  /*
 * Acceleration with Vectors 
 * by Daniel Shiffman.  
 * 
 * Demonstration of the basics of motion with vector.
 * A "Spinning" object stores location, velocity, and acceleration as vectors
 * The motion is controlled by clicking the mouse
 */

class Pointer{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;      //The pointer's maximum speed
  
  Pointer(){
    location = new PVector(175,450);
    velocity = new PVector(0,0);
    topspeed = 4;
  }
  
  void update() {
    //Compute a vector that points from location to the area that should be interacted with
    PVector left = new PVector(150,375);
    PVector acceleration = PVector.sub(left,location);
    //Set magnitude of acceleration
    acceleration.setMag(0.3);
    
    //Velocity changes according to acceleration
    velocity.add(acceleration);
    //Limit the velocity by topspeed
    velocity.limit(topspeed);
    //Location changes by velocity
    location.add(velocity);
  }
  
  void display() {
    //Arrow
    fill(210);      //Light gray
    beginShape();
    vertex(getX(),getY());
    vertex(getX()+30,getY()+15);
    vertex(getX()-15,getY()+30);
    endShape(CLOSE);
  }
  
  /*
  This method returns the location of the x coordinate of the "Pointer" object
  */
  float getX(){
    return location.x;
  }
  
  /*
  This method returns the location of the y coordinate of the "Pointer" object
  */
  float getY(){
    return location.y;
  }
}
 ---------------- {VSeparate classV} ---------------------
                        VVV
  /*
 * Acceleration with Vectors 
 * by Daniel Shiffman.  
 * 
 * Demonstration of the basics of motion with vector.
 * A "Target" object stores location, velocity, and acceleration as vectors
 * The motion is controlled by clicking the mouse
 */

class Target{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;    //The Target's maximum speed
  float targetSize;  //The Target's size
  
  Target(){
    location = new PVector(random((width/2-100),(width/2+100)), random(150,300));
    velocity = new PVector(0,0);
    topspeed = 4;
    targetSize = random(20,30);
  }
  
  void update() {
    //Compute a vector that points from location to off the screen
    PVector bottom = new PVector(getX(), 800);
    PVector acceleration = PVector.sub(bottom,location);
    //Set magnitude of acceleration
    acceleration.setMag(0.2);
    
    //Velocity changes according to acceleration
    velocity.add(acceleration);
    //Limit the velocity by topspeed
    velocity.limit(topspeed);
    //Location changes by velocity
    location.add(velocity);
  }
  
  void display() {
    //Backstop
    stroke(#270E00);  //Dark brown
    strokeWeight(2);
    fill(#895233);    //Light brown
    rect(getX(), getY()+100, 20, 190);
    //Target
    noStroke();
    fill(#FF0000);    //Red
    ellipse(getX(),getY(),targetSize+20,targetSize+20);
    pushMatrix();
    fill(255);        //White
    ellipse(getX(),getY(),targetSize+15,targetSize+15);
    fill(#FF0000);
    ellipse(getX(),getY(),targetSize+10,targetSize+10);
    fill(255);
    ellipse(getX(),getY(),targetSize+5,targetSize+5);
    popMatrix();
    fill(#FF0000);
    ellipse(getX(),getY(),targetSize,targetSize);
  }
  
  /*
  This method returns the location of the x coordinate of the "Target" object
  */
  float getX(){
    return location.x;
  }
  
  void setX(float x){
    location.x = x;
  }
  
  /*
  This method returns the location of the y coordinate of the "Target" object
  */
  float getY(){
    return location.y;
  }
  
  /*
  This method returns the size of the "Target" object
  */
  float getSize(){
    return targetSize;
  }
}
