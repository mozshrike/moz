void setup(){
  size(400,400);
  background(255);
}

void draw(){
  strokeWeight(0.5);
  stroke(0,20);
  for(int i=0;i<10;i++){
    line(random(width),random(height),random(width),random(height));
  }
}