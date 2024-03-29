PImage[][] chord_icon=new PImage[12][15];//和音に対応したアイコン //<>// //<>//
PImage empty_img, snowman;

int count_true_chord=0;

boolean[][] disp_icon=new boolean[12][15];

boolean[][] isKeying=new boolean[12][8];

boolean[] isKeying_note(boolean b[][]) {
  boolean[] bb=new boolean[12];

  for (int i=0; i<12; i++) {
    bb[i]=false;
    for (int j=0; j<8; j++) {
      if (b[i][j]) {
        bb[i]=true;
      }
    }
  }

  return bb;
}

int limit_12(int n){
  return (n <= 12) ? n : 12 - n;
}

void setup_WanColle() {  
  for (int i=0; i<15; i++) {
    chord_icon[0][i]=loadImage("WanColle/C/"+i+".png");
    chord_icon[1][i]=loadImage("WanColle/Cs/"+i+".png");
    chord_icon[2][i]=loadImage("WanColle/D/"+i+".png");
  }
  empty_img=loadImage("gray.png");
  snowman=loadImage("snowman.png");

  //wancolle_polygon=telop_p7;
  //wancolle_p3=telop_p9;
  //wancolle_p6=telop_p11;
  //wancolle_p8=telop_p13;
  //wancolle_p10=telop_p2;
}

void draw_WanColle() {
  is_display_icon();

  count_true_chord=0;
  for (int i=0; i<12; i++)
    for (int j=0; j<15; j++)
      if (disp_icon[i][j]) 
        count_true_chord++;

  beginShape();
  texture(empty_img);
  vertex(wancolle_polygon.get_apex(0).get_X(), wancolle_polygon.get_apex(0).get_Y(), 0, 0);
  vertex(wancolle_polygon.get_apex(1).get_X(), wancolle_polygon.get_apex(1).get_Y(), empty_img.width, 0);
  vertex(wancolle_polygon.get_apex(2).get_X(), wancolle_polygon.get_apex(2).get_Y(), empty_img.width, empty_img.height);
  vertex(wancolle_polygon.get_apex(3).get_X(), wancolle_polygon.get_apex(3).get_Y(), 0, empty_img.height);
  endShape(CLOSE);

  beginShape();
  texture(empty_img);
  vertex(wancolle_polygon.get_apex(1).get_X(), wancolle_polygon.get_apex(1).get_Y(), 0, 0);
  vertex(wancolle_polygon.get_apex(4).get_X(), wancolle_polygon.get_apex(4).get_Y(), empty_img.width, 0);
  vertex(wancolle_polygon.get_apex(5).get_X(), wancolle_polygon.get_apex(5).get_Y(), empty_img.width, empty_img.height);
  vertex(wancolle_polygon.get_apex(2).get_X(), wancolle_polygon.get_apex(2).get_Y(), 0, empty_img.height);
  endShape(CLOSE);

  beginShape();
  texture(empty_img);
  vertex(wancolle_polygon.get_apex(4).get_X(), wancolle_polygon.get_apex(4).get_Y(), 0, 0);
  vertex(wancolle_polygon.get_apex(6).get_X(), wancolle_polygon.get_apex(6).get_Y(), empty_img.width, 0);
  vertex(wancolle_polygon.get_apex(7).get_X(), wancolle_polygon.get_apex(7).get_Y(), empty_img.width, empty_img.height);
  vertex(wancolle_polygon.get_apex(5).get_X(), wancolle_polygon.get_apex(5).get_Y(), 0, empty_img.height);
  endShape(CLOSE);

  beginShape();
  texture(empty_img);
  vertex(wancolle_polygon.get_apex(6).get_X(), wancolle_polygon.get_apex(6).get_X(), 0, 0);
  vertex(wancolle_polygon.get_apex(8).get_X(), wancolle_polygon.get_apex(8).get_X(), empty_img.width, 0);
  vertex(wancolle_polygon.get_apex(9).get_X(), wancolle_polygon.get_apex(9).get_X(), empty_img.width, empty_img.height);
  vertex(wancolle_polygon.get_apex(7).get_X(), wancolle_polygon.get_apex(7).get_X(), 0, empty_img.height);
  endShape(CLOSE);

  noStroke();
  for (int i=0; i<5; i++) {
    drawChordIcon1(i);
    drawChordIcon2(i);
    if (i!=4)drawChordIcon3(i);
  }

  drawChordIcon4(0);

  for (int i=0; i<count_true_chord/12; i++) {
    drawProgressSnowman(i);
  }
}

