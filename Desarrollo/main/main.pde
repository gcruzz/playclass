import ddf.minim.*;

AnimationControl control;

void setup() {
  frame.setTitle("PlayClass");
  size(Parametros.ANCHO, Parametros.ALTO);
  control = new AnimationControl(0);
  
  InicioScreen inicio = new InicioScreen(this);
  SeleccionCatScreen seleccionCat = new SeleccionCatScreen(this);
  PizarraScreen pizarra = new PizarraScreen(this);
  CuestionarioScreen cuestionario = new CuestionarioScreen(this);
  
  control.insertScreen(inicio);
  control.insertScreen(seleccionCat);
  control.insertScreen(pizarra);
  control.insertScreen(cuestionario);
  
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
