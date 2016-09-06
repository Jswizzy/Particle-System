class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  color clr;

  float mass = 1;

  Particle(PVector l) {
    acceleration = new PVector(0,0);
    velocity = new PVector(random(-1,1),random(-2,0));
    location = l.copy();
    lifespan = 255.0;
    clr = color(random(255),random(255),random(255));
  }

  void applyForce(PVector force) {
    PVector f = force.copy();
    f.div(mass);
    acceleration.add(f);
  }

  void run() {
    update();
    display();
  }

  // Method to update location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= 2.0;
  }

  // Method to display
  void display() {
    noStroke();
    fill(clr,lifespan);
    ellipse(location.x,location.y,12,12);
  }

  // Is the particle still useful?
  boolean isDead() {
    return lifespan < 0.0;
  }
}