void drawChordIcon1(int n) {
  float sS=dist(wancolle_polygon.get_apex(0).get_X(), wancolle_polygon.get_apex(0).get_Y(), wancolle_polygon.get_apex(3).get_X(), wancolle_polygon.get_apex(3).get_Y())/3;
  float para=sS/dist(wancolle_polygon.get_apex(0).get_X(), wancolle_polygon.get_apex(0).get_Y(), wancolle_polygon.get_apex(3).get_X(), wancolle_polygon.get_apex(3).get_Y());

  Point p11111 = new Point(wancolle_polygon.get_apex(0).get_X() + (wancolle_polygon.get_apex(1).get_X() - wancolle_polygon.get_apex(0).get_X()) * n/5, wancolle_polygon.get_apex(0).get_Y() + (wancolle_polygon.get_apex(1).get_Y() - wancolle_polygon.get_apex(0).get_Y()) * n/5);
  Point p22222 = new Point(p11111.get_X() + (wancolle_polygon.get_apex(1).get_X() - wancolle_polygon.get_apex(0).get_X())/5, p11111.get_Y() + (wancolle_polygon.get_apex(1).get_Y() - wancolle_polygon.get_apex(0).get_Y())/5);
  Point p33333 = new Point(wancolle_polygon.get_apex(3).get_X() + (wancolle_polygon.get_apex(2).get_X() - wancolle_polygon.get_apex(3).get_X()) * n/5, wancolle_polygon.get_apex(3).get_Y() + (wancolle_polygon.get_apex(2).get_Y() - wancolle_polygon.get_apex(3).get_Y()) * n/5);
  Point p44444 = new Point(p33333.get_X() + (wancolle_polygon.get_apex(2).get_X() - wancolle_polygon.get_apex(3).get_X())/5, p33333.get_Y() + (wancolle_polygon.get_apex(2).get_Y() - wancolle_polygon.get_apex(3).get_Y())/5);
  Point p55555 = new Point((int)(p11111.get_X() + (p33333.get_X() - p11111.get_X()) * para), (int)(p11111.get_Y() + (p33333.get_Y() - p11111.get_Y()) * para));
  Point p66666 = new Point((int)(p22222.get_X() + (p44444.get_X() - p22222.get_X()) * para), (int)(p22222.get_Y() + (p44444.get_Y() - p22222.get_Y()) * para));
  Point p77777 = new Point((int)(p11111.get_X() + (p33333.get_X() - p11111.get_X()) * para*2), (int)(p11111.get_Y() + (p33333.get_Y() - p11111.get_Y()) * para*2));
  Point p88888 = new Point((int)(p22222.get_X() + (p44444.get_X() - p22222.get_X()) * para*2), (int)(p22222.get_Y() + (p44444.get_Y() - p22222.get_Y()) * para*2));

  if (disp_icon[0][n]) {
    beginShape();
    texture(chord_icon[0][n]);
    vertex(p11111.get_X(), p11111.get_Y(), 0, 0);
    vertex(p22222.get_X(), p22222.get_Y(), chord_icon[0][n].width, 0);
    vertex(p66666.get_X(), p66666.get_Y(), chord_icon[0][n].width, chord_icon[0][n].height);
    vertex(p55555.get_X(), p55555.get_Y(), 0, chord_icon[0][n].height);
    endShape();
  }

  if (disp_icon[1][n]) {
    beginShape();
    texture(chord_icon[1][n]);
    vertex(p55555.get_X(), p55555.get_Y(), 0, 0);
    vertex(p66666.get_X(), p66666.get_Y(), chord_icon[1][n].width, 0);
    vertex(p88888.get_X(), p88888.get_Y(), chord_icon[1][n].width, chord_icon[1][n].height);
    vertex(p77777.get_X(), p77777.get_Y(), 0, chord_icon[1][n].height);
    endShape();
  }

  if (disp_icon[2][n]) {
    beginShape();
    texture(chord_icon[2][n]);
    vertex(p77777.get_X(), p77777.get_Y(), 0, 0);
    vertex(p88888.get_X(), p88888.get_Y(), chord_icon[2][n].width, 0);
    vertex(p44444.get_X(), p44444.get_Y(), chord_icon[2][n].width, chord_icon[2][n].height);
    vertex(p33333.get_X(), p33333.get_Y(), 0, chord_icon[2][n].height);
    endShape();
  }
}

