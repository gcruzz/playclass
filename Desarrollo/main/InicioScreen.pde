public class InicioScreen extends Screen {
  
  PImage bg;
  PApplet applet;
  Boton botonIniciar;
  
  Robot robotin;
  int i=0;
  
  public InicioScreen(PApplet applet){
      this.applet = applet;
      bg = loadImage("fondo2.png");
      bg.resize(Parametros.ANCHO, Parametros.ALTO);
      
      botonIniciar=new Boton("INICIAR",98,32);
      
      robotin=new Robot();
  }
  
  void drawImage(){
    background(bg);
    
    //i+=3;
    botonIniciar.ubicarXY(922,328);
    botonIniciar.isRastreado(applet,true);
    
    //robotin.ubicarXY(i,300,true);
  }
  
  void draw(){
    this.drawImage();
  }
  
  void mousePressed() {
    
     if(botonIniciar.isRastreado())
      {
          botonIniciar.cargarSonido(applet,"seleccionarCategoria.wav");
          botonIniciar.ejecutarSonido();
          getAnimationControl().setCurrentScreen(3);
      }
  }
  
  void keyPressed() {
  }
  
  void mouseDragged() {
  }
  
  void mouseReleased() {
  }
}
