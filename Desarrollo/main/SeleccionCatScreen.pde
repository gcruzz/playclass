public class SeleccionCatScreen extends Screen {
  
  ListaCategoria listaCategorias;
  PImage bg;
  PApplet applet;
  Categoria categoriaSeleccionada;
  
  public SeleccionCatScreen(PApplet applet){
      this.applet = applet;
      listaCategorias=new ListaCategoria(Parametros.VERTICAL);
      bg = loadImage("fondo.png");
      bg.resize(Parametros.ANCHO, Parametros.ALTO);
  }
  
  void drawImage(){
    background(bg);
    listaCategorias.ubicarXY(100,70);
    listaCategorias.getCategorias().get(0).isRastreado(applet,true);
    listaCategorias.getCategorias().get(1).isRastreado(applet,true);
    listaCategorias.getCategorias().get(2).isRastreado(applet,true);
  }  
  
  void draw(){
    this.drawImage();
  }
  
  void mousePressed() {
    for(int i=0; i < listaCategorias.getCategorias().size() ; i++){
      if(listaCategorias.getCategorias().get(i).isRastreado())
      {
         listaCategorias.getCategorias().get(i).cargarSonido(applet,"seleccionarCategoria.wav");
         listaCategorias.getCategorias().get(i).ejecutarSonido(); 
      }
    }
  }  
}
