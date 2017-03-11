class Star{
 private float x;
 private float y;
 private float z;
 
 private float previousZ;
 private final int speed = 20;
 
 Star(){
  this.x = random(-width, width);
  this.y = random(-height, height);
  this.z = random(width);
  this.previousZ = this.z;
 }
 
 void update(){
   this.z = this.z - speed;
   if(this.z < 1){
     this.z = width;
     this.x = random(-width, width);
     this.y = random(-height, height);
     this.previousZ = this.z;
   }
 }
 
 void show(){
   //PRINT CIRCLE
   fill(255);
   noStroke();
   float sx = map(this.x / this.z, 0, 1, 0, width);
   float sy = map(this.y / this.z, 0, 1, 0, height);
   float radius = map(this.z, 0, width, 8, 0); //radius
   ellipse(sx,sy,radius,radius);
   
   //PRINT FAST LINE
   float px = map(this.x / this.previousZ, 0, 1, 0, width);
   float py = map(this.y / this.previousZ, 0, 1, 0, height);
   this.previousZ = this.z;
   stroke(255);
   line(px,py,sx,sy); //line of warping
 }
  
}