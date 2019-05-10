// Images displayed
PImage[] channels = new PImage[3];             // Images to be displayed on TV
PImage img;                                    // Picture frame photo
// Button components
float leftDirectionalX, leftDirectionalY;      // Position of left directional button
float rightDirectionalX, rightDirectionalY;    // Position of right directional button
float powerX, powerY;                          // Position of power button
float lightX, lightY;                          // Position of light button
float directionalWidthSize = 95;               // Width of directional button
float directionalHeightSize = 40;              // Height of directional button
float lightWidthSize = 200;                    // Width of light button
float lightHeightSize = 40;                    // Height of light button
float powerSize = 50;                          // Diameter of power button
color directionalColor, lightColor, powerColor;                // The base color for the buttons
color directionalHighlight, lightHighlight, powerHighlight;    // The highlight that appears over buttons when hovering
// Checks if mouse hovers over the buttons
boolean leftDirectionalOver = false;
boolean rightDirectionalOver = false;
boolean lightOver = false;
boolean powerOver = false;
// Checks if the button was toggled on or off
boolean powerToggle = false;
boolean lightToggle = false;
// Checks if TV is on or off
boolean isTurnedOn = false;
// Random number assigned for initial channel number
int randNum = (int) random(3);
int currentChannel = randNum;

void setup(){
 size(800,800);
 // Assigned button values
 directionalColor = color(200);      //Light gray
 directionalHighlight = color(50);   //Dark gray
 lightColor = color(200);            //Light gray
 lightHighlight = color(50);         //Dark gray
 powerColor = color(200);            //Light gray
 powerHighlight = color(50);         //Dark gray
 powerX = width/2;
 powerY = (height/2)+365;
 lightX = (width/2)+165;
 lightY = (height/2)+345;
 leftDirectionalX = width/2-267.5-directionalWidthSize;
 leftDirectionalY = (height/2)+345;
 rightDirectionalX = width/2-162.5-directionalWidthSize;
 rightDirectionalY = (height/2)+345;
 // Loading channels and image for the picture frame
 img = loadImage("Giraffe.jpg");
 for(int i = 0; i < channels.length; i++){
   channels[i] = loadImage("channel"+ i +".gif");
 }
}