void drawChordIcon2(int n) {
  float sS=dist(wancolle_polygon.get_apex(1).get_X(), wancolle_polygon.get_apex(1).get_Y(), wancolle_polygon.get_apex(4).get_X(), wancolle_polygon.get_apex(4).get_Y())/3;
  float para=sS/dist(wancolle_polygon.get_apex(1).get_X(), wancolle_polygon.get_apex(1).get_Y(), wancolle_polygon.get_apex(4).get_X(), wancolle_polygon.get_apex(4).get_Y());

  Point p11111 = new Point(wancolle_polygon.get_apex(1).get_X() + (wancolle_polygon.get_apex(4).get_X() - wancolle_polygon.get_apex(1).get_X()) * n/5, wancolle_polygon.get_apex(1).get_Y() + (wancolle_polygon.get_apex(4).get_Y() - wancolle_polygon.get_apex(1).get_Y()) * n/5);
  Point p22222 = new Point(p11111.get_X() + (wancolle_polygon.get_apex(4).get_X() - wancolle_polygon.get_apex(1).get_X())/5, p11111.get_Y() + (wancolle_polygon.get_apex(4).get_Y() - wancolle_polygon.get_apex(1).get_Y())/5);
  Point p33333 = new Point(wancolle_polygon.get_apex(2).get_X() + (wancolle_polygon.get_apex(5).get_X() - wancolle_polygon.get_apex(2).get_X()) * n/5, wancolle_polygon.get_apex(2).get_Y() + (wancolle_polygon.get_apex(5).get_Y() - wancolle_polygon.get_apex(2).get_Y()) * n/5);
  Point p44444 = new Point(p33333.get_X() + (wancolle_polygon.get_apex(5).get_X() - wancolle_polygon.get_apex(2).get_X())/5, p33333.get_Y() + (wancolle_polygon.get_apex(5).get_Y() - wancolle_polygon.get_apex(2).get_Y())/5);
  Point p55555 = new Point((int)(p11111.get_X() + (p33333.get_X() - p11111.get_X()) * para), (int)(p11111.get_Y() + (p33333.get_Y() - p11111.get_Y()) * para));
  Point p66666 = new Point((int)(p22222.get_X() + (p44444.get_X() - p22222.get_X()) * para), (int)(p22222.get_Y() + (p44444.get_Y() - p22222.get_Y()) * para));
  Point p77777 = new Point((int)(p11111.get_X() + (p33333.get_X() - p11111.get_X()) * para*2), (int)(p11111.get_Y() + (p33333.get_Y() - p11111.get_Y()) * para*2));
  Point p88888 = new Point((int)(p22222.get_X() + (p44444.get_X() - p22222.get_X()) * para*2), (int)(p22222.get_Y() + (p44444.get_Y() - p22222.get_Y()) * para*2));

  if (disp_icon[0][n+5]) {
    beginShape();
    texture(chord_icon[0][n+5]);
    vertex(p11111.get_X(), p11111.get_Y(), 0, 0);
    vertex(p22222.get_X(), p22222.get_Y(), chord_icon[0][n+4].width, 0);
    vertex(p66666.get_X(), p66666.get_Y(), chord_icon[0][n+4].width, chord_icon[0][n+4].height);
    vertex(p55555.get_X(), p55555.get_Y(), 0, chord_icon[0][n+4].height);
    endShape();
  }

  if (disp_icon[1][n+5]) {
    beginShape();
    texture(chord_icon[1][n+5]);
    vertex(p55555.get_X(), p55555.get_Y(), 0, 0);
    vertex(p66666.get_X(), p66666.get_Y(), chord_icon[1][n+5].width, 0);
    vertex(p88888.get_X(), p88888.get_Y(), chord_icon[1][n+5].width, chord_icon[1][n+5].height);
    vertex(p77777.get_X(), p77777.get_Y(), 0, chord_icon[1][n+5].height);
    endShape();
  }

  if (disp_icon[2][n+5]) {
    beginShape();
    texture(chord_icon[2][n+5]);
    vertex(p77777.get_X(), p77777.get_Y(), 0, 0);
    vertex(p88888.get_X(), p88888.get_Y(), chord_icon[2][n+5].width, 0);
    vertex(p44444.get_X(), p44444.get_Y(), chord_icon[2][n+5].width, chord_icon[2][n+5].height);
    vertex(p33333.get_X(), p33333.get_Y(), 0, chord_icon[2][n+5].height);
    endShape();
  }
}

