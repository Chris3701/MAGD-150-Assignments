size(500,500);
background(0);

//Background Curves
colorMode(HSB,360,100,100,100);
noFill();
strokeWeight(30);
stroke(200, 100, 100, 50);
bezier(400, 250, 375, 175, 125, 325, 100, 250);
stroke(63, 100, 100, 50);
bezier(400, 150, 375, 175, 125, 325, 100, 150);
stroke(338, 100, 100, 50);
bezier(400, 350, 375, 175, 125, 325, 100, 350);

//Balloons
colorMode(RGB,100);
ellipseMode(CENTER);
//Balloon strings
strokeWeight(4);
stroke(#6D6D6D);
bezier(250,125,235,135,265,145,250,155);
bezier(250,485,235,495,265,505,250,515);
bezier(400,305,385,315,415,325,400,335);
bezier(100,305,85,315,115,325,100,335);
bezier(355,175,370,185,340,195,355,205);
bezier(355,435,370,445,340,455,355,465);
bezier(145,175,160,185,130,195,145,205);
bezier(145,435,160,445,130,455,145,465);
//Yellow
strokeWeight(3);
stroke(#8E8E00);
fill(#D7D700);
triangle(390,305,400,270,410,305);
ellipse(400,250,70,100);
//Orange
stroke(#8E5F00);
fill(#D78F00);
triangle(345,175,355,140,365,175);
ellipse(355,120,70,100);
//Red
stroke(#8E0400);
fill(#D70500);
triangle(240,125,250,90,260,125);
ellipse(250,70,70,100);
//Purple
stroke(#640054);
fill(#980080);
triangle(135,175,145,140,155,175);
ellipse(145,120,70,100);
//Blue
stroke(#0F0F63);
fill(#171797);
triangle(90,305,100,270,110,305);
ellipse(100,250,70,100);
//Teal
stroke(#005555);
fill(#008181);
triangle(135,435,145,400,155,435);
ellipse(145,380,70,100);
//Green
stroke(#007100);
fill(#00AC00);
triangle(240,485,250,450,260,485);
ellipse(250,430,70,100);
//Lime green
stroke(#588500);
fill(#86C900);
triangle(345,435,355,400,365,435);
ellipse(355,380,70,100);

//Hot Air Balloon
rectMode(CENTER);
strokeWeight(2);
strokeCap(ROUND);
stroke(#6D6D6D);
//Suspension cables
line(225,320,230,345);
line(275,320,270,345);
//Burner, fire, and supports
stroke(#8E5F00);
fill(#D78F00);
ellipse(250,326,5,10);
strokeWeight(3);
stroke(30,30,30);
fill(#6D6D6D);
rect(250,332,7,2);
beginShape();
vertex(235,335);
vertex(265,335);
vertex(265,350);
vertex(235,350);
beginContour();
vertex(240,345);
vertex(260,345);
vertex(260,340);
vertex(240,340);
endContour();
endShape(CLOSE);
//Gondola
fill(#A76020);
quad(225,345,275,345,275,375,225,375);
stroke(150,50,90);
fill(220,60,100);
strokeJoin(ROUND);
//Body
quad(162,200,337,200,275,320,225,320);
line(194,260,305,260);
arc(250,200,175,125,PI,TWO_PI);
noFill();
bezier(225,140,170,190,225,290,240,320);
bezier(275,140,330,190,275,290,260,320);
