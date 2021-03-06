public class PizarraScreen extends Screen {
  Pizarra pizarra;
  PImage bg;
  PApplet applet;
  boolean fondoDibujado;
  Boton botonNext;
  Boton botonCambCatg;
  Boton botonSacar;
  Boton botonSalir;
  boolean cajaVacia;
  boolean cambioCategoria;
  PFont fontStyle;
  Elemento logo;
  
  public PizarraScreen(PApplet applet){
      this.applet = applet;
      bg = loadImage("fondo.png");
      bg.resize(Parametros.ANCHO, Parametros.ALTO);
      
      logo=new Elemento("logo2.png");
      logo.sizeFigura(220, 50);
      
      botonSalir=new Boton("Salir");
      botonNext=new Boton("Continuar");
      botonSacar=new Boton("Sacar");
      botonCambCatg=new Boton("Cambiar Categoria", 35);
  }
  
  void drawImage(){
    if(!fondoDibujado)
    {
      background(bg);
      logo.ubicarXY(Parametros.ANCHO - 270, Parametros.ALTO - 60);
      
      pizarra=new Pizarra(getAnimationControl().getCatgSeleccionada());
      pizarra.ubicarXY(245,90);
      
      //Dibuja el titulo
      elementoTitulo();
      
      pizarra.getCategoria().ubicarXY((Parametros.ANCHO - Parametros.tamCatgAncho)/2,400);
      
      fondoDibujado = true;
    }
    
    //botones
    if(!pizarra.pizarraLlena())
    {
      botonSacar.ubicarXY(pizarra.getCategoria().getX(),pizarra.getCategoria().getY() - Parametros.tamBtnAlto);
      botonSacar.isRastreado(applet,true);
    }
    else
    {
      if(!cajaVacia)
      {
        background(bg);
        logo.ubicarXY(Parametros.ANCHO - 270, Parametros.ALTO - 60);
        elementoTitulo();
        pizarra.getCategoria().ubicarXY((Parametros.ANCHO - Parametros.tamCatgAncho)/2,400);
        cajaVacia = true;
      }
    }
    
    if(pizarra.validarNombresObjetos())
    {
      botonNext.ubicarXY(1000,490);
      botonNext.isRastreado(applet,true);
    }
    else
    {
       background(bg);
       logo.ubicarXY(Parametros.ANCHO - 270, Parametros.ALTO - 60);
       elementoTitulo();
       pizarra.ubicar();
       if(!pizarra.pizarraLlena())
       {
         botonSacar.ubicar();
       }
       pizarra.getCategoria().ubicarXY((Parametros.ANCHO - Parametros.tamCatgAncho)/2,400);
    }
    
    botonSalir.ubicarXY(45,20);
    botonSalir.isRastreado(applet,true);
    
    if(pizarra.getObjetosPizarra().isEmpty())
    {
      botonCambCatg.ubicarXY(45,490);
      botonCambCatg.isRastreado(applet,true);
    }
    else
    {
       if(!cambioCategoria)
       {
          background(bg);
          logo.ubicarXY(Parametros.ANCHO - 270, Parametros.ALTO - 60);
          elementoTitulo();
          pizarra.getCategoria().ubicarXY((Parametros.ANCHO - Parametros.tamCatgAncho)/2,400);
          cambioCategoria = true;
       } 
    }
    
    //redibuja pizarra y objetos agregados para permitir la edicion del texto
    pizarra.renderizarPizarra();
  }  
  
  void draw(){
    this.drawImage();
  }
  
  void clearExit()
  {
    fondoDibujado = false;
    cajaVacia = false;
    cambioCategoria = false;
  }
  
  void mousePressed() {
    //activa o desactiva la edicion del nombre del objeto al cual se le de click
    pizarra.edicionNombreObj(applet);
    
    //BOTON SALIR
    if(botonSalir.isRastreado())
    {
      background(255);
      clearExit();
      getAnimationControl().setCurrentScreen(2);
      botonSalir.cargarSonido(applet,"seleccionarCategoria.wav");
      botonSalir.ejecutarSonido();
    }
    
    //BOTON SIGUIENTE
    if(pizarra.validarNombresObjetos())
    {
      if(botonNext.isRastreado())
      {
        background(255);
        clearExit();
        getAnimationControl().setCurrentScreen(5);
        getAnimationControl().setPizarraLlena(pizarra);
        
        botonNext.cargarSonido(applet,"seleccionarCategoria.wav");
        botonNext.ejecutarSonido();
      }
    }
    
    //BOTON CAMBIAR CATEGORIA
    if(pizarra.getObjetosPizarra().isEmpty())
    {
      if(botonCambCatg.isRastreado())
      {
        botonCambCatg.cargarSonido(applet,"seleccionarCategoria.wav");
        botonCambCatg.ejecutarSonido();
        clearExit();
        background(255);
        getAnimationControl().setCurrentScreen(3);
        getAnimationControl().setCatgSeleccionada(null);
      }
    }
    
    //BOTON SACAR OBJETO DE LA CAJA
    if(!pizarra.pizarraLlena())
    {
      if(botonSacar.isRastreado())
      {
          botonSacar.cargarSonido(applet,"seleccionarCategoria.wav");
          botonSacar.ejecutarSonido();
          pizarra.agregarObjeto();
          
      }
    }
  }  
  
  private void elementoTitulo()
  {
      fontStyle = createFont("Comic Sans MS", 25);
      fill(0,0,0);
      textFont(fontStyle);
      textAlign(CENTER);
      text("PIZARRA DE ELEMENTOS", Parametros.ANCHO / 2, 70);
  }
  
  void keyPressed() {
    if(pizarra.getObjetosPizarra().size() > 0)
      {
        for(int i=0; i < pizarra.getObjetosPizarra().size() ; i++)
        {
          pizarra.getObjetosPizarra().get(i).editandoTexto();
        }
      }
  }
  
  void mouseDragged() {
  }
  
  void mouseReleased() {
  }
}
