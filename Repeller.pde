class Repeller {
  PVector location;
  float r = 10;
  float strenght = 100;
  color c;

  Repeller(float x, float y) {
    location = new PVector(x, y);
    c = color(random(255), random(255), random(255));
  }

  void display() {
    noStroke();
    fill(c);
    ellipse(location.x,location.y,r*2,r*2);
  }

  PVector repel(Particle p) {
    PVector dir = PVector.sub(location, p.location);
    float d = dir.mag();
    d = constrain(d, 5, 100);
    dir.normalize();
    float force = -1 * strenght / (d * d);
    dir.mult(force);
    return dir;
  }
}
