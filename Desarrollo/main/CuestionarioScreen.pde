public class CuestionarioScreen extends Screen {
  
  PImage bg;
  PApplet applet;
  int siguienteScreen = 1;
  PFont font;
  Elemento logo;
  Cinta cinta;
  boolean fondoDibujado;
  PFont fontStyle;
  Boton botonNext;
  Boton botonSalir;
  Pizarra pizarra;
  
  public CuestionarioScreen(PApplet applet){
      this.applet = applet;
      bg = loadImage("fondo.png");
      bg.resize(Parametros.ANCHO, Parametros.ALTO);
      logo=new Elemento("logo2.png");
      logo.sizeFigura(220, 50);
      cinta = new Cinta(applet);
      
      botonNext=new Boton("Continuar");
      botonSalir=new Boton("Salir");
  }
  
  void drawImage(){
    if(!fondoDibujado)
    {
      if(pizarra == null)
      {
         pizarra = getAnimationControl().getPizarraLlena(); 
      }
      background(bg);
      logo.ubicarXY(Parametros.ANCHO - 270, Parametros.ALTO - 60);
      cinta.ubicarXY( ((Parametros.ANCHO / 2) - ((pizarra.getFigAncho()/2)/2)) - 5, Parametros.ALTO - 85);
      
      pizarra.setFigAlto(getAnimationControl().getPizarraLlena().getFigAlto() + 220);
      pizarra.renderizarPizarra(30);
      
      //Dibuja el titulo
      elementoTitulo();
      
      fondoDibujado = true;
    }
    
    botonNext.ubicarXY(1000,490);
    botonNext.isRastreado(applet,true);
    
    botonSalir.ubicarXY(45,20);
    botonSalir.isRastreado(applet,true);
  }  
  
  private void elementoTitulo()
  {
      fontStyle = createFont("Comic Sans MS", 25);
      fill(0,0,0);
      textFont(fontStyle);
      textAlign(CENTER);
      text("DESCRIBE LO QUE VES", Parametros.ANCHO / 2, 70);
  }
  
  void draw(){
    this.drawImage();
  }
  
  void mousePressed() {
    
    //BOTON SALIR
    if(botonSalir.isRastreado())
    {
      
    }
    
    //BOTON SIGUIENTE
    if(botonNext.isRastreado())
    {
      
    }
  }
  
  void keyPressed() {
  }
}
