import java.util.*;

class ParticleSystem{
  PVector position;
  PVector vel_max;
  PVector vel_min;
  ArrayList<Particle> particles;
  
  boolean cut;
  boolean stop;
  
  ParticleSystem(PVector position_,PVector vel_min_,PVector vel_max_){
    position = position_.copy();
    particles = new ArrayList<Particle>();
    vel_min = vel_min_;
    vel_max = vel_max_;
    cut = true;
    stop = false;
  }
  
  void addParticle(){
    if(!stop){
       PVector velocity = new PVector(random(vel_min.x,vel_max.x),random(vel_min.y,vel_max.y));
      if(random(1) < 0.5){
        particles.add(new Particle(position,velocity));
      }else{
        particles.add(new Capsule(position,velocity));  
      }
    }
  }
  
  void run(){
    if(cut){
      if(random(1)<0.02){
        addParticle();
      }
    }else{
      addParticle();
    }
    
    Iterator<Particle> it = particles.iterator();
    while(it.hasNext()){
      Particle p = it.next();
      p.run();
      if(p.isDead()){
        it.remove();
      }
    }
  }
  
}