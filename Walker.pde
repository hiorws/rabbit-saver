class Walker {
  PVector location;
  float size;
  color colour;
  PVector speed = new PVector(0, 0);
  float multiplierX = 0.5;
  float multiplierY = 0.5;
  Walker(PVector _location, float _size, color _colour) {
    size = _size;
    colour = _colour;
    location = _location;
    
  }
  
  void display() {
    noStroke();
    fill(colour);
    ellipse(location.x, location.y, size, size);
  }
  
  void update() {
    speed.x += random(-multiplierX, multiplierX);
    speed.y += random(-multiplierY, multiplierY);
    
    
    
    
    location.x = constrain(location.x, 0, width);
    location.y = constrain(location.y, 0, height);
    location.add(speed);
    
    
    if(location.x > width || location.x < 0) {
      speed.x *= -1;
    }
    
    if(location.y > height || location.y < 0) {
      speed.y *= -1;
    }
    speed.limit(3); 
  }


}
