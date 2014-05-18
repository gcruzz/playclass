public class ExplicacionScreen extends Screen {
  
  PImage bg;
  PApplet applet;
  PFont font;
  Elemento logo;
  Boton botonSalir;
  Diagrama  diagrama;
  
  Pieza pieza;
  int po;
  ListaPieza listPie;
  
  public ExplicacionScreen(PApplet applet){
      this.applet = applet;
      bg = loadImage("fondo.png");
      bg.resize(Parametros.ANCHO, Parametros.ALTO);
      logo=new Elemento("logo2.png");
      logo.sizeFigura(220, 50);
      
      botonSalir=new Boton("Salir");
      
      diagrama = new Diagrama("diagramarelacion.png");
      
      pieza=new Pieza("Sisarras","objeto1.png");
      pieza.set_XY(0,300);
      
      listPie=new ListaPieza();
  }
  
  void drawImage(){
    //moverTodo();
    
    //pieza.ubicarXY(pieza.get_X()+( (Parametros.ANCHO + (diagrama.getFigAncho() / 2)) - Parametros.ANCHO ) ,pieza.get_Y());
    
    diagrama.ubicarXY((Parametros.ANCHO/2),68);
    
    /*if(po == 0)
    {
       moverTodo();*/
       listPie.ubicarXY(20,200);
       po++;
    //}
    /*
    //PIEZA 1
    pieza.ubicarXY(diagrama.getX() + 153 , diagrama.getY() + 19);
    
    //PIEZA 2
    pieza.ubicarXY(diagrama.getX() + 20 , diagrama.getY() + 152);

    //PIEZA 3
    pieza.ubicarXY(diagrama.getX() + 20 + 89 , diagrama.getY() + 152);    
    
    //PIEZA 4
    pieza.ubicarXY(diagrama.getX() + 20 + 178 , diagrama.getY() + 152);
    
    //PIEZA 5
    pieza.ubicarXY(diagrama.getX() + 20 + 267 , diagrama.getY() + 152);
    
    //PIEZA 6
    pieza.ubicarXY(diagrama.getX() - 2 , diagrama.getY() + 275);
    
    //PIEZA 7
    pieza.ubicarXY(diagrama.getX() - 2 + 100 , diagrama.getY() + 275);
    
    //PIEZA 8
    pieza.ubicarXY(diagrama.getX() - 2 + 200 , diagrama.getY() + 275);
    
    //PIEZA 9
    pieza.ubicarXY(diagrama.getX() - 2 + 295 , diagrama.getY() + 275);
    
    //PIEZA 10
    pieza.ubicarXY(diagrama.getX() + 48, diagrama.getY() + 369);
    
    //PIEZA 11
    pieza.ubicarXY(diagrama.getX() + 48 + 184, diagrama.getY() + 369);*/
    
    if(pieza.isArrastrado())
    {
        moverTodo();
        pieza.ubicarMvto();
    }
  }  
  
  void moverTodo()
  {
    background(bg);
    logo.ubicarXY(Parametros.ANCHO - 270, Parametros.ALTO - 60);
    
    //titulo
    elementoTitulo();
        
    botonSalir.ubicarXY(45,20);
    botonSalir.isRastreado(applet,true);
  }
  
  private void elementoTitulo()
  {
    font = createFont("Comic Sans MS", 25);
    fill(0,0,0);
    textFont(font);
    textAlign(CENTER);
    text("ARMAR LA RELACIÓN", Parametros.ANCHO / 2, 70);
  }
  
  void draw(){
    this.drawImage();
  }

  void mouseDragged () 
  {
    if(pieza.isRastreado())
    {
      pieza.setArrastrar(true);
    }
  }
  
  void mousePressed() { 
    //BOTON SALIR
    if(botonSalir.isRastreado())
    {
      background(255);
      getAnimationControl().setCurrentScreen(2);
      botonSalir.cargarSonido(applet,"seleccionarCategoria.wav");
      botonSalir.ejecutarSonido();
    }
  }
  
  void keyPressed() {
  }
  
  void mouseReleased() {
    pieza.setArrastrar(false);
  }
}