void drawChordIcon3(int n) {
  float sS=dist(wancolle_polygon.get_apex(4).get_X(), wancolle_polygon.get_apex(4).get_Y(), wancolle_polygon.get_apex(6).get_X(), wancolle_polygon.get_apex(6).get_Y())/3;
  float para=sS/dist(wancolle_polygon.get_apex(4).get_X(), wancolle_polygon.get_apex(4).get_Y(), wancolle_polygon.get_apex(6).get_X(), wancolle_polygon.get_apex(6).get_Y());

  Point p11111 = new Point(wancolle_polygon.get_apex(4).get_X() + (wancolle_polygon.get_apex(6).get_X() - wancolle_polygon.get_apex(4).get_X()) * n/4, wancolle_polygon.get_apex(4).get_Y() + (wancolle_polygon.get_apex(6).get_Y() - wancolle_polygon.get_apex(4).get_Y()) * n/4);
  Point p22222 = new Point(p11111.get_X() + (wancolle_polygon.get_apex(6).get_X() - wancolle_polygon.get_apex(4).get_X())/4, p11111.get_Y() + (wancolle_polygon.get_apex(6).get_Y() - wancolle_polygon.get_apex(4).get_Y())/4);
  Point p33333 = new Point(wancolle_polygon.get_apex(5).get_X() + (wancolle_polygon.get_apex(7).get_X() - wancolle_polygon.get_apex(5).get_X()) * n/4, wancolle_polygon.get_apex(5).get_Y() + (wancolle_polygon.get_apex(7).get_Y() - wancolle_polygon.get_apex(5).get_Y()) * n/4);
  Point p44444 = new Point(p33333.get_X() + (wancolle_polygon.get_apex(7).get_X() - wancolle_polygon.get_apex(5).get_X())/4, p33333.get_Y() + (wancolle_polygon.get_apex(7).get_X() - wancolle_polygon.get_apex(5).get_Y())/4);
  Point p55555 = new Point((int)(p11111.get_X() + (p33333.get_X() - p11111.get_X()) * para), (int)(p11111.get_Y() + (p33333.get_Y() - p11111.get_Y()) * para));
  Point p66666 = new Point((int)(p22222.get_X() + (p44444.get_X() - p22222.get_X()) * para), (int)(p22222.get_Y() + (p44444.get_Y() - p22222.get_Y()) * para));
  Point p77777 = new Point((int)(p11111.get_X() + (p33333.get_X() - p11111.get_X()) * para*2), (int)(p11111.get_Y() + (p33333.get_Y() - p11111.get_Y()) * para*2));
  Point p88888 = new Point((int)(p22222.get_X() + (p44444.get_X() - p22222.get_X()) * para*2), (int)(p22222.get_Y() + (p44444.get_Y() - p22222.get_Y()) * para*2));

  if (disp_icon[0][n+10]) {
    beginShape();
    texture(chord_icon[0][n+10]);
    vertex(p11111.get_X(), p11111.get_Y(), 0, 0);
    vertex(p22222.get_X(), p22222.get_Y(), chord_icon[0][n+10].width, 0);
    vertex(p66666.get_X(), p66666.get_Y(), chord_icon[0][n+10].width, chord_icon[0][n+10].height);
    vertex(p55555.get_X(), p55555.get_Y(), 0, chord_icon[0][n+10].height);
    endShape();
  }

  if (disp_icon[1][n+10]) {
    beginShape();
    texture(chord_icon[1][n+10]);
    vertex(p55555.get_X(), p55555.get_Y(), 0, 0);
    vertex(p66666.get_X(), p66666.get_Y(), chord_icon[1][n+10].width, 0);
    vertex(p88888.get_X(), p88888.get_Y(), chord_icon[1][n+10].width, chord_icon[1][n+10].height);
    vertex(p77777.get_X(), p77777.get_Y(), 0, chord_icon[1][n+10].height);
    endShape();
  }

  if (disp_icon[2][n+10]) {
    beginShape();
    texture(chord_icon[2][n+10]);
    vertex(p77777.get_X(), p77777.get_Y(), 0, 0);
    vertex(p88888.get_X(), p88888.get_Y(), chord_icon[2][n+10].width, 0);
    vertex(p44444.get_X(), p44444.get_Y(), chord_icon[2][n+10].width, chord_icon[2][n+10].height);
    vertex(p33333.get_X(), p33333.get_Y(), 0, chord_icon[2][n+10].height);
    endShape();
  }
}

