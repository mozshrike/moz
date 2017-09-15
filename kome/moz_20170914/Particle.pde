class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  color col;
  
  float lifetime = 200;

  Particle(PVector position_,PVector velocity_) {
    position = position_.copy();
    velocity = velocity_.copy();
    acceleration = new PVector(0, 0.1);
    
    setColor();
  }
  
  void setColor(){
    float r = random(1);
    if(r < 0.33){
      col = #F7F3C3;      
    }else if(r < 0.67){
      col = #DAF2F2;
    }else{
      col = #FCD8BA;
    }
  }

  void run() {
    update();
    display();
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);

    lifetime--;
  }
  void display() {
    rectMode(CENTER);
    pushMatrix();
    translate(position.x, position.y);
    fill(col);
    stroke(200);
    ellipse(0, 0, 10, 10);
    popMatrix();
  }

  boolean isDead() {
    return lifetime < 0;
  }
}

class Capsule extends Particle {
  Capsule(PVector position,PVector velocity) {
    super(position,velocity);
  }
  void setColor(){
    if(random(1) < 0.5){
      col = #F71E30;      
    }else{
      col = #1E35F7;
    }
  }
  

  void display() {
    pushMatrix();
    translate(position.x, position.y);
    rectMode(CORNERS);
    noStroke();
    fill(col);
    float s = 4;
    float r = s*2;
    ellipse(-s, 0, r, r);
    rect(-s, -s, 0, s);
    
    fill(230);
    ellipse(s, 0, r, r);
    rect(s, -s, 0, s);
    popMatrix();
  }
}