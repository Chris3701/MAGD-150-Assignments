// Camera Variables
float angle, camSpeed, 
  camX, camY, camZ, 
  lookAtX, lookAtY, lookAtZ, 
  upX, upY, upZ, 
  viewDist, 
  extents = 250;
  
// 3D Object Variables
PImage txtr;
float x, y, z, 
  scale, xRotation, yRotation,
  u, v;
boolean showDiagnosticImages = true;

void setup() {
  surface.setTitle("3D World");
  size(800,800,P3D);
  background(50);
  noStroke();
  
  // Camera specifications
  angle = 0;
  camSpeed = 5.0;
  camX = width / 2.0;
  camY = height / 2.0;
  camZ = viewDist = (height / 2.0) / tan(PI * 60.0 / 360.0);
  lookAtX = x;
  lookAtY = y;
  lookAtZ = 0;
  upX = 0;
  upY = 1;
  upZ = 0;
  
  // Translation, rotation and scale of the cube.
  x = width / 2.0;
  y = height / 2.0;
  z = -500;
  scale = min(width, height) / 3.5;
  xRotation = 0;
  yRotation = 0;
  
  // The coordinates which map a 2-dimensional image
  // to the face of a 3 dimensional object are known
  // as u (the x-axis of the 2D image) and v (the
  // y-axis of the 2D image).

  u = 1;
  v = 1;

  // Since an image of one size and aspect could be
  // mapped to a 3D surface of an entirely different
  // size and aspect - for example, a square image of
  // 400 x 600 pixels could be mapped to a triangle -
  // it is easier to to think of the texture's dimensions
  // as 1:1. This is done with textureMode(NORMAL);

  textureMode(NORMAL);

  // What happens when the u v coordinates exceed 1:1?
  // If the texture is clamped, the excess space will
  // be a streak, but setting textureWrap(REPEAT) will
  // let us tile and pattern a texture.

  textureWrap(REPEAT);
  
  // Load the images which will be fed into the texture(s).
  save("Leaf texture.jpg");
  txtr = loadImage("Leaf texture.jpg");
  noStroke();
}

void draw() {
  background(20);
  ambientLight(220, 150, 170);
  pointLight(127, 255, 127, width, 0, -extents);
  directionalLight(128, 128, 128, 0, 0, -1);
  lightFalloff(1, 0, 0);
  lightSpecular(0, 0, 0);
  // Controls for the camera
  keys();
   
  // The cube rotates based on constant values of 0.01.
  xRotation += 0.01;
  yRotation += 0.01;
  objects();
}

void keys() {
  if (keyPressed) {
    if (y > 0
      && (key == 'w' || key == 'W' || keyCode == UP)) {
      y -= camSpeed;
      lookAtY = y;
    }
    if (x > -extents
      && (key == 'a' || key == 'A' || keyCode == LEFT)) {
      x -= camSpeed;
      lookAtX = x;
    }
    if (y < height - 10
      && (key == 's' || key == 'S' || keyCode == DOWN)) {
      y += camSpeed;
      lookAtY = y;
    }
    if (x < extents
      && (key == 'd' || key == 'D' || keyCode == RIGHT)) {
      x += camSpeed;
      lookAtX = x;
    }
  }
}

void objects(){
  // Translate, rotate and scale.
  pushMatrix();
  translate(x, y, z);
  rotateY(yRotation);
  rotateX(xRotation);
  scale(scale);

  beginShape();

  // The ternary operator is a shortcut for if-else
  // statements. If show diagnostic images is true,
  // then this texture will be the front image;
  // otherwise, it will be the texture.

  texture(showDiagnosticImages ? txtr : txtr);
  vertex(-1, -1, 1, 0, 0);
  vertex(1, -1, 1, 0 + u, 0);
  vertex(1, 1, 1, 0 + u, 0 + v);
  vertex(-1, 1, 1, 0, 0 + v);
  endShape(CLOSE);

  beginShape();
  texture(showDiagnosticImages ? txtr : txtr);
  vertex(1, -1, 1, 0, 0);
  vertex(1, -1, -1, 0 + u, 0);
  vertex(1, 1, -1, 0 + u, 0 + v);
  vertex(1, 1, 1, 0, 0 + v);
  endShape(CLOSE);

  beginShape();
  texture(showDiagnosticImages ? txtr : txtr);
  vertex(1, -1, -1, 0, 0);
  vertex(-1, -1, -1, 0 + u, 0);
  vertex(-1, 1, -1, 0 + u, 0 + v); 
  vertex(1, 1, -1, 0, 0 + v);
  endShape(CLOSE);

  beginShape();
  texture(showDiagnosticImages ? txtr : txtr);
  vertex(-1, -1, -1, 0, 0);
  vertex(-1, -1, 1, 0 + u, 0);
  vertex(-1, 1, 1, 0 + u, 0 + v);
  vertex(-1, 1, -1, 0, 0 + v);
  endShape(CLOSE);

  beginShape();
  texture(showDiagnosticImages ? txtr : txtr);
  vertex(-1, 1, 1, 0, 0);
  vertex(1, 1, 1, 0 + u, 0);
  vertex(1, 1, -1, 0 + u, 0 + v);
  vertex(-1, 1, -1, 0, 0 + v);
  endShape(CLOSE);

  beginShape();
  texture(showDiagnosticImages ? txtr : txtr);
  vertex(-1, -1, -1, 0, 0);
  vertex(1, -1, -1, 0 + u, 0);
  vertex(1, -1, 1, 0 + u, 0 + v);
  vertex(-1, -1, 1, 0, 0 + v);
  endShape(CLOSE);  
  popMatrix();
  
  // Draw the box.
  pushMatrix();
  translate(width * 0.1, height, -height / 2.5);
  rotateX(angle);
  rotateY(angle);
  box(height / 4.5);
  popMatrix();
  
  // Draw the sphere.
  pushMatrix();
  translate(width * 0.95, height, -height / 2.5);
  rotateX(angle);
  rotateY(angle);
  sphere(height / 6.0);
  popMatrix();
}

void mouseReleased() {
  if (mouseButton == LEFT) {
    showDiagnosticImages = !showDiagnosticImages;
  }
}
