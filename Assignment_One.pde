size(640,640);
background(3);
ellipseMode(CENTER);
rectMode(CENTER);

//Rocket nose cones
strokeWeight(8);
stroke(150);
fill(100);
ellipse(120,120,150,150);
ellipse(120,520,150,150);
ellipse(520,120,150,150);
ellipse(520,520,150,150);

//Rocket antennas
strokeWeight(8);
fill(200);
line(45,45,65,65);
line(575,65,600,40);
line(40,600,65,575);
line(575,575,600,600);
strokeWeight(4);
ellipse(35,35,40,40);
ellipse(35,605,40,40);
ellipse(605,35,40,40);
ellipse(605,605,40,40);
strokeWeight(6);
point(35,35);
point(35,605);
point(605,35);
point(605,605);

//Rocket thrusters
strokeWeight(8);
fill(100);
strokeJoin(ROUND);
triangle(390,345,420,420,345,390);
triangle(250,295,220,220,295,250);
triangle(295,390,220,420,250,345);
triangle(390,295,420,220,345,250);

//Rocket bodies
fill(200);
rotate(-(QUARTER_PI));
rect(0,263.5,150,175);
rect(0,643.5,150,175);
rotate(HALF_PI);
rect(453.5,190,150,175);
rect(453.5,-190,150,175);
rotate(-(QUARTER_PI));

//Rocket fins
strokeWeight(4);
fill(220);
triangle(410,280,455,235,440,310);
triangle(440,330,455,405,410,360);
triangle(200,330,185,405,230,360);
triangle(200,310,185,235,230,280);
triangle(310,200,235,185,280,230);
triangle(330,200,405,185,360,230);
triangle(330,440,405,455,360,410);
triangle(280,410,235,455,310,440);

//Rocket windows
noStroke();
fill(240);
ellipse(160,160,50,50);
ellipse(160,480,50,50);
ellipse(480,160,50,50);
ellipse(480,480,50,50);
stroke(150);
noFill();
ellipse(160,160,50,50);
ellipse(160,480,50,50);
ellipse(480,160,50,50);
ellipse(480,480,50,50);

//Rocket plumes
noStroke();
fill(100);
rotate(-(QUARTER_PI));
ellipse(0,420,35,55);
ellipse(0,486.5,35,55);
fill(150);
ellipse(0,425,25,45);
ellipse(0,481.5,25,45);
fill(200);
ellipse(0,430,15,35);
ellipse(0,476.5,15,35);
fill(250);
ellipse(0,435,5,25);
ellipse(0,471.5,5,25);
rotate(HALF_PI);
fill(100);
ellipse(453.5,-34,35,55);
ellipse(453.5,34,35,55);
fill(150);
ellipse(453.5,-29,25,45);
ellipse(453.5,29,25,45);
fill(200);
ellipse(453.5,-24,15,35);
ellipse(453.5,24,15,35);
fill(250);
ellipse(453.5,-19,5,25);
ellipse(453.5,19,5,25);
rotate(-(QUARTER_PI));

//Stars
fill(250);
ellipse(100,320,15,30);
ellipse(540,320,15,30);
ellipse(600,250,25,25);
ellipse(40,250,25,25);
ellipse(600,250,20,20);
ellipse(30,280,10,10);
ellipse(610,280,10,10);
ellipse(70,410,25,10);
ellipse(570,410,25,10);
ellipse(150,300,15,15);
ellipse(490,300,15,15);
ellipse(320,50,20,20);
ellipse(320,590,20,20);
ellipse(370,90,15,25);
ellipse(270,90,15,25);
ellipse(370,550,15,25);
ellipse(270,550,15,25);
ellipse(430,30,15,10);
ellipse(210,30,15,10);
ellipse(430,610,15,10);
ellipse(210,610,15,10);
