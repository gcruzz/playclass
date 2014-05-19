public class ExplicacionScreen extends Screen {
  
  PImage bg;
  PApplet applet;
  PFont font;
  Elemento logo;
  Boton botonSalir;
  Diagrama  diagrama;
  ListaPieza tableroPiezas;
  //VARIABLE PARA MANEJAR SONIDO PIEZAS AL DRAG Y DROG
  boolean sonido = true;
  boolean termino;
  
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
    
    if(!diagrama.diagramaLleno())
    {
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
    
    //SI TERMINO DE LLENAR EL DIAGRAMA
    if(!termino)
    {
      if(diagrama.diagramaLleno())
      {
         if(tableroPiezas.validarCorrectas())
         {
             println("UBICADAS CORRECTAMENTE");
         }
         else
         {
             println("ERROR EN EL DIAGRAMA");
         }
         diagrama.cargarSonido(applet, "juegoCompleto.wav");
         diagrama.ejecutarSonido();
         termino = true;
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
    if(!diagrama.diagramaLleno())
    {
        for(int i=0; i < tableroPiezas.getPiezas().size(); i++)
        {
          if(tableroPiezas.getPiezas().get(i).isRastreado() && tableroPiezas.validarUnicaSeleccion())
          {
            tableroPiezas.getPiezas().get(i).setArrastrar(true);
    
            //LIMPIA LA POSICION YA QUE SE ESTA MOVIENDO ------------------------
            tableroPiezas.getPiezas().get(i).setPosicionado(false);
            tableroPiezas.getPiezas().get(i).setCorrecta(false);
            if(tableroPiezas.getPiezas().get(i).getPosicion() >= 0)
            {
              diagrama.getPiezas().get(tableroPiezas.getPiezas().get(i).getPosicion()).setActivo(false);
            }
            tableroPiezas.getPiezas().get(i).setPosicion(-1);
            //-------------------------------------------------------
            break;
          }
        }
    }
  }
  
  void mousePressed() { 
    
    sonido = false;
    
    //BOTON SALIR
    if(botonSalir.isRastreado())
    {
      background(255);
      //getAnimationControl().setCurrentScreen(2);
      botonSalir.cargarSonido(applet,"seleccionarCategoria.wav");
      botonSalir.ejecutarSonido();
    }
    
    if(!diagrama.diagramaLleno())
    {
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
    
  }
  
  void keyPressed() {
  }
  
  void mouseReleased() {
    
    if(!diagrama.diagramaLleno())
    {
      for(int i=0; i < tableroPiezas.getPiezas().size(); i++)
      {
        
        tableroPiezas.getPiezas().get(i).setArrastrar(false);
        
        //RELACION DEL DROP -----------------
          for(int j=0; j < diagrama.getPiezas().size(); j++)
          {
              
             if(tableroPiezas.getPiezas().get(i).isRastreado() && diagrama.getPiezas().get(j).isRastreado(diagrama.getX(), diagrama.getY(),0,0)
             && diagrama.getPiezas().get(j).isActivo() == false)
              {
                  tableroPiezas.getPiezas().get(i).setXY((diagrama.getPiezas().get(j).getX() + diagrama.getX()), (diagrama.getPiezas().get(j).getY() + diagrama.getY()));
                  tableroPiezas.getPiezas().get(i).setPosicionado(true);
                  
                  if(j == 0) {
                    tableroPiezas.getPiezas().get(i).setCorrecta(tableroPiezas.getPiezas().get(i).isClase() == diagrama.getPiezas().get(j).isClase());
                  }
                  else if(j > 0 && j <= 4 ) {
                    tableroPiezas.getPiezas().get(i).setCorrecta(tableroPiezas.getPiezas().get(i).isObjeto() == diagrama.getPiezas().get(j).isObjeto());
                  }
                  else {
                    tableroPiezas.getPiezas().get(i).setCorrecta(tableroPiezas.getPiezas().get(i).isAtributo() == diagrama.getPiezas().get(j).isAtributo());
                  }
                  
                  diagrama.getPiezas().get(j).setActivo(true);
                  tableroPiezas.getPiezas().get(i).setPosicion(j);
                  tableroPiezas.getPiezas().get(i).cargarSonido(applet,"arrastrar.wav");
                  tableroPiezas.getPiezas().get(i).ejecutarSonido();
                  break;
              }
              else if(tableroPiezas.getPiezas().get(i).isRastreado()) 
              {
                 if(tableroPiezas.getPiezas().get(i).getPosicion() >= 0)
                 {
                   if(diagrama.getPiezas().get(tableroPiezas.getPiezas().get(i).getPosicion()).isActivo() == true)
                   {
                     //LIMPIA LA POSICION AL DAR CLICK SOBRE SI MISMO O AL ARRASTRARLO A UN AREA NO VALIDA ----
                     tableroPiezas.getPiezas().get(i).setPosicionado(false);
                     tableroPiezas.getPiezas().get(i).setCorrecta(false);
                     diagrama.getPiezas().get(tableroPiezas.getPiezas().get(i).getPosicion()).setActivo(false);
                     tableroPiezas.getPiezas().get(i).setPosicion(-1);
                     //------------------------------------------------------------------------------------
                     break;
                   }
                 }
              }
         }
         //---------------------------------------
      }
    }
    
    sonido = true;
  }
}
