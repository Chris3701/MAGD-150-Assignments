// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Import PDF Library
import processing.pdf.*;

// Create a boolean (True or False) variable to
// tell Processing when to start and stop saving
// the screen information to a .pdf file.
boolean recordScreen;

// A String variable can be used to change
// the file name of the .pdf to be saved.
String fileName;

int numLines;          //Number of lines from a text file
String delim = "\n";   //Delimeter
int TEXT_SIZE = 25;    //Size of the text
 
float TEXT_SPEED = 3;  //Speed of the poster
String motivationalMessageVert;
String motivationalMessageHoriz;

// The PFont object holds all the information about the font in memory.
PFont messageOneFont;
PFont messageTwoFont;

// Location of the vertical motivational message text block
float textYOffset;    //This represents the top of the moving text
float posterYOffset;  //This represents the top of the poster background

// Location of the horizontal motivational message text block
float textXOffset;    //This represents the right side of the moving text
float posterXOffset;  //This represents the right side of the poster background

void setup() {
  surface.setTitle("Motivational Messages");
  size(500, 500);
  fileName = "motivation";
  // loadFont looks for a .vlw file created by going to Tools > Create
  // Font... in Processing's menu. The .vlw file is placed in the
  // sketche's data folder.
  messageOneFont = createFont(PFont.list()[356], TEXT_SIZE);
  messageTwoFont = createFont(PFont.list()[1], TEXT_SIZE);
  //This will set the first poster off the screen intially
  posterYOffset = height+55;
  textYOffset = height-75;
  ////Loading the txt file into a String variable so it can be moved across the screen
  motivationalMessageVert = loadString("Motivational Message Vertical.txt",delim);
  //This will set the second poster off the screen intially
  posterXOffset = -100;
  textXOffset = -500;
  motivationalMessageHoriz = loadString("Motivational Message Horizontal.txt",delim);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
}
 
void draw() {
  background(0);
  //Until the second poster is almost of the screen, the bezier
  //randomly jumps around the screen
  if(posterXOffset<width+225){
  noFill();
  stroke(255);
  strokeWeight(4);
  bezier(random(width),random(height),random(width),random(height),random(width),random(height),random(width),random(height));
  }
  //Starts the recording
  if (recordScreen) {
    beginRecord(PDF, fileName + ".pdf");
  }
  
  pushMatrix();
  fill(#D46A6A);    //Light red
  strokeWeight(2);
  stroke(#FF0000);  //Bright red
  quad(100,posterYOffset,width-100,posterYOffset,width-100,posterYOffset+250,100,posterYOffset+250);
  fill(250, 250, 0);  //Yellow
  textFont(messageOneFont);
  translate(width/2, height/2);
  text(motivationalMessageVert, 0, textYOffset);
  //The y coordinate is being increased by the preset text speed
  textYOffset -= TEXT_SPEED;
  posterYOffset -= TEXT_SPEED;
  popMatrix();
  
  //This will delay the movement of the next poster
  if(posterYOffset<-75){
  pushMatrix();
  fill(#565695);    //Light blue
  stroke(#0000FF);  //Bright blue
  quad(posterXOffset-315,100,posterXOffset,100,posterXOffset,height-100,posterXOffset-315,height-100);
  fill(250, 250, 0);  //Yellow
  textFont(messageTwoFont);
  translate(width/2, height/2);
  text(motivationalMessageHoriz, textXOffset, 0);
  //The x coordinate is being increased by the preset text speed
  textXOffset += TEXT_SPEED;
  posterXOffset += TEXT_SPEED;
  popMatrix();
  }
  
  //Ends the recording
  if (recordScreen) {
    endRecord();
    recordScreen = false;
  }
}

/*
Turns the boolean to true, which begins
the recording process in draw.
*/
void mousePressed() {
  if (mouseButton == RIGHT) {
    recordScreen = true;
  }
}

/*
This method takes a .txt file and returns a String from a String array
*/
String loadString(String filePath, String delimiter) {
  //This takes each line and puts it into a seperate index in the array
  String[] lines = loadStrings(filePath);
  //This allows a string to be formed from an string array
  StringBuilder sbuilder = new StringBuilder();
  for (int i = 0, size = lines.length; i < size; ++i) {
    sbuilder.append(lines[i]);
    sbuilder.append(delimiter);
  }
  return sbuilder.toString();
}
