float angle = 0;
int size = 95; //size of each grid square. Lower than 10 crashes
int cols;
int rows;
Curve[][] curves;


void setup(){
  fullScreen(P2D);
  cols = width / size-1;
  rows = height / size-1;
  curves = new Curve[cols][rows];
  for (int i = 0; i < cols; i++){
    for (int j = 0; j < rows; j++){
      curves[i][j] = new Curve();
    }
  }
}

void draw(){
  background(0);
  float diam = 0.9*size;
  
  //columns
  stroke(255);
  noFill();
  for (int i = 0; i < cols; i++){
    float cx = i*size + 1.5*size;
    float cy = size/2;
    strokeWeight(1);
    stroke(255);
    ellipse(cx,cy,diam,diam);
    float x = diam/2 * cos(angle*(i+1)-HALF_PI);
    float y = diam/2 * sin(angle*(i+1)-HALF_PI);
    strokeWeight(8);
    point(cx+x,cy+y);
    
    stroke(255,255,255,100);
    strokeWeight(2);
    line(cx+x,0,cx+x,height);
    
    for (int j = 0; j < rows; j ++){
      curves[i][j].setX(cx + x);
    }
  }
    
  //rows
  stroke(255);
  noFill();
  for (int j = 0; j < rows; j++){
    float cx = size/2;
    float cy = j*size + 1.5*size;
    strokeWeight(1);
    stroke(255);
    ellipse(cx,cy,diam,diam);
    float x = diam/2 * cos(angle*(j+1)-HALF_PI);
    float y = diam/2 * sin(angle*(j+1)-HALF_PI);
    strokeWeight(8);
    point(cx+x,cy+y);
    
    stroke(255,255,255,100);
    strokeWeight(2);
    line(0,cy+y,width,cy+y);
    
    for (int i = 0; i < cols; i ++){
      curves[i][j].setY(cy + y);
    }
  }
  
  for (int i = 0; i < cols; i++){
    for (int j = 0; j < rows; j++){
      curves[i][j].addPoint();
      curves[i][j].show();
    }
  }
     
  angle +=0.01;
  if (angle > TWO_PI){
    delay(3000); //pause for 3 seconds before reseting
    for (int i = 0; i < cols; i++){
      for (int j = 0; j < rows; j++){
        curves[i][j].reset();
      }
    }
    angle = 0;
    
  }
}
