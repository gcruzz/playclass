import ddf.minim.*;

AnimationControl control;

void setup() {
  frame.setTitle("PlayClass");
  size(Parametros.ANCHO, Parametros.ALTO);
  control = new AnimationControl(0);
  
  SeleccionCatScreen seleccionCat = new SeleccionCatScreen(this);
  PizarraScreen pizarra = new PizarraScreen(this);
  
  control.insertScreen(seleccionCat);
  control.insertScreen(pizarra);
  
  cursor(HAND);
}

void draw() {
  control.drawCurrentScreen();
}

void mousePressed() {
  control.clickOnCurrentScreem();
}

void keyPressed() {
  control.keyPressedCurrentScreem();
}
