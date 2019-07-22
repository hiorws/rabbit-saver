color color0 = color(48, 136, 212);
color color1 = color(31, 35, 43);
color color2 = color(40, 44, 54);
color color3 = color(48, 197, 255);
color color4 = color(86, 227, 159);

ArrayList<Walker> walkers = new ArrayList<Walker>();
color[] colors = new color[5];

boolean isTextMode = false;

int numberOfWalker = 100;

PImage rabbit;
float rabbitSize = 25;
void setup() {
  // size(900, 900);
  fullScreen();
  background(color1);
  textSize(108);
  textAlign(CENTER);
  rabbit = loadImage("rabbit.png");
  colors[0] = color0;
  colors[1] = color1;
  colors[2] = color2;
  colors[3] = color3;
  colors[4] = color4;

  generateWalkers();
}

void generateWalkers() {
  for (int i=0; i<numberOfWalker; i++) {
    PVector currentLocation = new PVector(width/2, height/2);
    float randomSize = random(12);
    Walker tempWalker = new Walker(currentLocation, randomSize, getRandomColor());
    walkers.add(tempWalker);
  }
}

void draw() {
  background(color1);


  if (isTextMode) {
    fill(0, 255, 0);
    text("FOLLOW THE WHITE RABBIT!", width/2, height/2);
    image(rabbit, width - rabbitSize, height - rabbitSize, rabbitSize, rabbitSize);
  } else {
    for (Walker w : walkers) {
      w.display();
      w.update();
    }
  }
}

void mousePressed() {

  if (isTextMode) {
    walkers.clear();
    if (mouseX > width - rabbitSize && mouseY > height - rabbitSize) {
      exit();
    }
    isTextMode = false;
    generateWalkers();
  } else {
    isTextMode = true;
  }
}


color getRandomColor() {
  int randomInt = int(random(5));
  color tempColor = colors[randomInt];
  return tempColor;
}
