public class PizarraScreen extends Screen {
  Pizarra pizarra;
  PImage bg;
  PApplet applet;
  
  public PizarraScreen(PApplet applet){
      this.applet = applet;
      bg = loadImage("fondo.png");
      bg.resize(Parametros.ANCHO, Parametros.ALTO);
  }
  
  void drawImage(){
    background(bg);
  }  
  
  void draw(){
    this.drawImage();
  }
  
  void mousePressed() {
  }  
}