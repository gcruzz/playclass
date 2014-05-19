public class ExplicacionScreen extends Screen {
  
  PImage bg;
  PApplet applet;
  PFont font;
  Elemento logo;
  Boton botonSalir;
  Diagrama  diagrama;
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
      diagrama.setXY((Parametros.ANCHO/2),68);
      
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
    diagrama.ubicar();
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
      
      //RELACION DEL DROP -----------------
        for(int j=0; j < diagrama.getPiezas().size(); j++)
        {
            //if(tableroPiezas.getPiezas().get(i).isRastreado(0,0,Parametros.tamPzAncho / 2, Parametros.tamPzAlto / 2)
           if(tableroPiezas.getPiezas().get(i).isRastreado()
             && diagrama.getPiezas().get(j).isRastreado(diagrama.getX(), diagrama.getY(),0,0) 
          ) 
//              && dist(  (diagrama.getX() + diagrama.getPiezas().get(j).getX())  ,  (diagrama.getY() + diagrama.getPiezas().get(j).getY())  ,mouseX + (diagrama.getPiezas().get(j).getFigAncho() / 2),mouseY + (diagrama.getPiezas().get(j).getFigAlto() / 2)) <= diagrama.getPiezas().get(j).getFigAncho() )
            {
              tableroPiezas.getPiezas().get(i).setXY((diagrama.getPiezas().get(j).getX() + diagrama.getX()), (diagrama.getPiezas().get(j).getY() + diagrama.getY()));
              tableroPiezas.getPiezas().get(i).setPosicionado(true);
              tableroPiezas.getPiezas().get(i).cargarSonido(applet,"arrastrar.wav");
              tableroPiezas.getPiezas().get(i).ejecutarSonido();
              println("sisas "+(j+1));
              break;
            }
       }
       //---------------------------------------
    }
    
    sonido = true;
  }
}
