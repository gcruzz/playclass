import ddf.minim.*;
AnimationControl control;

void setup() {
  size(Parametros.ANCHO, Parametros.ALTO);
  frame.setTitle("PlayClass");
  control = new AnimationControl(0);
  
  SplashScreen splash = new SplashScreen(this,"logo.png", "Intro.wav", 6.5f,50,true);
  SplashScreen splash2 = new SplashScreen(this,"logoUniversity.jpg", "Intro2.wav", 1.8f, 100,false);
  InicioScreen inicio = new InicioScreen(this);
  SeleccionCatScreen seleccionCat = new SeleccionCatScreen(this);
  PizarraScreen pizarra = new PizarraScreen(this);
  CuestionarioScreen cuestionario = new CuestionarioScreen(this);
  ExplicacionScreen explicacion = new ExplicacionScreen(this);
  
  /*control.insertScreen(splash);
  control.insertScreen(splash2);
  control.insertScreen(inicio);
  control.insertScreen(seleccionCat);
  control.insertScreen(pizarra);
  control.insertScreen(cuestionario);*/
  control.insertScreen(explicacion);
  
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

void mouseDragged () 
{
  control.mouseDraggedCurrentScreem();
}

void mouseReleased() {
  control.mouseReleasedCurrentScreem();
}
