public class SeleccionCatScreen extends Screen {
  
  ListaCategoria listaCategorias;
  PImage bg;
  PApplet applet;
  
  public SeleccionCatScreen(PApplet applet){
      this.applet = applet;
      listaCategorias=new ListaCategoria(true);
      bg = loadImage("fondo.png");
      bg.resize(Parametros.ANCHO+100, Parametros.ALTO+100);
  }
  
  void drawImage(){
    bg.resize(Parametros.ANCHO, Parametros.ALTO);
    background(bg);
    listaCategorias.ubicarXY(100,100);
  }  
  
  void draw(){
    this.drawImage();
  }
  
  void mousePressed() {
    if(listaCategorias.getCategorias().get(1).isRastreado())
    {
       listaCategorias.getCategorias().get(1).cargarSonido(applet,"seleccionarCategoria.wav");
       listaCategorias.getCategorias().get(1).ejecutarSonido(); 
    }
  }  
}
