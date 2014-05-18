public class ExplicacionScreen extends Screen {
  
  PImage bg;
  PApplet applet;
  PFont font;
  Elemento logo;
  Boton botonSalir;
  Diagrama  diagrama;
  Pieza pieza;
  ListaPieza tableroPiezas;
  //VARIABLE PARA MANEJAR SONIDO PIEZAS AL DRAGY DROG
  boolean sonido = true;
  
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
      
      tableroPiezas=new ListaPieza();
  }
  
  void drawImage(){
    moverTodo();
    
    //EFECTO NEGRILLA PIEZAS -----------------------------------
    for(int i=0; i < tableroPiezas.getPiezas().size(); i++)
    {
      if(tableroPiezas.getPiezas().get(i).isRastreadoSound(applet,sonido))
      {
        for(int j=0; j < 10; j++)
        {
           tableroPiezas.getPiezas().get(i).ubicar();
        }

        break;
      }
    }
    //--------------------------------------------------------
    
    for(int i=0; i < tableroPiezas.getPiezas().size(); i++)
    {
      if(tableroPiezas.getPiezas().get(i).isArrastrado())
      {
        moverTodo();
        tableroPiezas.getPiezas().get(i).ubicarMvto();
        break;
      }
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
    
    //cargar tablero y mapa conceptual
    diagrama.ubicarXY((Parametros.ANCHO/2),68);
    tableroPiezas.ubicarXY(( (Parametros.ANCHO + (diagrama.getFigAncho() / 2)) - Parametros.ANCHO ),93);
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
    for(int i=0; i < tableroPiezas.getPiezas().size(); i++)
    {
      if(tableroPiezas.getPiezas().get(i).isRastreado() && tableroPiezas.validarUnicaSeleccion())
      {
        tableroPiezas.getPiezas().get(i).setArrastrar(true);
        break;
      }
    }
  }
  
  void mousePressed() { 
    
    sonido = false;
    
    //BOTON SALIR
    if(botonSalir.isRastreado())
    {
      background(255);
      getAnimationControl().setCurrentScreen(2);
      botonSalir.cargarSonido(applet,"seleccionarCategoria.wav");
      botonSalir.ejecutarSonido();
    }
    
    for(int i=0; i < tableroPiezas.getPiezas().size(); i++)
    {
      if(tableroPiezas.getPiezas().get(i).isRastreado())
      {
        tableroPiezas.getPiezas().get(i).cargarSonido(applet,"arrastrar.wav");
        tableroPiezas.getPiezas().get(i).ejecutarSonido();
        break;
      }
    }
  }
  
  void keyPressed() {
  }
  
  void mouseReleased() {
    
    for(int i=0; i < tableroPiezas.getPiezas().size(); i++)
    {
      tableroPiezas.getPiezas().get(i).setArrastrar(false);
    }
    
    sonido = true;
  }
}
