import java.util.Iterator;

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  ArrayList<PImage> textures;

  ParticleSystem(PVector location) {
    origin = location.copy();
    particles = new ArrayList<Particle>();
  }

  ParticleSystem(PImage img, PVector location) {
    origin = location.copy();
    particles = new ArrayList<Particle>();

    textures = new ArrayList<PImage>();
    textures.add(img);
  }

  ParticleSystem(ArrayList<PImage> imgs, PVector location) {
    origin = location.copy();
    particles = new ArrayList<Particle>();

    textures = imgs;
  }

  void setOrgin(PVector location) {
    origin = location.copy();
  }

  void setOrgin(float x, float y) {
    origin.set(x,y,0);
  }

  void addParticle() {
    if (textures != null) {
      int r = int(random(textures.size()));
      particles.add(new Texture(textures.get(r), new PVector(origin.x, origin.y)));
    } else {
      addParticle(origin.x, origin.y);
    }
  }

  void addParticle(float x, float y) {
    if (textures != null) {
      int r = int(random(textures.size()));
      particles.add(new Texture(textures.get(r), new PVector(origin.x, origin.y)));
    } else {
      particles.add(new Particle(new PVector(x, y)));
    }
  }

  void applyForce(PVector force) {
    for (Particle p: particles) {
      p.applyForce(force);
    }
  }

  void applyRepeller(Repeller r) {
    for (Particle p: particles) {
      PVector force = r.repel(p);
      p.applyForce(force);
    }
  }

  void run() {
    Iterator<Particle> it = particles.iterator();
    while (it.hasNext()) {
      Particle p = it.next();
      p.run();
      if (p.isDead()) {
        it.remove();
      }
    }
  }
}