void draw(){
  //Wall color
  background(#D1F36A);   //Light lime green
  //Flooring & wall paneling
  flooring();
  //Furniture
  furniture();
  //TV Stand/Dresser
  tvStand();
  //Clay pot with cactus
  plant();
  //TV
  tv();
  //Picture frame
  pictureFrame();
  //Remote
  remote();
}

void flooring(){
  //Flooring
  noStroke();
  fill(#A85E13);    //Light brown
  quad(0,500,800,500,800,800,0,800);
  //Wall paneling along bottom of wall
  fill(#94C037);    //Lime green
  quad(0,460,800,460,800,505,0,505);
}

void furniture(){
  //Rug
  strokeWeight(3);
  stroke(#EABB2F);  //Tan
  fill(#FFD556);    //Light tan
  quad((width/2)-150,(height/2)+250,(width/2)+150,(height/2)+250,(width/2)+175,height+10,(width/2)-175,height+10);
  //Couch legs
  noStroke();
  fill(#812600);    //Dark brown
  quad(120,700,150,700,140,730,130,730);
  quad(650,700,680,700,670,730,660,730);
  //Couches
  strokeWeight(2);
  stroke(#AE9C64);    //Gray
  fill(#F2E8C9);      //White | Light gray
  quad(0,575,150,575,150,700,0,700);
  quad(-10,630,150,630,150,685,-10,850);
  quad(-10,560,70,560,70,630,-10,700);
  line(-10,630,70,560);
  line(-10,790,150,630);
  quad(800,575,650,575,650,700,800,700);
  quad(810,630,650,630,650,685,810,850);
  quad(810,560,730,560,730,630,810,700);
  line(810,630,730,560);
  line(810,790,650,630);
  //Lamp
  strokeWeight(3);
  stroke(50);    //Gray
  fill(0);       //Black
  quad(715,485,715,185,735,185,735,485);
  quad(695,495,710,480,740,480,755,495);
  quad(690,490,760,490,760,520,690,520);
  //Lamp shade
  noStroke();
  fill(#C55900);    //Dark orange
  quad(705,140,720,175,730,175,745,140);
  //This toggle is placed here so the correct layers are overlapping and the lamp shade changes color
  if (lightToggle){ //If the light button is toggled
    lightButton(); //Turn the light on
  }
  strokeWeight(3);
  stroke(50);      //Gray
  fill(0);         //Black
  beginShape();
  vertex(715,185);
  vertex(695,130);
  vertex(755,130);
  vertex(735,185);
  beginContour();
  vertex(705,140);
  vertex(720,175);
  vertex(730,175);
  vertex(745,140);
  endContour();
  endShape(CLOSE);
  quad(720,175,720,140,730,140,730,175);
  noFill();
  stroke(0);    //Black
  line(723,140,727,140);
  line(723,175,727,175);
}

void tvStand(){
  //TV stand legs
  noStroke();
  fill(#812600);      //Dark brown
  quad(200,525,230,525,220,555,210,555);
  quad(240,515,270,515,260,545,250,545);
  quad(600,525,570,525,580,555,590,555);
  quad(560,515,530,515,540,545,550,545);
  //Dresser
  strokeWeight(3);
  stroke(#46419F);    //Dark blue
  fill(#625DB5);      //Blue
  quad((width/2)-200,(height/2)+125,(width/2)+200,(height/2)+125,(width/2)+200,(height/2),(width/2)-200,(height/2));
  //Doors
  stroke(#CECECE);    //Light gray
  fill(#FFFFFF);      //White
  quad(250,420,375,420,375,505,250,505);
  quad(425,420,550,420,550,505,425,505);
  //Hinges
  strokeWeight(2);
  fill(#727272);    //Dark gray
  quad(245,430,255,430,255,450,245,450);
  quad(245,475,255,475,255,495,245,495);
  quad(545,430,555,430,555,450,545,450);
  quad(545,475,555,475,555,495,545,495);
  //Handles
  rect(340,435,25,15);
  rect(435,435,25,15);
  rect(340,465,25,15);
  rect(435,465,25,15);
  quad(345,440,360,440,360,475,345,475);
  quad(440,440,455,440,455,475,440,475);
  noFill();
  strokeWeight(3);
  stroke(#727272);    //Dark gray
  line(348,440,357,440);
  line(348,475,357,475);
  line(443,440,452,440);
  line(443,475,452,475);
}

void plant(){
  //Cactus
  strokeWeight(3);
  stroke(#045300);    //Dark green
  fill(#079300);      //Green
  arc(155,410,40,30,PI,TWO_PI,OPEN);
  quad(135,410,175,410,175,480,135,480);
  noFill();
  stroke(#079300);    //Green
  line(138,410,172,410);
  stroke(#045300);    //Dark green
  bezier(150,397,140,410,140,415,140,480);
  bezier(160,397,170,410,170,415,170,480);
  line(155,395,155,480);
  //Pot
  stroke(#E08646);    //Dark orange-red
  fill(#FFAB6F);      //Light orange-red
  quad(130,485,180,485,170,520,140,520);
  quad(125,475,185,475,185,490,125,490);
}

void tv(){
  //TV screen
  strokeWeight(3);
  stroke(#000000);    //Black
  fill(#101010);      //Dark gray
  quad((width/2)-225,(height/2)-350,(width/2)+225,(height/2)-350,(width/2)+225,(height/2)-100,(width/2)-225,(height/2)-100);
  //Plastic trim around TV screen
  noStroke();
  fill(#505660);      //Gray
  beginShape();
  vertex((width/2)-250,(height/2)-375);
  vertex((width/2)+250,(height/2)-375);
  vertex((width/2)+250,(height/2)-75);
  vertex((width/2)-250,(height/2)-75);
  beginContour();
  vertex((width/2)-225,(height/2)-350);
  vertex((width/2)-225,(height/2)-100);
  vertex((width/2)+225,(height/2)-100);
  vertex((width/2)+225,(height/2)-350);
  endContour();
  endShape(CLOSE);
}

void pictureFrame(){
  //Picture
  image(img,25,65);
  //Picture frame
  strokeWeight(3);
  stroke(#DDABE4);    //Light purple
  fill(#9F4CAB);      //Purple
  beginShape();
  vertex(15,65);
  vertex(25,55);
  vertex(125,55);
  vertex(135,65);
  vertex(135,285);
  vertex(125,295);
  vertex(25,295);
  vertex(15,285);
  beginContour();
  vertex(25,65);
  vertex(25,285);
  vertex(125,285);
  vertex(125,65);
  endContour();
  endShape(CLOSE);
}

void remote(){
  //Remote light
  noStroke();
  fill(#C50000,80);    //Dark red
  ellipse(width/2,725,65,65);
  fill(#C50000);       //Dark red
  ellipse(width/2,725,60,60);
  //TV light
  fill(#FF0000,80);    //Red
  ellipse((width/2)+233,(height/2)-90,15,15);
  fill(#FF0000);       //Red
  ellipse((width/2)+233,(height/2)-90,10,10);
  //This toggle is placed here so the correct layers are overlapping and the tv light/remote light changes color
  if(powerToggle){ //If the power button is toggled
    powerButton(); //Changes the remote light to a brighter color and changes red circle on tv to a blue one
  }
  //Remote background
  stroke(#737374);      //Gray
  fill(#000000);        //Black
  quad(-10,710,810,710,810,810,-10,810);
  //Hover feature over buttons
  hoverButtons();
  //Up directional arrow
  noStroke();
  fill(#FFFFFF);        //White
  triangle(width/2-267.5-(directionalWidthSize/2),(height/2)+365-10,width/2-267.5-(directionalWidthSize/2)+20,(height/2)+365+10,width/2-267.5-(directionalWidthSize/2)-20,(height/2)+365+10);
  textSize(25);
  fill(255);
  text("+", width/2-267.5-(directionalWidthSize/2)-10.5, 735);
  //Down directional arrow
  triangle(width/2-162.5-(directionalWidthSize/2),(height/2)+365+10,width/2-162.5-(directionalWidthSize/2)+20,(height/2)+365-10,width/2-162.5-(directionalWidthSize/2)-20,(height/2)+365-10);
  textSize(25);
  text("-", width/2-162.5-(directionalWidthSize/2)-7.5, 735);
  //Power symbol
  noFill();
  strokeWeight(3);
  stroke(#A80000);      //Dark red
  arc((width/2),765,30,30,-QUARTER_PI,PI+QUARTER_PI,OPEN);
  line((width/2),750,(width/2),765);
  textSize(25);
  fill(#A80000);
  text("Power", width/2-35, 735);
  
  //Light symbol
  strokeWeight(3);
  stroke(#FFF200);      //Yellow
  noFill();
  bezier((width/2)+(lightWidthSize/2)+165-20,(height/2)+365-10,(width/2)+(lightWidthSize/2)+165-40,(height/2)+365-5,(width/2)+(lightWidthSize/2)+165-40,(height/2)+365+5,(width/2)+(lightWidthSize/2)+165-20,(height/2)+365+10);
  bezier((width/2)+(lightWidthSize/2)+165-20,(height/2)+365-10,(width/2)+(lightWidthSize/2)+165-10,(height/2)+365-5,(width/2)+(lightWidthSize/2)+165-10,(height/2)+365+5,(width/2)+(lightWidthSize/2)+165-20,(height/2)+365+10);
  line((width/2)+(lightWidthSize/2)+165-10,(height/2)+365-10,(width/2)+(lightWidthSize/2)+165+10,(height/2)+365-10);
  line((width/2)+(lightWidthSize/2)+165-7,(height/2)+365-5,(width/2)+(lightWidthSize/2)+165+13,(height/2)+365-5);
  line((width/2)+(lightWidthSize/2)+165-5,(height/2)+365,(width/2)+(lightWidthSize/2)+165+15,(height/2)+365);
  line((width/2)+(lightWidthSize/2)+165-7,(height/2)+365+5,(width/2)+(lightWidthSize/2)+165+13,(height/2)+365+5);
  line((width/2)+(lightWidthSize/2)+165-10,(height/2)+365+10,(width/2)+(lightWidthSize/2)+165+10,(height/2)+365+10);
  textSize(25);
  fill(#FFF200);
  text("Light", width/2+(lightWidthSize/2)+165-30, 735);
}

void hoverButtons(){
  update();
  // If the mouse is over the button then the button is highlighted with a darker color
  if (leftDirectionalOver) {
    fill(directionalHighlight);
  } else {
    // The button remains as its initial color
    fill(directionalColor);
  }
    // The button is then placed on the remote with its preassigned variables
    stroke(#737374);
    rect(leftDirectionalX, leftDirectionalY, directionalWidthSize, directionalHeightSize);
  // The same effect works for each consecutive button aswell
  if (rightDirectionalOver) {
    fill(directionalHighlight);
  } else {
    fill(directionalColor);
  }
    rect(rightDirectionalX, rightDirectionalY, directionalWidthSize, directionalHeightSize);
  if (lightOver) {
    fill(lightHighlight);
  } else {
    fill(lightColor);
  }
    rect(lightX, lightY, lightWidthSize, lightHeightSize);
  if (powerOver) {
    fill(powerHighlight);
  } else {
    fill(powerColor);
  }
    ellipse(powerX, powerY, powerSize, powerSize);
}

void update() {
  //The position of the mouse is being evaluated by the method: over__Button() and confirming whether the mouse is over the button
  if ( overCircle(powerX, powerY, powerSize) ) {
    //The single button being tested is assigned as true and the rest remain false
    powerOver = true;
    leftDirectionalOver = false;
    rightDirectionalOver = false;
    lightOver = false;
  }
  //The positions are then evaluated for each consecutive button in the same manner
  else if ( overRect(leftDirectionalX, leftDirectionalY, directionalWidthSize, directionalHeightSize) ) {
    leftDirectionalOver = true;
    rightDirectionalOver = false;
    lightOver = false;
    powerOver = false;
  } else if ( overRect(rightDirectionalX, rightDirectionalY, directionalWidthSize, directionalHeightSize) ) {
    rightDirectionalOver = true;
    leftDirectionalOver = false;
    lightOver = false;
    powerOver = false;
  } else if ( overRect(lightX, lightY, lightWidthSize, lightHeightSize) ) {
    lightOver = true;
    leftDirectionalOver = false;
    rightDirectionalOver = false;
    powerOver = false;
  } 
  //The position of the mouse is not above any of the buttons
  else {
    powerOver = leftDirectionalOver = rightDirectionalOver = lightOver = false;
  }
}

void mousePressed(){
  if(powerOver){ //If mouse is over power button
    powerToggle = !powerToggle; //The TV is toggled on
    isTurnedOn = !isTurnedOn; //TV is turned on
  } else if(lightOver){ //If mouse is over light button
    lightToggle = !lightToggle; //The light is toggled on
  }
  //Channel logic
  if(isTurnedOn){ //If TV is on
    if(leftDirectionalOver){ //If mouse is over up button
      upChannel(); //Move up one channel
    } 
    else if(rightDirectionalOver){ //If mouse is over down button
      downChannel(); //Move down one channel
    }
  }
}

void powerButton(){
  if(powerToggle){
    //Remote light
    noStroke();
    fill(#FF0000,80);        //Red
    ellipse(width/2,725,65,65);
    fill(#FF0000);           //Red
    ellipse(width/2,725,60,60);
    //TV light
    fill(#505660);          //Gray
    ellipse((width/2)+233,(height/2)-90,15,15);
    fill(#4542D2,80);       //Blue
    ellipse((width/2)+233,(height/2)-90,15,15);
    fill(#4542D2);          //Blue
    ellipse((width/2)+233,(height/2)-90,10,10);
    // The TV channel will be set to the first random number assigned and then 
    // will change based on the up and down channel() methods
    if(currentChannel == 0){
      image(channels[currentChannel],(width/2)-225,(height/2)-350);
    } else if(currentChannel == 1){
      image(channels[currentChannel],(width/2)-225,(height/2)-350);
    } else if(currentChannel == 2){
      image(channels[currentChannel],(width/2)-225,(height/2)-350);
    }
  }
}

void lightButton(){
  if(lightToggle){
    //Lamp color change
    noStroke();
    fill(#FFCA00,100);    //Yellow
    quad(705,140,720,175,730,175,745,140);
    //Light above lamp
    // Color: FFEC67
    fill(#FFEC67,120);    //Light yellow
    quad(705,140,675,0,775,0,745,140);
  }
}

void upChannel(){
    currentChannel+=1; //Increment one to the index of currentChannel
    //This ensures that the index will not go past the last channel's index
    if(currentChannel > channels.length-1){
      currentChannel = 0;
    }
}

void downChannel(){
    currentChannel-=1; //Decrement one to the index of currentChannel
    //This ensures that the index will not go lower than the first channel's index
    if(currentChannel < 0){
      currentChannel = channels.length-1;
    }
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
