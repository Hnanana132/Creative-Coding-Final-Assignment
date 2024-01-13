import controlP5.*;

ControlP5 cp5;
float x = 0, y = 0;
float stepSize = 5.0;
String letters = "Shanghai Jiao Tong University Creative Coding";
int fontSizeMin = 3;
float angleDistortion = 0.0;
int counter = 0;
PFont p;
PImage img;
int photoWidth=0;
int photoHeight=0;
int startX=0;
int startY=0;

void setup() {
  //预设字体
  p = createFont("JJStencil Light.TTF", 20);
  textFont(p);
  //设计迭代1：在设置背景方面，以按键交互取代预先设置
  //size(690, 976);//1.png
  //size(567,800);//2.png
  //size(670,923);//3.png
  fullScreen();
  background(255);
  smooth();
  cursor(CROSS);

  //x = mouseX;
  //y = mouseY;

  textAlign(LEFT);
  
  //按键交互设置
  cp5 = new ControlP5( this );
  cp5.addColorWheel("c" , 250 , 10 , 200 ).setRGB(color(128,0,255))
     .setPosition(0, 0)
    ;
  noStroke();
  cp5.addButton("A")
     .setValue(0)
     .setPosition(0,250)
     .setSize(200,19)
     ;
  cp5.addButton("B")
     .setValue(0)
     .setPosition(0,270)
     .setSize(200,19)
     ;
  cp5.addButton("C")
     .setValue(0)
     .setPosition(0,290)
     .setSize(200,19)
     ;
  cp5.addButton("D")
     .setValue(0)
     .setPosition(0,310)
     .setSize(200,19)
     ;
  //ButtonBar b = cp5.addButtonBar("bar")
  //   .setPosition(0, 0 )
  //   .setSize(400, 20)
  //   .addItems(split("a b c d"," "))
  //   ;
  //   println(b.getItem("a"));
  //b.changeItem("a","text","Blank");
  //b.changeItem("b","text","Picture 1");
  //b.changeItem("c","text","Picture 2");
  //b.changeItem("d","text","Picture 3");
}

int c = color(100);

void draw() {
  fill(c);
  println(cp5.get(ColorWheel.class,"c").getRGB()); 
}

//设计迭代2：在绘制文字时，以鼠标点击拖曳取代追踪滑动轨迹的方式，更符合设计使用场景
//void mouseOver() {
//  x = mouseX;
//  y = mouseY;
//}

void mousePressed() {
  if (x == 0 && y == 0) {
    x = mouseX;
    y = mouseY;
  }
}

void mouseDragged() {

    float d = dist(x, y, mouseX, mouseY);
    //textFont('Georgia');
    textSize(fontSizeMin+d/2);
    char newLetter = letters.charAt(counter);
    stepSize = textWidth(newLetter);

    if (d > stepSize) {
      float angle = atan2(mouseY-y, mouseX-x);

      pushMatrix();
      translate(x, y);
      rotate(angle + random(angleDistortion));
      text(newLetter, 0, 0);
      popMatrix();

      counter++;
      if (counter > letters.length()-1) counter = 0;

      x = x + cos(angle) * stepSize;
      y = y + sin(angle) * stepSize;
    }
}

void mouseReleased() {
  x = 0;
  y = 0;
}

//键盘交互
void keyPressed() {
  // angleDistortion ctrls arrowkeys up/down
  if (keyCode == DELETE || keyCode == BACKSPACE) background(255);
  if (keyCode == UP) angleDistortion += 0.1;
  if (keyCode == DOWN) angleDistortion -= 0.1;
  if (keyCode == 's' || keyCode == 'S') saveFrame();
}

//Button按钮函数
public void A(){
  background(255);
}

public void B(){
  img = loadImage("1.png");
  //img.resize(width,height);
  photoWidth  = img.width;
  photoHeight = img.height;
  if(photoWidth>photoHeight)
  {
    photoHeight = (int)map(photoHeight,0,photoWidth,0,800);
    photoWidth  = 800;
    startX = 0;
    startY = (int)((700-photoHeight)/2.0);
  }
  else
  {
    photoWidth  = (int)map(photoWidth,0,photoHeight,0,800);
    photoHeight = 800;
    startY = (int)((700-photoWidth)/2.0);
    startX = 700;
  }
  background(255);
  image(img, startX, startY,photoWidth,photoHeight);
  //image(img,0,0);
}

public void C(){
  img = loadImage("2.png");
  //img.resize(width,height);
  photoWidth  = img.width;
  photoHeight = img.height;
  if(photoWidth>photoHeight)
  {
    photoHeight = (int)map(photoHeight,0,photoWidth,0,800);
    photoWidth  = 800;
    startX = 0;
    startY = (int)((700-photoHeight)/2.0);
  }
  else
  {
    photoWidth  = (int)map(photoWidth,0,photoHeight,0,800);
    photoHeight = 800;
    startY = (int)((700-photoWidth)/2.0);
    startX = 700;
  }
  background(255);
  image(img, startX, startY,photoWidth,photoHeight);
  //image(img,0,0);
}

public void D(){
  img = loadImage("3.png");
  //img.resize(width,height);
  photoWidth  = img.width;
  photoHeight = img.height;
  if(photoWidth>photoHeight)
  {
    photoHeight = (int)map(photoHeight,0,photoWidth,0,800);
    photoWidth  = 800;
    startX = 0;
    startY = (int)((700-photoHeight)/2.0);
  }
  else
  {
    photoWidth  = (int)map(photoWidth,0,photoHeight,0,800);
    photoHeight = 800;
    startY = (int)((700-photoWidth)/2.0);
    startX = 700;
  }
  background(255);
  image(img, startX, startY,photoWidth,photoHeight);
  //image(img,0,0);
}
