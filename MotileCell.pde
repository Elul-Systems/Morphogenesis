void setup() {
  size(640, 360);
  //center shape in window
  centerX = width/2;
  centerY = height/2;
  centerXn = width/2;
  centerYn = height/2;
  // initalize frequencies for corner nodes
  for (int i=0; i<nodes; i++){
    frequency[i] = random(5, 12);
  }
  noStroke();
  frameRate(25);
}

void draw() {
  //fade background
  fill(0, 100);
  rect(0,0,width, height);
  drawShape();
  moveShape();
  drawShapen();
  moveShapen();
}


// center point
float centerX = 0, centerY = 0;

float radius = 45, rotAngle = -80;
float accelX, accelY;
float springing = .0009, damping = 0.97;

//corner nodes
int nodes = 8;
float nodeStartX[] = new float[nodes];
float nodeStartY[] = new float[nodes];
float[]nodeX = new float[nodes];
float[]nodeY = new float[nodes];
float[]angle = new float[nodes];
float[]frequency = new float[nodes];

// soft-body dynamics
float organicConstant = 1;


void drawShape() {
  //  calculate node  starting locations
  for (int i=0; i<nodes; i++){
    nodeStartX[i] = centerX+cos(radians(rotAngle))*radius;
    nodeStartY[i] = centerY+sin(radians(rotAngle))*radius;
    rotAngle += 360.0/nodes;
  }

  // draw polygon
  curveTightness(organicConstant);
  fill(0, 0, 240);
  beginShape();
  for (int i=0; i<nodes; i++){
    curveVertex(nodeX[i], nodeY[i]);
  }
  for (int i=0; i<nodes-1; i++){
    curveVertex(nodeX[i], nodeY[i]);
  }
  endShape(CLOSE);
}

void moveShape() {
  //move center point
  float deltaX = mouseX-centerX;
  float deltaY = mouseY-centerY;

  // create springing effect
  deltaX *= springing;
  deltaY *= springing;
  accelX += deltaX;
  accelY += deltaY;

  // move amoeba's center
  centerX += accelX;
  centerY += accelY;

  // slow down springing
  accelX *= damping;
  accelY *= damping;

  // change curve tightness
  organicConstant = 1-((abs(accelX)+abs(accelY))*.1);

  //move nodes
  for (int i=0; i<nodes; i++){
    nodeX[i] = nodeStartX[i]+sin(radians(angle[i]))*(accelX*2);
    nodeY[i] = nodeStartY[i]+sin(radians(angle[i]))*(accelY*2);
    angle[i]+=frequency[i];
  }
}


// center point
float centerXn = 0, centerYn = 0;

float radiusn = 5, rotAnglen = -80;
float accelXn, accelYn;
float springingn = .0009, dampingn = .97;

//corner nodes
int nodesn = 10;
float nodeStartXn[] = new float[nodesn];
float nodeStartYn[] = new float[nodesn];
float[]nodeXn = new float[nodesn];
float[]nodeYn = new float[nodesn];
float[]anglen = new float[nodesn];
float[]frequencyn = new float[nodesn];

// soft-body dynamics
float organicConstantn = 1;


void drawShapen() {
  //  calculate node  starting locations
  for (int i=0; i<nodesn; i++){
    nodeStartXn[i] = centerXn+cos(radians(rotAnglen))*radiusn;
    nodeStartYn[i] = centerYn+sin(radians(rotAnglen))*radiusn;
    rotAnglen += 360.0/nodesn;
  }

  // draw polygon
  curveTightness(organicConstantn);
  fill(0, 0, 200);
  beginShape();
  for (int i=0; i<nodesn; i++){
    curveVertex(nodeXn[i], nodeYn[i]);
  }
  for (int i=0; i<nodesn-1; i++){
    curveVertex(nodeXn[i], nodeYn[i]);
  }
  endShape(CLOSE);
}

void moveShapen() {
  //move center point
  float deltaXn = mouseX-centerXn;
  float deltaYn = mouseY-centerYn;

  // create springing effect
  deltaXn *= springingn;
  deltaYn *= springingn;
  accelXn += deltaXn;
  accelYn += deltaYn;

  // move amoeba's center
  centerXn += accelXn;
  centerYn += accelYn;

  // slow down springing
  accelXn *= dampingn;
  accelYn *= dampingn;

  // change curve tightness
  organicConstantn = 1-((abs(accelXn)+abs(accelYn))*.1);

  //move nodes
  for (int i=0; i<nodesn; i++){
    nodeXn[i] = nodeStartXn[i]+sin(radians(anglen[i]))*(accelXn*2);
    nodeYn[i] = nodeStartYn[i]+sin(radians(anglen[i]))*(accelYn*2);
    anglen[i]+=frequencyn[i];
  }
}

