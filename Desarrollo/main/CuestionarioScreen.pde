public class CuestionarioScreen extends Screen {
  
  PImage bg;
  PApplet applet;
  PFont font;
  Elemento logo;
  Cinta cinta;
  boolean fondoDibujado;
  PFont fontStyle;
  Boton botonNext;
  Boton botonPregunta;
  Boton botonSalir;
  Pizarra pizarra;
  Cuestionario cuestionario;
  Pregunta pregActual;
  boolean siguientePreg;
  String respuesta;
  
  public CuestionarioScreen(PApplet applet){
      this.applet = applet;
      bg = loadImage("fondo.png");
      bg.resize(Parametros.ANCHO, Parametros.ALTO);
      logo=new Elemento("logo2.png");
      logo.sizeFigura(220, 50);
      cinta = new Cinta(applet);
      cinta.setXY(((Parametros.ANCHO / 2) - ((Parametros.tamPizAncho/2)/2)) - 5, Parametros.ALTO - 85);
      
      respuesta="";
      botonNext=new Boton("Continuar");
      botonPregunta=new Boton(">>",-70);
      botonSalir=new Boton("Salir");
  }
  
  private void valoresPizarra()
  {
      background(bg);
      logo.ubicarXY(Parametros.ANCHO - 270, Parametros.ALTO - 60);
      cinta.renderizar();
      pizarra.renderizarPizarra(30);
      //Dibuja el titulo
      elementoTitulo();
  }
  
  void drawImage(){
    if(!fondoDibujado)
    {
      if(pizarra == null)
      {
         pizarra = getAnimationControl().getPizarraLlena(); 
      }
      
      pizarra.setFigAlto(getAnimationControl().getPizarraLlena().getFigAlto() + 220);
      
      valoresPizarra();
      
      //inicia cuestionario
      cuestionario = new Cuestionario(getAnimationControl().getCatgSeleccionada().getTipoCategoria());
      
      fondoDibujado = true;
      respuesta="";
    }
    
    //UBICAR PREGUNTA EN LA PIZARRA
    if(!siguientePreg)
    {
      pregActual = cuestionario.getPregunta();
      cuestionario.dibujarPregunta(pizarra.getX()+70,300);
      siguientePreg = true;
    }
    
    if(cinta.estaLlena())
    {
      botonNext.ubicarXY(1000,490);
      botonNext.isRastreado(applet,true);
    }
    
    if(!cinta.estaLlena())
    {
      botonPregunta.ubicarXY(820,455);
      botonPregunta.isRastreado(applet,true);
    }
    
    botonSalir.ubicarXY(45,20);
    botonSalir.isRastreado(applet,true);
    
    pregActual.pintarRadios();
  }  
  
  private void elementoTitulo()
  {
      fontStyle = createFont("Comic Sans MS", 25);
      fill(0,0,0);
      textFont(fontStyle);
      textAlign(CENTER);
      text("DESCRIBE LO QUE VES", Parametros.ANCHO / 2, 70);
  }
  
  void draw(){
    this.drawImage();
  }
  
  void mousePressed() {
    
    for(int i=0; i<pregActual.getOpciones().size();i++)
    {
      int tamn = pregActual.getOpciones().get(i).getNombre().trim().length();
      tamn = tamn == 1 ? 2 : tamn;
      
        if( ( pregActual.getOpciones().get(i).isCirculoRastreado() || pregActual.getOpciones().get(i).isRastreado(0,-8,tamn *10,-3) ) && !cinta.estaLlena())
        {
          pregActual.activarRadio(pregActual.getOpciones().get(i));
          pregActual.getOpciones().get(i).cargarSonido(applet,"radioselect.wav");
          pregActual.getOpciones().get(i).ejecutarSonido();
          respuesta = pregActual.getOpciones().get(i).getNombre();
          break;
        }
    }
    
    //BOTON SALIR
    if(botonSalir.isRastreado())
    {
      botonSalir.cargarSonido(applet,"seleccionarCategoria.wav");
      botonSalir.ejecutarSonido();
      clearExit();
      getAnimationControl().setCurrentScreen(2);
    }
    
    //BOTON SIGUIENTE
    if(cinta.estaLlena())
    {
      if(botonNext.isRastreado())
      {
          getAnimationControl().setCurrentScreen(6);
          botonNext.cargarSonido(applet,"seleccionarCategoria.wav");
          botonNext.ejecutarSonido();
      }
    }
    
    //BOTON SIGUIENTE PREGUNTA
    if(!cinta.estaLlena())
    {
      if(botonPregunta.isRastreado())
      {
        if(!respuesta.equals("")){
          cinta.adicionarNota(cuestionario.esCorrecta(respuesta));
          valoresPizarra();
          siguientePreg = false;
          cuestionario.nextPregunta();
          respuesta="";
          
          if(cinta.estaLlena())
          {
            cinta.cargarSonido(applet, "juegoCompleto.wav");
            cinta.ejecutarSonido();
          }
        }
        else
        {
           
        }
      }
    }
  }

  void clearExit()
  {
    pizarra = null;
    respuesta="";
    fondoDibujado = false; 
    siguientePreg = false;
    cinta.resetVal();
  }
  
  void keyPressed() {
  }
  
  void mouseDragged() {
  }
  
  void mouseReleased() {
  }
}