void drawChordIcon4(int n) {
  float sS=dist(wancolle_polygon.get_apex(6).get_X(), wancolle_polygon.get_apex(6).get_Y(), wancolle_polygon.get_apex(8).get_X(), wancolle_polygon.get_apex(8).get_Y())/3;
  float para=sS/dist(wancolle_polygon.get_apex(6).get_X(), wancolle_polygon.get_apex(6).get_Y(), wancolle_polygon.get_apex(8).get_X(), wancolle_polygon.get_apex(8).get_Y());

  Point p11111 = new Point(wancolle_polygon.get_apex(6).get_X(), wancolle_polygon.get_apex(6).get_Y());
  Point p22222 = new Point(wancolle_polygon.get_apex(8).get_X(), wancolle_polygon.get_apex(8).get_Y());
  Point p33333 = new Point(wancolle_polygon.get_apex(7).get_X(), wancolle_polygon.get_apex(7).get_Y());
  Point p44444 = new Point(wancolle_polygon.get_apex(9).get_X(), wancolle_polygon.get_apex(9).get_Y());
  Point p55555 = new Point((int)(p11111.get_X() + (p33333.get_X() - p11111.get_X()) * para), (int)(p11111.get_Y() + (p33333.get_Y() - p11111.get_Y()) * para));
  Point p66666 = new Point((int)(p22222.get_X() + (p44444.get_X() - p22222.get_X()) * para), (int)(p22222.get_Y() + (p44444.get_Y() - p22222.get_Y()) * para));
  Point p77777 = new Point((int)(p11111.get_X() + (p33333.get_X() - p11111.get_X()) * para*2), (int)(p11111.get_Y() + (p33333.get_Y() - p11111.get_Y()) * para*2));
  Point p88888 = new Point((int)(p22222.get_X() + (p44444.get_X() - p22222.get_X()) * para*2), (int)(p22222.get_Y() + (p44444.get_Y() - p22222.get_Y()) * para*2));

  if (disp_icon[0][n+14]) {
    beginShape();
    texture(chord_icon[0][n+14]);
    vertex(p11111.get_X(), p11111.get_Y(), 0, 0);
    vertex(p22222.get_X(), p22222.get_Y(), chord_icon[0][n+14].width, 0);
    vertex(p66666.get_X(), p66666.get_Y(), chord_icon[0][n+14].width, chord_icon[0][n+14].height);
    vertex(p55555.get_X(), p55555.get_Y(), 0, chord_icon[0][n+14].height);
    endShape();
  }

  if (disp_icon[1][n+14]) {
    beginShape();
    texture(chord_icon[1][n+14]);
    vertex(p55555.get_X(), p55555.get_Y(), 0, 0);
    vertex(p66666.get_X(), p66666.get_Y(), chord_icon[1][n+14].width, 0);
    vertex(p88888.get_X(), p88888.get_Y(), chord_icon[1][n+14].width, chord_icon[1][n+14].height);
    vertex(p77777.get_X(), p77777.get_Y(), 0, chord_icon[1][n+14].height);
    endShape();
  }

  if (disp_icon[2][n+14]) {
    beginShape();
    texture(chord_icon[2][n+14]);
    vertex(p77777.get_X(), p77777.get_Y(), 0, 0);
    vertex(p88888.get_X(), p88888.get_Y(), chord_icon[2][n+14].width, 0);
    vertex(p44444.get_X(), p44444.get_Y(), chord_icon[2][n+14].width, chord_icon[2][n+14].height);
    vertex(p33333.get_X(), p33333.get_Y(), 0, chord_icon[2][n+14].height);
    endShape();
  }
}

