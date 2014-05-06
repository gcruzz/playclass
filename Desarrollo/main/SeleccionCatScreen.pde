public class SeleccionCatScreen extends Screen {
  
  ListaCategoria listaCategorias;
  PImage bg;
  PApplet applet;
  int siguienteScreen = 1;
  PFont font;
  
  public SeleccionCatScreen(PApplet applet){
      this.applet = applet;
      listaCategorias=new ListaCategoria();
      bg = loadImage("fondo.png");
      bg.resize(Parametros.ANCHO, Parametros.ALTO);
  }
  
  void drawImage(){
    background(bg);
    listaCategorias.ubicarXY(250,200);
    
    //titulo
    font = createFont("Comic Sans MS", 25);
    fill(0,0,0);
    textFont(font);
    textAlign(CENTER);
    text("SELECCIONAR CATEGORIA", Parametros.ANCHO / 2, 110);
    
    listaCategorias.getCategorias().get(0).isRastreado(applet,true);
    listaCategorias.getCategorias().get(1).isRastreado(applet,true);
    listaCategorias.getCategorias().get(2).isRastreado(applet,true);
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
         getAnimationControl().setCurrentScreen(siguienteScreen);
         getAnimationControl().setCatgSeleccionada(listaCategorias.getCategorias().get(i));
         listaCategorias.getCategorias().get(i).cargarSonido(applet,"seleccionarCategoria.wav");
         listaCategorias.getCategorias().get(i).ejecutarSonido();
         listaCategorias=new ListaCategoria();
         break;
      }
    }
  } 
 
   void keyReleased() {
  
  } 
}
