ParticleSystem ps;
Repeller repeller;
ArrayList<PImage> imgs;

void setup() {
  size(640, 360, P2D);
  imgs = new ArrayList();

  imgs.add(loadImage("texture.png"));
  imgs.add(loadImage("emitter.png"));
  imgs.add(loadImage("particle.png"));
  imgs.add(loadImage("corona.png"));
  imgs.add(loadImage("reflection.png"));

  ps = new ParticleSystem(imgs, new PVector(width/2,50));
  //ps = new ParticleSystem(new PVector(width/2,50));
  repeller = new Repeller(width/2-20,height/2);
}

void draw() {
  background(0);

  blendMode(ADD);

  PVector gravity = new PVector(0,0.1);
  ps.applyForce(gravity);

  ps.applyRepeller(repeller);

  // Option #1 (move the Particle System origin)
  ps.setOrgin(mouseX,mouseY);
  ps.addParticle(mouseX,mouseY);
  ps.addParticle(mouseX,mouseY);
  ps.run();

  repeller.display();

}
