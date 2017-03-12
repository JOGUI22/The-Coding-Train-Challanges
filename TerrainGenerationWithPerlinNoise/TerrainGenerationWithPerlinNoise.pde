int cols,rows;
int scl = 20;
int wCanvas = 1200;
int hCanvas = 1200;

float[][] terrain;
float flying = 0;

void setup(){
  size(600,600, P3D);
  
  cols = wCanvas / scl;
  rows = hCanvas / scl;
  
  //Generate random terrain
  terrain = new float[cols][rows];
}

void draw(){
  
  flying = flying -0.01; //Waves with small number, terrain generator with bigger ones
  float yoff = flying;
   for (int y=0; y<rows; y++){
     float xoff = 0;
    for (int x=0; x<cols; x++){
      terrain[x][y] = map(noise(xoff,yoff),0,1,-100,100);
      xoff += 0.2;
    }
    yoff += 0.2;
   }
  
  background(0);
  stroke(255);
  noFill();
  
  translate(width/2,height/2);
  rotateX(45);
  translate(-wCanvas/2,-hCanvas/2);
  
  for (int y=0; y<rows-1; y++){
    beginShape(TRIANGLE_STRIP);
    for (int x=0; x<cols; x++){
      vertex(x*scl,y*scl,terrain[x][y]);
      vertex(x*scl,(y+1)*scl,terrain[x][y+1]);
    }
    endShape();
  }
 
}