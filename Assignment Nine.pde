// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 16-4: Display QuickTime movie

import processing.video.*;
import processing.sound.*;

PImage border;            //Border around the documentary video
SoundFile startup_sound;  //Sound that starts when the mouse is clicked
boolean playing = false;  //Tracks if the startup sound was 

//The PFont object holds all the information about the font in memory.
PFont theFont;
int TEXT_SIZE = 25;       //The size of the text
String starting_message = "Left click the mouse to \n begin your journey \n into the music industy!";

//The Movie object stores the data of the video
Movie theMovie;

void setup(){
  size (980, 720); 
  surface.setTitle("Wrapping up the history of rap music");
  theFont = createFont(PFont.list()[356], TEXT_SIZE);
  border = loadImage("border.png");
  /*
  This sound can be found on the website, http://soundbible.com/1815-A-Tone.html/.
  */
  startup_sound = new SoundFile(this, "startup_tone.wav");
  /*
  RCTV Studios created this documentary and I converted 
  this video through http://www.onlinevideoconverter.com/.
  */
  theMovie = new Movie(this, "Evolution of Music Documentary.mov");
  rectMode(CENTER);
}

void mousePressed(){
   startup_sound.play();
   /*
   This sets the speed of the sound at double 
   the speed and heightens the tone a bit
   */
   startup_sound.rate(2);
   playing = true;
}

void draw() {
  pushMatrix();
   fill(0);
   textFont(theFont);
   text(starting_message,width/2-300,height/2-100);
   noFill();
   stroke(220);
   bezier(random(100,width-100),random(100,height-100),random(width-100),random(height-100),random(width-100),random(height-100),random(100,width-100),random(100,height-100));
   if(playing){
     background(0);
     tint(100, 220);
     image(theMovie, 50, 100, width-100, height-100);
     //This plays the video once instead of looping
     theMovie.play();
   }
   popMatrix();
   tint (100, 320);
   image(border, 0, 0, width, height);
}

//This method reads the new frames of the movie
void movieEvent(Movie movie) {
  movie.read();
}