void is_display_icon() {
  for (int i=0; i<12; i++) {
    if (isKeying_note(isKeying)[limit_12(3+i)]&&isKeying_note(isKeying)[limit_12(7+i)]&&isKeying_note(isKeying)[limit_12(10+i)])
      disp_icon[i][0]=true;
    if (isKeying_note(isKeying)[limit_12(3+i)]&&isKeying_note(isKeying)[limit_12(6+i)]&&isKeying_note(isKeying)[limit_12(10+i)])
      disp_icon[i][1]=true;
    if (isKeying_note(isKeying)[limit_12(3+i)]&&isKeying_note(isKeying)[limit_12(7+i)]&&isKeying_note(isKeying)[limit_12(11+i)])
      disp_icon[i][2]=true;
    if (isKeying_note(isKeying)[limit_12(3+i)]&&isKeying_note(isKeying)[limit_12(7+i)]&&isKeying_note(isKeying)[limit_12(10)]&&isKeying_note(isKeying)[limit_12(0+i)])
      disp_icon[i][3]=true;
    if (isKeying_note(isKeying)[limit_12(3+i)]&&isKeying_note(isKeying)[limit_12(6+i)]&&isKeying_note(isKeying)[limit_12(10+i)]&&isKeying_note(isKeying)[limit_12(0+i)])
      disp_icon[i][4]=true;
    if (isKeying_note(isKeying)[limit_12(3+i)]&&isKeying_note(isKeying)[limit_12(7+i)]&&isKeying_note(isKeying)[limit_12(10+i)]&&isKeying_note(isKeying)[limit_12(2+i)])
      disp_icon[i][5]=true;
    if (isKeying_note(isKeying)[limit_12(3+i)]&&isKeying_note(isKeying)[limit_12(6+i)]&&isKeying_note(isKeying)[limit_12(10+i)]&&isKeying_note(isKeying)[limit_12(2+i)])
      disp_icon[i][6]=true;
    if (isKeying_note(isKeying)[limit_12(3+i)]&&isKeying_note(isKeying)[limit_12(7+i)]&&isKeying_note(isKeying)[limit_12(10+i)]&&isKeying_note(isKeying)[limit_12(1+i)])
      disp_icon[i][7]=true;
    if (isKeying_note(isKeying)[limit_12(3+i)]&&isKeying_note(isKeying)[limit_12(6+i)]&&isKeying_note(isKeying)[limit_12(10+i)]&&isKeying_note(isKeying)[limit_12(1+i)])
      disp_icon[i][8]=true;
    if (isKeying_note(isKeying)[limit_12(3+i)]&&isKeying_note(isKeying)[limit_12(7+i)]&&isKeying_note(isKeying)[limit_12(11+i)]&&isKeying_note(isKeying)[limit_12(1+i)])
      disp_icon[i][9]=true;
    if (isKeying_note(isKeying)[limit_12(3+i)]&&isKeying_note(isKeying)[limit_12(6+i)]&&isKeying_note(isKeying)[limit_12(9+i)]&&isKeying_note(isKeying)[limit_12(1+i)])
      disp_icon[i][10]=true;
    if (isKeying_note(isKeying)[limit_12(3+i)]&&isKeying_note(isKeying)[limit_12(7+i)]&&isKeying_note(isKeying)[limit_12(10+i)]&&isKeying_note(isKeying)[limit_12(1+i)]&&isKeying_note(isKeying)[limit_12(5+i)])
      disp_icon[i][11]=true;
    if (isKeying_note(isKeying)[limit_12(3+i)]&&isKeying_note(isKeying)[limit_12(6+i)]&&isKeying_note(isKeying)[limit_12(10+i)]&&isKeying_note(isKeying)[limit_12(1+i)]&&isKeying_note(isKeying)[limit_12(5+i)])
      disp_icon[i][12]=true;
    if (isKeying_note(isKeying)[limit_12(3+i)]&&isKeying_note(isKeying)[limit_12(6+i)]&&isKeying_note(isKeying)[limit_12(9+i)]&&isKeying_note(isKeying)[limit_12(0+i)])
      disp_icon[i][13]=true;
    if (isKeying_note(isKeying)[limit_12(3+i)]&&isKeying_note(isKeying)[limit_12(8+i)]&&isKeying_note(isKeying)[limit_12(10+i)])
      disp_icon[i][14]=true;
  }
}

