public class Elemento
{
   private String nombre;
   private PImage figura;
   private int ubicacionX;
   private int ubicacionY;
   private AudioPlayer soundPlayer;
   private Minim minim;
   private String urlSonido;
   private String urlFigura;
   private boolean efectoSelect;
   private int figAncho;
   private int figAlto;
   boolean sono;
   private PFont font;
   private boolean mostrarNombre;
    
    public Elemento()
    {
    }
    
    public Elemento(PImage figura)
    {
        this.figura = figura;
    }
    
    public Elemento(String urlFigura)
    {
        this.urlFigura = urlFigura;
        this.figura = loadImage(this.urlFigura);
    }
    
    public Elemento(String nombre, PImage figura)
    {
        this.nombre = nombre;
        this.figura = figura;
    }
    
    public void setMostrarNombre(boolean mostrarNombre)
    {
      this.mostrarNombre = mostrarNombre;
    }
    
    public boolean isMostrarNombre()
    {
      return mostrarNombre;
    }
    
    public String getNombre()
    {
       return nombre.toUpperCase().trim(); 
    }
    
    public String getUrlFigura()
    {
        return urlFigura;  
    }
    
    public void setUrlFigura(String urlFigura)
    {
        this.urlFigura = urlFigura;
        this.figura = loadImage(this.urlFigura);
    }
    
    public PImage getFigura()
    {
      return figura;
    }
    
    public int getFigAlto()
    {
      return figAlto;
    }
    
    public int getFigAncho()
    {
      return figAncho;
    }
    
    public void setFigAlto(int figAlto)
    {
      this.figAlto=figAlto;
    }
    
    public void sizeFigura(int figAncho, int figAlto)
    {
      this.figAncho=figAncho;
      this.figAlto=figAlto;
    }
    
    public void setFigAncho(int figAncho)
    {
      this.figAncho=figAncho;
    }
    
    public void setNombre(String nombre)
    {
      this.nombre = nombre.toUpperCase().trim();
    }
    
    public void setFigura(PImage figura)
    {
      this.figura = figura;
    }
  
    public void ubicarXY(int x,int y)
    {
      ubicacionX = x;
      ubicacionY = y;
      
      if(figura != null)
      {
        image(figura, ubicacionX, ubicacionY, figAncho, figAlto);
      }
      
      displayNombre();
    }
    
    public void ubicarX(int x)
    {
      ubicacionX = x;
      if(figura != null)
      {
        image(figura, ubicacionX, ubicacionY, figAncho, figAlto);
      }
      
      displayNombre();
    }
    
    public void ubicarY(int y)
    {
      ubicacionY = y;
      if(figura != null)
      {
        image(figura, ubicacionX, ubicacionY, figAncho, figAlto);
      }
      
      displayNombre();
    }
    
    public void ubicar()
    {
      if(figura != null)
      {
        if(!efectoSelect)
        {
          image(figura, ubicacionX, ubicacionY, figAncho, figAlto);
        }
        else
        {
          //valores para dar el efecto de agrandado
           image(figura, ubicacionX-3, ubicacionY-3, figAncho + 20, figAlto + 20); 
        }
      }
      
      displayNombre();
    }
    
    public int getX()
    {
       return ubicacionX; 
    }
    
    public int getY()
    {
       return ubicacionY; 
    }
    
    public void setX(int x)
    {
       ubicacionX = x; 
    }
    
    public void setY(int y)
    {
       ubicacionY = y; 
    }
    
    public boolean overRect(int x, int y, int width, int height, boolean efecto)  {
      if (mouseX >= x && mouseX <= x+width && 
          mouseY >= y && mouseY <= y+height) {
        
         if(efecto)
         {
           efectoSelect =true;
           ubicar();
         }
         else
         {
           efectoSelect =false;
         }
        return true;
      } else {
        if(efecto)
         {
            efectoSelect =false;
            ubicar();
         }
         else
         {
           efectoSelect =false;
         }
        return false;
      } 
    }
    
    public boolean overRect(int x, int y, int width, int height,PApplet applet, boolean efecto)  {
     
      if (mouseX >= x && mouseX <= x+width && 
          mouseY >= y && mouseY <= y+height) {
        
         if(efecto)
         {
           efectoSelect =true;
           ubicar();
           if(!sono)
           {
             sonidoEfecto(applet);
             sono = true;
           }
         }
         else
         {
           efectoSelect =false;
         }
        return true;
        
      } else {
        sono = false;
        if(efecto)
         {
            efectoSelect =false;
            ubicar();
         }
         else
         {
           efectoSelect =false;
         }
         
        return false;
      } 
    }
    
    public boolean isRastreado(){
     return overRect(ubicacionX, ubicacionY, figAncho, figAlto,false); 
    }
    
    public boolean isRastreado(PApplet applet, boolean efecto){
      //efecto de agrandado
     return overRect(ubicacionX, ubicacionY, figAncho, figAlto, applet, efecto); 
    }
    
    public void cargarSonido(PApplet applet, String urlSonido)
    {
        minim = new Minim(applet);
        this.urlSonido = urlSonido;
    }
    
    public void ejecutarSonido(){
      try
      {
        soundPlayer = minim.loadFile(urlSonido);
        soundPlayer.play();
      }
      catch(Exception e)
      {
          e.printStackTrace();
      }    
  }
  
   public void sonidoEfecto(PApplet applet){
      try
      {
        minim = new Minim(applet);
        soundPlayer = minim.loadFile("click.mp3");
        soundPlayer.play();
      }
      catch(Exception e)
      {
          e.printStackTrace();
      }    
  }
  
  private void displayNombre()
  {
    if(mostrarNombre)
    {
        if(nombre!=null && !nombre.toString().replaceAll(" +","").trim().equals(""))
        {
          font = createFont("Arial Bold", 15);
          fill(0,0,0);
          textFont(font);
          textAlign(CENTER);
          text(nombre, ubicacionX + (figAncho / 2), ubicacionY + figAlto + 30);
        }
    }
  }
}
