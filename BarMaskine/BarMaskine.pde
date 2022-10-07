PImage Forside;
PImage Vælgdrink;
PImage information;
float Balls;
int ballsTime  = 0;
Byte state = 0;
int idletime = 0;
Boolean hælder = false;
PImage[] drinks = new PImage[14];
void setup() {
  size(1366, 768);
  frameRate(60);
  Forside = loadImage("Forside.png");
  Vælgdrink = loadImage("Vælg drink.png");
  information = loadImage("Mere information.png");
  Balls=(width-97)/(frameRate*60);
  for (int d = 0; d<drinks.length; d++) {
    drinks[d]= loadImage("drink"+d+".png");
    drinks[d].resize(40, 40);
  }
}
void draw() {
  printArray(drinks);
  println(ballsTime);
  ballsTime += 1;
  if (ballsTime>60*frameRate) {
    ballsTime = 0;
    println("done");
  }
  idletime += 1;
  if (idletime>30*frameRate) {
    state = 0;
    idletime = 0;
  }
  if (state == 0) {
    forside();
  } else if (state == 1) {
    image(Vælgdrink, 0, 0);

  for (int m = 0; m < 14; m ++) {
    ellipse (m*97+45, 59, 60, 60);
    imageMode(CENTER);
    image(drinks[m], m*97+45, 59);
    imageMode(CORNER);
  }
  
  
  
    for (int i = 0; i < 14; i ++) {
    ellipse (i*400-130, 360, 360, 360);
    imageMode(CENTER);
    image(drinks[i], i*400-130, 360);
    imageMode(CORNER);
    }


  } else if (state == 2) {
    image(information, 0, 0);
  } else {
  }
}
void mousePressed() {
  idletime = 0;
  if (hælder) {
    return;
  }
  if (state==0&&mouseX>564&&mouseX<564+249&&mouseY>575&&mouseY<575+78) {
    state = 1;
  } else if (state==1&&mouseX>417&&mouseX<417+228&&mouseY>625&&mouseY<625+96) {
    state = 0;
  } else if (state==1&&mouseX>708&&mouseX<708+228&&mouseY>625&&mouseY<625+96) {
    state = 2;
  } else if (state==2&&mouseX>884&&mouseX<884+140&&mouseY>599&&mouseY<599+77) {
    state = 1;
  } else if (state==2&&mouseX>1050&&mouseX<1050+140&&mouseY>599&&mouseY<599+77&&!hælder) {
    hælder = true;
    println("Hæld!");
    delay(3000);
    println("Færdig!");
    hælder = false;
  }
}
