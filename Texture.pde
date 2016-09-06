class Texture extends Particle {
  PImage img;

  Texture(PImage img, PVector l) {
    super(l);
    this.img = img;
  }

  void display() {
    imageMode(CENTER);
    tint(clr,lifespan);
    noStroke();
    image(img, location.x, location.y,  32, 32);
  }
}
