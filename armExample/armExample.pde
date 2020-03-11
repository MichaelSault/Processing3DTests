import shapes3d.utils.*;
import shapes3d.*;
import shapes3d.ShapeGroup;

import processing.opengl.*;

float left = 4.7;
float up = 0.0;
float turn = 0.0;
float left1 = 0.0;
float up1 = 0.0;
float turn1 = 0.0;
float forward = 250.0;
float sideways = 0;
Box claw;
Box arm;
Box stand;

Box base;


void setup() {
  fullScreen(P3D);
  noFill();
  
  claw = new Box(50,100,50);
  claw.fill(randomColor());
  
  arm = new Box(40, 40, 250);
  arm.fill(randomColor());
  
  stand = new Box(50, 125, 50);
  stand.fill(randomColor());
  
  base = new Box(200, 50, 200);
  base.fill(randomColor());
}

void draw() {
  background(0);
  keyPressedIsCheckedContinuusly();
  pushMatrix();
  translate(width/2, height/2+200, -200);
  
  //draw base
  translate(sideways, 0, forward);
  base.draw(getGraphics());
 
  translate(0, -75, 0);
  rotateY(left); //yrot);
  stand.draw(getGraphics());
  translate(0, -50, 0);
  rotateX(up);
  translate(0, 0, 110);
  stroke(255, 0, 0);
  arm.draw(getGraphics());
  
  rotateZ(turn); //zrot);
  translate(0, 0, 150);
  stroke(255);
  claw.draw(getGraphics());
  
  popMatrix();
  
  
} 

//=======================================================================
void keyPressedIsCheckedContinuusly() {
 
  if (keyPressed) {
    if (key == '7'){
      turn += 0.01;
    } else if (key == '9'){
        turn -= 0.01;
    } else if (key == '4'){
      if ((left >= -0.1) && (left < 6.28)){
        left += 0.01;
        println("rad:" + left);
       
      }
    } else if (key == '6'){
      if ((left > 0) && (left <= 6.29)){
        left -= 0.01;
        println("rad:" + left);
      }
    } else if (key == '8'){
      if (up < 0.78){
        up += 0.01;
      }
    } else if (key == '5'){
      if (up > 0.0){
        up -= 0.01;
      }
    } else if ((key == 's')||(key == 'S')){
      if (forward < 500){
        forward += 1;
      }
    } else if ((key == 'w')||(key == 'W')){
      if (forward > 0){
        forward -= 1;
      }
    } else if ((key == 'a')||(key == 'A')){
      if (sideways > -250){
        sideways -= 1;
      }
    } else if ((key == 'd')||(key == 'D')){
      if (sideways < 250){
        sideways += 1;
      }
    }
  }
  
}

//==========================================================================
int randomColor(){
  return color(random(0,255), random(0,255), random(0,255));
}
