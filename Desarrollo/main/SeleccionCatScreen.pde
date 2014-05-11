public class SeleccionCatScreen extends Screen {
  
  ListaCategoria listaCategorias;
  PImage bg;
  PApplet applet;
  PFont font;
  Elemento logo;
  Boton botonSalir;
  
  public SeleccionCatScreen(PApplet applet){
      this.applet = applet;
      listaCategorias=new ListaCategoria();
      bg = loadImage("fondo.png");
      bg.resize(Parametros.ANCHO, Parametros.ALTO);
      logo=new Elemento("logo2.png");
      logo.sizeFigura(220, 50);
      
      botonSalir=new Boton("Salir");
  }
  
  void drawImage(){
    background(bg);
    listaCategorias.ubicarXY(250,200);
    logo.ubicarXY(Parametros.ANCHO - 270, Parametros.ALTO - 60);
    
    //titulo
    elementoTitulo();
    
    listaCategorias.getCategorias().get(0).isRastreado(applet,true);
    listaCategorias.getCategorias().get(1).isRastreado(applet,true);
    listaCategorias.getCategorias().get(2).isRastreado(applet,true);
    
    botonSalir.ubicarXY(45,20);
    botonSalir.isRastreado(applet,true);
  }  
  
  private void elementoTitulo()
  {
    font = createFont("Comic Sans MS", 25);
    fill(0,0,0);
    textFont(font);
    textAlign(CENTER);
    text("SELECCIONAR CATEGORIA", Parametros.ANCHO / 2, 70);
  }
  
  void draw(){
    this.drawImage();
  }
  
  void mousePressed() {
    for(int i=0; i < listaCategorias.getCategorias().size() ; i++)
    {
      if(listaCategorias.getCategorias().get(i).isRastreado())
      {
         background(255);
         getAnimationControl().setCurrentScreen(4);
         getAnimationControl().setCatgSeleccionada(listaCategorias.getCategorias().get(i));
         listaCategorias.getCategorias().get(i).cargarSonido(applet,"seleccionarCategoria.wav");
         listaCategorias.getCategorias().get(i).ejecutarSonido();
         listaCategorias=new ListaCategoria();
         break;
      }
    }
    
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
}
