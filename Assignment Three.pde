float start;
float beginning = 0;
float beginning2 = 0;
float stop = 3000;
float stop2 = 3000;

void setup(){
  surface.setTitle("Screensaver");
  
  size(1024,650);
  background(255);
  rectMode(CENTER);
  ellipseMode(CENTER);
  start = millis();
}

void draw() {
  if(((stop - millis()) / 1000.0)>=0){
    println("Time: " + ((stop - millis()) / 1000.0));
  }
  noStroke();
  fill(map(stop-millis(), stop, start, 100, 255), 
  255, 255);
  float  x1 = map(stop-millis(), stop, start, width, 0);
  ellipse(x1, 50, 50, 50);
  ellipse(x1, 75, 50, 50);
  ellipse(x1, 100, 50, 50);
  ellipse(x1, 250, 50, 50);
  ellipse(x1, 275, 50, 50);
  ellipse(x1, 300, 50, 50);
  ellipse(x1, 450, 50, 50);
  ellipse(x1, 475, 50, 50);
  ellipse(x1, 500, 50, 50);
  fill(map(beginning+millis(), beginning, stop, 100, 255), 
  255, 255);
  float  x2 = map(beginning+millis(), beginning, stop, 0, width+75);
  ellipse(x2, 150, 50, 50);
  ellipse(x2, 175, 50, 50);
  ellipse(x2, 200, 50, 50);
  ellipse(x2, 350, 50, 50);
  ellipse(x2, 375, 50, 50);
  ellipse(x2, 400, 50, 50);
  ellipse(x2, 550, 50, 50);
  ellipse(x2, 575, 50, 50);
  ellipse(x2, 600, 50, 50);
  stroke(0);
  float x3 = map(beginning+millis(), beginning, stop, 0, height);
  beginShape(LINES);
  vertex(0,x3);
  vertex(width,x3);
  endShape(CLOSE);
  
  if (((stop - millis()) / 1000.0)<0){
    background(240);
    float a = 5;
    float b = width-5;
    float c = lerp(a, b, .2);
    float d = lerp(a, b, .5);
    float e = lerp(a, b, .8);
    float a2 = 5;
    float b2 = height-5;
    float c2 = lerp(a2, b2, .2);
    float d2 = lerp(a2, b2, .5);
    float e2 = lerp(a2, b2, .8);
    strokeWeight(6);
    // Outline to box
    beginShape(POINTS);
    stroke(255,0,0);
    vertex(a, 50);
    vertex(b, 50);
    vertex(c, 50);
    vertex(d, 50);
    vertex(e, 50);
    stroke(255,255,0);
    vertex(width*.25, a2);
    vertex(width*.25, b2);
    vertex(width*.25, c2);
    vertex(width*.25, d2);
    vertex(width*.25, e2);
    stroke(0,255,0);
    vertex(width*.75, a2);
    vertex(width*.75, b2);
    vertex(width*.75, c2);
    vertex(width*.75, d2);
    vertex(width*.75, e2);
    stroke(0,255,255);
    vertex(a, 600);
    vertex(b, 600);
    vertex(c, 600);
    vertex(d, 600);
    vertex(e, 600);
    endShape(CLOSE);
    fill(200);
    stroke(0);
    rect(width/2,height/2,400,450);
    // Movable circle
    strokeWeight(2);
    float x = constrain(mouseX,(width/2)-175,(width/2)+175);
    float y = constrain(mouseY,(height/2)-200,(height/2)+200);
    fill(random(200),random(100),random(200));
    ellipse(x,y,25,25);
  }
  if(((stop - millis()) / 1000.0)<=0 && ((stop - millis()) / 1000.0)>-0.02){
    float distance = dist(5,50,width-5,600);
    println("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-");
    println("The distance between the first dot on the top layer and the last dot on the bottom layer = " + distance);
  }
}
