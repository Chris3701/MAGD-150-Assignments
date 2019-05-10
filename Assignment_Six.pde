float stormX, stormY, snowX, snowY, 
lightningX, lightningY, frozenEnvX, frozenEnvY;    //Position of buttons
float pondX, pondY;        //Position of pond
float cloudX, cloudY;      //Position of clouds
color lightn;              //Color for lightning
float weatherWidth = 100;  //Width of weather buttons
float weatherHeight = 75;  //Height of weather buttons
float effectsSize = 50;    //Square side lengths of effects buttons
color effectsColor, lightnHighlight, freezeHighlight,
weatherColor, snowHighlight, stormHighlight;  //Colors of buttons
boolean stormOver = false;
boolean snowOver = false;
boolean lightningOver = false;
boolean frozenEnvOver = false;
boolean snowToggle = false;
boolean stormToggle = false;
boolean lightningToggle = false;
boolean frozenEnvToggle = false;
boolean isSnowing = false;
boolean isStorming = false;
WeatherConditions storm[];      //Array of weather droplets

void setup(){
  size(600,600);
  surface.setTitle("Weather Effects");
  //Assigned button values
  effectsColor = color(200);        //Light gray
  weatherColor = color(200);        //Light gray
  snowHighlight = color(250);       //White
  stormHighlight = color(#1C009A);  //Blue
  lightnHighlight = color(#FFF93B); //Yellow
  freezeHighlight = color(#78FFF5); //Teal
  lightn = color(#FFFB3D,200);      //Yellow
  pondX = width/2;
  pondY = height-75;
  cloudX = width/2;
  cloudY = 0;
  stormX = 450;
  stormY = 400;
  snowX = stormX;
  snowY = 500;
  lightningX = 375;
  lightningY = 400;
  frozenEnvX = lightningX;
  frozenEnvY = 500;
  //Adds 150 droplets to the screen
  storm = new WeatherConditions[150];
  for(int i = 0; i < storm.length; i++){
    storm[i] = new WeatherConditions();
  }
}

void draw(){
  sky();
  forest();
  pond(pondX, pondY);
  storm();
  clouds();
  buttons();
}

void mousePressed(){
  if(snowOver){
    snowToggle = !snowToggle;
    isSnowing = !isSnowing;
  } else if(stormOver){
    stormToggle = !stormToggle;
    isStorming = !isStorming;
  } else if(lightningOver){
    if(isStorming)
    lightningToggle = !lightningToggle;
  } else if(frozenEnvOver){
    if(isSnowing)
    frozenEnvToggle = !frozenEnvToggle;
  }
}

void storm(){
  for(int i = 0; i < storm.length; i++){
    if(snowToggle){
    storm[i].snowStart();
    } else if(stormToggle){
      //if the raindrop y coordinate goes past the endPos then the rain drop appears
    if(storm[i].weatherY > storm[i].endPos){
      storm[i].end();
    }
    else
      //the rain starts back up again for continous drops
      storm[i].stormStart();
    }
    //if the droplets go past the screen they are reset at the top
    if(storm[i].weatherY > height){
      storm[i] = new WeatherConditions();
    }
  }
}

/*
This method incorporates the hoverButtons() method 
while placing text next to each button
*/
void buttons(){
  hoverButtons();
  textSize(25);
  fill(255);      //White
  text("|Snow|", snowX+10, 595);
  fill(#1C009A);  //Blue
  text("|Rain|", snowX+15, 395);
  fill(#FFF93B);  //Yellow
  text("{Lightning}", lightningX-55, 395);
  fill(#78FFF5);  //Teal
  text("{Freeze}", lightningX-25, 575);
}

void sky(){
  if(isSnowing){
    fill(#999999);          //Light gray
    rect(0,0,width,height);
    fill(250,50);           //White opaque fog
    rect(0,0,width,height);
  } else if(isStorming){
    fill(#262037);          //Dark blue
    rect(0,0,width,height);
    lightning(lightn);
  }
  else{
    background(0);          //Black
  }
  //Moon
  strokeWeight(2);
  stroke(150);               //Dark gray
  fill(200);                 //Light gray
  ellipse(120,100,70,70);
}

void clouds(){
  //Clouds
  noStroke();
  fill(190);         //Gray
  ellipse(cloudX-150,cloudY+20,65,65);
  ellipse(cloudX-110,cloudY+30,95,95);
  ellipse(cloudX-75,cloudY+10,35,35);
  ellipse(cloudX-225,cloudY+20,65,65);
  ellipse(cloudX-250,cloudY+25,95,95);
  ellipse(cloudX-290,cloudY+10,35,35);
  ellipse(cloudX+45,cloudY+15,65,65);
  ellipse(cloudX+150,cloudY+25,75,75);
  ellipse(cloudX+90,cloudY+10,45,45);
  ellipse(cloudX+170,cloudY+5,55,55);
  ellipse(cloudX+185,cloudY+10,75,75);
  ellipse(cloudX+275,cloudY+15,75,55);
  fill(250);         //White
  ellipse(cloudX-150,cloudY+20,60,60);
  ellipse(cloudX-110,cloudY+30,90,90);
  ellipse(cloudX-75,cloudY+10,30,30);
  ellipse(cloudX-225,cloudY+20,60,60);
  ellipse(cloudX-250,cloudY+25,90,90);
  ellipse(cloudX-290,cloudY+10,30,30);
  ellipse(cloudX+45,cloudY+15,60,60);
  ellipse(cloudX+150,cloudY+25,70,70);
  ellipse(cloudX+90,cloudY+10,40,40);
  ellipse(cloudX+170,cloudY+5,50,50);
  ellipse(cloudX+185,cloudY+10,70,70);
  ellipse(cloudX+275,cloudY+15,70,50);
}

/*
This method takes a predetermined color and creates lightning with that color
*/
void lightning(color light){
  if(lightningToggle){
    strokeWeight(4);
    stroke(light);
    bezier((width/2-100),30,(width/2-120),45,(width/2-80),70,(width/2-80),120);
    strokeWeight(6);
    bezier((width/2+200),25,(width/2+150),65,(width/2+195),80,(width/2+175),105);
    strokeWeight(3);
    bezier((width/2+50),35,(width/2+100),55,(width/2+55),85,(width/2+135),140);
    strokeWeight(8);
    bezier((width/2-250),40,(width/2-200),65,(width/2-270),100,(width/2-230),150);
  }
}

void forest(){
  //Grass
  strokeWeight(3);
  stroke(#265300);    //Darker green
  fill(#367800);      //Dark green
  rect(0,200,width,height);
  if(frozenEnvToggle){
    //Adds a white opaque filter to the grass
    stroke(160,100);    //Light gray
    fill(255,100);      //White
    rect(0,200,width,height);
  }
  //Trees
  //Trunk
  strokeWeight(2);
  stroke(#421A00);  //Brown
  fill(#B14E0D);    //Dark brown
  quad(40,260,90,260,90,330,40,330);
  quad(110,220,140,220,140,270,110,270);
  quad(160,240,200,240,200,300,160,300);
  quad(350,230,380,230,380,270,350,270);
  quad(410,250,450,250,450,310,410,310);
  quad(490,215,510,215,510,300,490,300);
  quad(530,240,560,240,560,340,530,340);
  //Leaves
  stroke(#033A00);  //Green
  fill(#0ACD00);    //Dark green
  triangle(90,220,125,180,160,220);
  triangle(100,195,125,165,150,195);
  triangle(105,180,125,150,145,180);
  triangle(110,165,125,135,140,165);
  triangle(20,260,65,210,110,260);
  triangle(25,225,65,180,105,225);
  triangle(30,195,65,150,100,195);
  triangle(145,240,180,210,215,240);
  triangle(145,225,180,195,215,225);
  triangle(145,210,180,180,215,210);
  triangle(145,195,180,165,215,195);
  triangle(340,230,365,205,390,230);
  triangle(345,210,365,185,385,210);
  triangle(350,190,365,165,380,190);
  triangle(395,250,430,215,465,250);
  triangle(395,225,430,190,465,225);
  triangle(395,200,430,165,465,200);
  triangle(395,175,430,140,465,175);
  triangle(485,215,500,190,515,215);
  triangle(485,195,500,170,515,195);
  triangle(485,175,500,150,515,175);
  triangle(485,155,500,130,515,155);
  triangle(510,240,545,200,580,240);
  triangle(510,220,545,180,580,220);
  triangle(510,200,545,160,580,200);
  if(frozenEnvToggle){
    //White snow on trees
    stroke(255);    //White
    fill(255);      //White
    triangle(527.5,180,545,160,562.5,180);
    triangle(162.5,180,180,165,197.5,180);
    triangle(357.5,177.5,365,165,372.5,177.5);
  }
}

void pond(float x, float y){
  if(frozenEnvToggle){
    //Frozen pond
    strokeWeight(3);
    stroke(220,110);    //White
    fill(#7CDADE);      //Light teal
    ellipse(x,y,width+80,height/2+15);
    }
  else{
    //Pond
    noStroke();
    fill(#2DB1B7);      //Teal
    ellipse(x,y,width+80,height/2+15);
  }
}

void update() {
  //The position of the mouse is being evaluated by the method: over__Button() and confirming whether the mouse is over the button
  if ( overRect(snowX, snowY, weatherWidth, weatherHeight) ) {
    //The single button being tested is assigned as true and the rest remain false
    snowOver = true;
    stormOver = false;
    lightningOver = false;
    frozenEnvOver = false;
  }
  //The positions are then evaluated for each consecutive button in the same manner
  else if ( overRect(stormX, stormY, weatherWidth, weatherHeight) ) {
    stormOver = true;
    snowOver = false;
    lightningOver = false;
    frozenEnvOver = false;
  } else if ( overRect(lightningX, lightningY, effectsSize, effectsSize) ) {
    lightningOver = true;
    frozenEnvOver = false;
    stormOver = false;
    snowOver = false;
  } else if ( overRect(frozenEnvX, frozenEnvY, effectsSize, effectsSize) ) {
    frozenEnvOver = true;
    lightningOver = false;
    stormOver = false;
    snowOver = false;
  } 
  //The position of the mouse is not above any of the buttons
  else {
    snowOver = stormOver = lightningOver = frozenEnvOver = false;
  }
}

void hoverButtons(){
  update();
  // If the mouse is over the button then the button is highlighted with a different color
  if (snowOver) {
    fill(snowHighlight);
  } else {
    // The button remains as its initial color
    fill(weatherColor);
  }
    // The button is then placed on the screen with its preassigned variables
    strokeWeight(2);
    stroke(#737374);
    rect(snowX, snowY, weatherWidth, weatherHeight);
  // The same effect works for each consecutive button aswell
  if (stormOver) {
    fill(stormHighlight);
  } else {
    fill(weatherColor);
  }
    rect(stormX, stormY, weatherWidth, weatherHeight);
  if (lightningOver) {
    fill(lightnHighlight);
  } else {
    fill(effectsColor);
  }
    rect(lightningX, lightningY, effectsSize, effectsSize);
  if (frozenEnvOver) {
    fill(freezeHighlight);
  } else {
    fill(effectsColor);
  }
    rect(frozenEnvX, frozenEnvY, effectsSize, effectsSize);
}

/*
This method was copied from the 'ButtonExample2' and takes the coordinates along 
with the dimenstions of a rectangle. These values are then used to check if the mouse coordinates
are within the rectangle.
*/
boolean overRect(float x, float y, float width, float height){
if (mouseX >= x && mouseX <= x+width && 
mouseY >= y && mouseY <= y+height) {
return true;
} else {
return false;
}
}
---------------- {VSeparate classV} ---------------------
                        VVV
class WeatherConditions {
  float weatherY, randomX;
  float splashX, splashY, endPos;
  float speed, speedLow, speedHigh;
  color snowC, stormC;
  WeatherConditions(){
    init();
  }
  
  void init(){
    randomX = random(width);
    weatherY = random(-300, 0);
    speedLow = 5;
    speedHigh = 10;
    speed = random(speedLow, speedHigh);
    snowC = color(random(200, 255));
    stormC = color(random(5, 10),random(90, 120),random(140, 175));
    splashX = 0;
    splashY = 0;
    /*
    The splash animation is randomly chosen and is 
    set to the height of the pond from the bottom of the screen.
    */
    endPos = height-(50*random(3.5));
  }
  
  void update(){
    weatherY += speed;
  }
  
  void snowStart(){
    noStroke();
    fill(snowC);
    ellipse(randomX,weatherY,10,10);
    update();
  }
  
  void stormStart(){
    noStroke();
    fill(stormC);
    ellipse(randomX,weatherY,10,10);
    update();
  }
  
  /*
  The code used here can be found on YouTube by searching,
  'Niraj Rajan' "Processing Rain Animation," or at
  https://www.youtube.com/watch?v=Yg3HWVqskTQ
  */
  void end(){
    stroke(stormC);
    noFill();
    ellipse(randomX,weatherY, splashX, splashY);
    /*
    The size of the ellipse on the y axis 
    increasing at a slower pace than the x axis
    */
    splashY += speed * 0.3;
    splashX += speed * 0.5;
    /*
    If the splash size along the x axis is greater than 30
    then the droplets are reset
    */
    if(splashX > 30){
      init();
    }
  }
}
