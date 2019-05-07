  int pressedMouse = 0;
  int pressedMouseState = 0;
  int pressedKey = 0;
  int pressedKeyState = 0;
  char sKey;
  float waveX = -1100;
  float speedX = 3;
  
  void setup(){
    size(800,500);
    sKey = 's';
    // Displaying the instructions
    System.out.println("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-");
    System.out.println("Click the mouse to change the weather!");
    System.out.println("Press the 's' key to stop the wave!");
    System.out.println("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-");
  }
  
  void draw(){
    // Scenery
    //Skyline
    if(pressedMouseState == 1){
      background(#455A61);
      //Clouds and lightning
      strokeWeight(3);
      stroke(#FFFF75, 90);
      noFill();
      bezier(235,85,170,115,250,150,235,190);
      bezier(75,85,45,115,90,130,75,160);
      noStroke();
      fill(#5E6365);
      ellipse(100,100,40,30);
      ellipse(70,85,60,50);
      ellipse(80,110,50,40);
      
      ellipse(210,70,40,30);
      ellipse(200,85,60,50);
      ellipse(180,70,50,40);
      ellipse(250,100,40,30);
      ellipse(230,85,60,50);
      
      ellipse(340,90,50,40);
      ellipse(365,100,70,60);
      ellipse(355,70,30,20);
      
      ellipse(490,50,50,40);
      ellipse(505,80,70,60);
      ellipse(475,60,30,20);
      
      ellipse(275,50,50,40);
      ellipse(290,40,70,60);
      ellipse(300,65,30,20);
      
      strokeWeight(1);
      stroke(120);
      fill(150);
      ellipse(125,50,40,40);
    } else {
      background(#1FCEC7);
      //Clouds and sun rays
      strokeWeight(6);
      stroke(#FFBA75,80);
      noFill();
      ellipse(125,50,75,75);
      
      strokeWeight(3);
      stroke(#FFD126,70);
      ellipse(125,50,80,80);
      
      noStroke();
      fill(250);
      
      ellipse(70,100,40,30);
      ellipse(40,85,60,50);
      ellipse(50,110,50,40);
  
      ellipse(390,90,50,40);
      ellipse(415,100,70,60);
      ellipse(405,70,30,20);
      
      ellipse(255,50,50,40);
      ellipse(270,40,70,60);
      ellipse(280,65,30,20);
      
      fill(#FFD126);
      ellipse(125,50,60,60);
    }
    
    //Water
    fill(#3B43D9);
    quad(0,250,800,250,800,500,0,500);
    
    //Beach
    fill(#FFEF7A);
    quad(420,250,800,250,800,500,470,500);
    
    //Cliffs
    strokeWeight(3);
    stroke(#D2651E);
    fill(#924F23);
    beginShape();
      vertex(420,250);
      vertex(435,210);
      vertex(460,180);
      vertex(500,100);
      vertex(520,0);
      vertex(800,0);
      vertex(800,250);
    endShape(CLOSE);
    beginShape();
      vertex(580,250);
      vertex(600,200);
      vertex(650,160);
      vertex(665,145);
      vertex(675,150);
      vertex(700,165);
      vertex(750,205);
      vertex(775,250);
    endShape(CLOSE);
    
    //Rocks
    strokeWeight(1);
    stroke(#5D5854);
    fill(#8B827D);
    ellipse(480,250,60,30);
    ellipse(540,225,40,80);
    for (int i = 420; i < 800; i += 100) {
     if (i < 500) {
       ellipse(i,225,25,80);
     } else if (i < 600) {
       ellipse(i,225,35,100);
     } else {
       ellipse(i,230,45,60);
     }
    }
    ellipse(435,250,10,10);
    ellipse(425,255,15,15);
    ellipse(415,260,20,15);
    ellipse(750,245,50,30);
    ellipse(720,250,30,30);
    ellipse(650,250,80,35);
    
    //Wave
    stroke(#00E0FF);
    fill(#0377B6);
    beginShape();
    vertex(waveX,500);
    vertex(waveX+100,400);
    vertex(waveX+200,300);
    vertex(waveX+400,200);
    vertex(waveX+500,150);
    vertex(waveX+650,200);
    vertex(waveX+700,225);
    vertex(waveX+650,250);
    vertex(waveX+500,300);
    vertex(waveX+400,500);
    endShape(CLOSE);
    beginShape();
    vertex(waveX+100,500);
    vertex(waveX+200,400);
    vertex(waveX+400,275);
    vertex(waveX+600,200);
    vertex(waveX+700,150);
    vertex(waveX+850,200);
    vertex(waveX+900,225);
    vertex(waveX+850,250);
    vertex(waveX+700,300);
    vertex(waveX+600,500);
    endShape(CLOSE);
    waveX += speedX;
    
    if(waveX > width){
      waveX = -1000;
    }
    if(pressedKeyState == 1){
      if(key == sKey){
      waveX -= speedX;
    } 
  }
  }
  
  void keyPressed(){
    pressedKey = pressedKey + 1;
    pressedKeyState = (pressedKey % 2);
  }
    
  void mousePressed(){
    pressedMouse = pressedMouse + 1;
    pressedMouseState = (pressedMouse % 2);
  }
