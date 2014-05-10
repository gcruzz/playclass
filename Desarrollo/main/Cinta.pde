public class Cinta extends Elemento
{   
   private final int limiteCinta = 6;
   private final int tamCintaAncho = 380;
   private final int tamCintaAlto = 50;
   private int bordeX;
   private int bordeY;
   private int dirX;
   private PApplet applet;
   private int distanciaNotas;
   private int correctas;
   private int incorrectas;
   private int cant;
   private Elemento elemento;
   private ArrayList<Elemento> elementos;
    
    public Cinta(PApplet applet)
    {
        super("cinta.png");
        this.applet = applet;
        sizeFigura(tamCintaAncho, tamCintaAlto);
        setNombre("");
        //valores para la margen de la cinta y a partir de ella se posiciona el obj
        bordeX=20;
        bordeY=10;
        //Valor para mantener la distancia al agregar las notas
        distanciaNotas = 30;
        //variable para mantener la sumatoria de x al agregar notas a la cinta
        dirX = getX()+ bordeX;
        //lista de elementos notas
        elementos=new ArrayList<Elemento>();
    }
    
    @Override
    public void ubicarXY(int x,int y)
    {
      setX(x);
      setY(y);
      ubicar();
      //reacomoda x para la rerencia al agregar objetos
      dirX = getX()+ bordeX;
    }
    
    @Override
    public void setXY(int x,int y)
    {
      setX(x);
      setY(y);
      //reacomoda x para la rerencia al agregar objetos
      dirX = getX()+ bordeX;
    }
    
    @Override
    public void ubicarX(int x)
    {
      setX(x);
      ubicar();
      //reacomoda x para la rerencia al agregar objetos
      dirX = getX()+ bordeX;
    }
    
    public void adicionarNota(boolean estado)
    {
        cant++;
        
        if(cant <= limiteCinta)
        {
          elemento=new Elemento();
          
          if(estado)
          {
            elemento.setUrlFigura("correct.png");
            elemento.sizeFigura(30, 30);
            
            correctas++;
            cargarSonido(applet, "RtaCorrecta2.wav");
          }
          else
          {
            elemento.setUrlFigura("error.png");
            elemento.sizeFigura(30, 30);
            
            incorrectas++;
            cargarSonido(applet, "RtaIncorrecta.wav");
          }
          
          elemento.ubicarXY( dirX, getY()+bordeY);
          dirX += (distanciaNotas + elemento.getFigAncho());
          
          elementos.add(elemento);
          
          ejecutarSonido();
        }
    }
    
    public ArrayList<Elemento> getElementos()
    {
      return elementos;
    }
    
    public boolean aprobo(){
      return (correctas >= 4);
    }
    
    public int getCorrectas()
    {
       return correctas; 
    }
    
    public void resetVal()
    {
      correctas = 0;
      incorrectas = 0;
      elementos=new ArrayList<Elemento>();
    }
    
    public void renderizar()
    {
       ubicar();
       if(elementos.size() > 0)
       {
          for(int i=0;i<elementos.size();i++)
          {
             elementos.get(i).ubicar();
          }     
       } 
    }
    public int getInCorrectas()
    {
       return incorrectas; 
    }
    
    public boolean estaLlena()
    {
       return ((correctas+incorrectas) == limiteCinta);
    }
}
