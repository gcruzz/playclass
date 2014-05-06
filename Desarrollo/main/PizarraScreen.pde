public class PizarraScreen extends Screen {
  Pizarra pizarra;
  PImage bg;
  PApplet applet;
  boolean unavez;
  Boton botonNext;
  Boton botonCambCatg;
  Boton botonSacar;
  int siguienteScreen = 0;
  
  public PizarraScreen(PApplet applet){
      this.applet = applet;
      bg = loadImage("fondo.png");
      bg.resize(Parametros.ANCHO, Parametros.ALTO);
      
      botonNext=new Boton("Siguiente");
      botonSacar=new Boton("Sacar");
      botonCambCatg=new Boton("Cambiar Categoria", 35);
  }
  
  void drawImage(){
    if(!unavez)
    {
      background(bg);
      pizarra=new Pizarra(getAnimationControl().getCatgSeleccionada());
      pizarra.ubicarXY(245,90);
      unavez = true;
    }
    
    pizarra.getCategoria().ubicarXY((Parametros.ANCHO - Parametros.tamCatgAncho)/2,400);
    
    //botones
    botonSacar.ubicarXY(pizarra.getCategoria().getX(),pizarra.getCategoria().getY() - Parametros.tamBtnAlto);
    botonSacar.isRastreado(applet,true);
    
    botonNext.ubicarXY(1000,490);
    botonNext.isRastreado(applet,true);
    
    botonCambCatg.ubicarXY(45,490);
    botonCambCatg.isRastreado(applet,true);
    
    //redibuja pizarra y objetos agregados para permitir la edicion del texto
    pizarra.renderizarPizarra();
  }  
  
  void draw(){
    this.drawImage();
  }
  
  void mousePressed() {
    
    pizarra.edicionNombreObj(applet);
    
    if(botonNext.isRastreado())
    {
      if(pizarra.validarNombresObjetos()){
        botonNext.cargarSonido(applet,"seleccionarCategoria.wav");
        botonNext.ejecutarSonido();
      }
      else
      {
         
      }
    }
    
    if(botonCambCatg.isRastreado())
    {
      botonCambCatg.cargarSonido(applet,"seleccionarCategoria.wav");
      botonCambCatg.ejecutarSonido();
      
      unavez = false;
      background(255);
      getAnimationControl().setCurrentScreen(siguienteScreen);
    }
    
    if(botonSacar.isRastreado())
    {
        botonSacar.cargarSonido(applet,"seleccionarCategoria.wav");
        botonSacar.ejecutarSonido();
        pizarra.agregarObjeto();
    }
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
}