void drawProgressSnowman(int n) {
  Point p5 = new Point(wancolle_polygon.get_apex(10).get_X() + (wancolle_polygon.get_apex(11).get_X() - wancolle_polygon.get_apex(10).get_X()) * n / 15, wancolle_polygon.get_apex(10).get_Y() + (wancolle_polygon.get_apex(11).get_Y() - wancolle_polygon.get_apex(10).get_Y()) * n / 15);
  Point p6 = new Point(p5.get_X() + (wancolle_polygon.get_apex(11).get_X() - wancolle_polygon.get_apex(10).get_X()) / 15, p5.get_Y() + (wancolle_polygon.get_apex(11).get_Y() - wancolle_polygon.get_apex(10).get_Y()) / 15);
  Point p7 = new Point(wancolle_polygon.get_apex(13).get_X() + (wancolle_polygon.get_apex(12).get_X() - wancolle_polygon.get_apex(13).get_X()) * n / 15, wancolle_polygon.get_apex(13).get_Y() + (wancolle_polygon.get_apex(12).get_Y() - wancolle_polygon.get_apex(13).get_Y()) * n / 15);
  Point p8 = new Point(p7.get_X() + (wancolle_polygon.get_apex(12).get_X() - wancolle_polygon.get_apex(13).get_X()) / 15, p7.get_Y() + (wancolle_polygon.get_apex(12).get_Y() - wancolle_polygon.get_apex(13).get_Y()) / 15);

  beginShape();
  texture(snowman);
  vertex(p5.get_X(), p5.get_Y(), 0, 0);
  vertex(p6.get_X(), p6.get_Y(), snowman.width, 0);
  vertex(p8.get_X(), p8.get_Y(), snowman.width, snowman.height);
  vertex(p7.get_X(), p7.get_Y(), 0, snowman.height);
  endShape();
}