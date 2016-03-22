float x=0;
import javax.swing.JOptionPane;
int a;
int b;
void setup(){
 size(600,800);
 String input1 = JOptionPane.showInputDialog("input initial branch number (1-4)");
 a = Integer.parseInt(input1);
 String input2 = JOptionPane.showInputDialog("input maximum branching angle (PI/x)");
 b = Integer.parseInt(input2);
}
void draw(){
  smooth();
  frameRate(2);
  loop();
  newProjection();
}
void mousePressed(){
  noLoop();
  redraw(); 
}
void newProjection(){
  background(30);
  stroke(255);
  text("click to pause", 10, height-10);
  translate(width/2,height);
  branch(1+x);
  x=x+10;
  if(x>height/6){
    x=height/6;
    }
}
void branch(float h){
  float sw=map(h,2,20,1,2);
  strokeWeight(sw);
  float theta3=random(-PI/b,PI/b);
  line(0,0,0,-h);
  translate(0,-h);
  h *=0.7;
  if (h>10){
    if (a==1){
    pushMatrix();
    rotate(theta3);
    branch(h);
    popMatrix();};
    if (a==2){
    pushMatrix();
    rotate(theta3);
    branch(h);
    branch(h);
    popMatrix();};
    if (a==3){
    pushMatrix();
    rotate(theta3);
    branch(h);
    branch(h);
    branch(h);
    popMatrix();};
    if (a==4){
    pushMatrix();
    rotate(theta3);
    branch(h);
    branch(h);
    branch(h);
    branch(h);
    popMatrix();};
  }
}

