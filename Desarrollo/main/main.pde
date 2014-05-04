import ddf.minim.*;

AnimationControl control;

void setup() {
  frame.setTitle("PlayClass");
  size(Parametros.ANCHO, Parametros.ALTO);
  control = new AnimationControl(0);
  
  /*MenuScreen menu = new MenuScreen("menu.mp3", 1.8f);
  
  ChapterMenuScreen chapter = new ChapterMenuScreen("chapterMenu.mp3", 1.8f);*/
  
  SeleccionCatScreen seleccionCat = new SeleccionCatScreen(this);
  /*Chapter1Part2Screen chapter1p2 = new Chapter1Part2Screen("musicCap1part3.mp3", 1.8f, "voiceCap1part2.mp3");
  Chapter1Part3Screen chapter1p3 = new Chapter1Part3Screen("musicCap1part3.mp3", 1.8f, "voiceCap1part3.mp3");
  Chapter2Part1Screen chapter2p1 = new Chapter2Part1Screen("musicCap1part1.mp3", 1.8f, "voiceCap2part1.mp3");
  Chapter2Part2Screen chapter2p2 = new Chapter2Part2Screen("musicCap1part1.mp3", 1.8f, "voiceCap2part2.mp3");
  Chapter3Part1Screen chapter3p1 = new Chapter3Part1Screen("musicCap1part3.mp3", 1.8f, "voiceCap3part1.mp3");*/
  
  /*control.insertScreen(splash);
  control.insertScreen(splash2);
  control.insertScreen(menu);
  control.insertScreen(chapter);*/
  control.insertScreen(seleccionCat);
  /*control.insertScreen(chapter1p2);
  control.insertScreen(chapter1p3);
  control.insertScreen(chapter2p1);
  control.insertScreen(chapter2p2);
  control.insertScreen(chapter3p1);*/
}

void draw() {
  control.drawCurrentScreen();
}

void mousePressed() {
  control.clickOnCurrentScreem();
}









































/*import ddf.minim.*;

Pizarra pizarra;
ListaCategoria listik;

//final PGraphics pg = createGraphics(16, 16, JAVA2D);  
String nombre;
  
void setup() {
  size(1200, 680);*/
  /*pizarra=new Pizarra(new Categoria(Parametros.FRUTAS));
  pizarra.cargarSonido(this,"seleccionarCategoria.wav");
  pizarra.ubicarXY(300,100);*/
  
  /*pg.beginDraw();
  pg.image(loadImage("logo.png"), 0, 0, 16, 16); //16dpi
  pg.endDraw();*/
  
 /* frame.setTitle("PlayClass");
  //frame.setIconImage(getToolkit().getImage("sketch.ico"));
  //frame.setIconImage(pg.image);
  nombre="";
  
  listik=new ListaCategoria(true);
  listik.ubicarXY(100,100);
  
}

void draw() {
  

}*/

/*void mouseClicked() {
  pizarra.agregarObjeto();
  
  pizarra.ejecutarSonido();*/
    //pizarra.cambiarCategoria(new Categoria(Parametros.ANIMALES));
    /*for(int j=0; j < pizarra.getObjetosPizarra().size(); j++)
    {
        println(pizarra.getObjetosPizarra().get(j).getNombre());
    }
    println();
    println();*/
//}

/*void keyReleased() {*/
      /*if(activar)
      {*/
       /* if (key != CODED) {
          switch(key) {
            case BACKSPACE:
              nombre = nombre.substring(0,max(0,nombre.length()-1));
              Objeto oon= pizarra.getObjetosPizarra().get(0);
              if(oon != null)
              {
                pizarra.getObjetosPizarra().get(0).setNombre(nombre);
              }
              break;
            default:
              nombre += key;
              
              println(pizarra.getObjetosPizarra().size());
              Objeto oon2= pizarra.getObjetosPizarra().get(0);
              if(oon2 != null)
              {
                pizarra.getObjetosPizarra().get(0).setNombre(nombre);
              }
          }
        }
      //}
    }*/
