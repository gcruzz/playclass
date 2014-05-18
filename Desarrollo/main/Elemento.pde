public class Elemento
{
   private String nombre;
   private PImage figura;
   private PImage figuraEfecto;
   private int ubicacionX;
   private int ubicacionY;
   private AudioPlayer soundPlayer;
   private AudioPlayer soundEfecto;
   private Minim minim;
   private String urlSonido;
   private String urlFigura;
   private boolean efectoSelect;
   private int figAncho;
   private int figAlto;
   private boolean sono;
   private boolean mostrarNombre;
   private boolean modoBoton;
   private boolean editarNombre;
   private boolean activo;
   private int _x;
   private int _y;
    
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
    
    public Elemento(String nombre, boolean modoBoton)
    {
        this.nombre = nombre;
        this.modoBoton = modoBoton;
    }
    
    public void setActivo(boolean activo)
    {
      this.activo = activo;
    }
    
    public boolean isActivo()
    {
      return activo;
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
       return nombre;
    }
    
    public void setMinim(Minim minim)
    {
       this.minim=minim;
    }
    
    public Minim getMinim()
    {
       return minim;
    }
    
    public String getUrlFigura()
    {
        return urlFigura;  
    }
    
    public void setUrlFigura(String urlFigura)
    {
       if(figura == null)
       {
          this.urlFigura = urlFigura;
          this.figura = loadImage(this.urlFigura);
       }
    }
    
    public void setFiguraEfecto(PImage figuraEfecto)
    {
        this.figuraEfecto = figuraEfecto;
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
      this.nombre = nombre;
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
            if(!modoBoton)
            {          
             //valores para dar el efecto de agrandado
             image(figura, ubicacionX-3, ubicacionY-3, figAncho + 20, figAlto + 20);
            }
            else
            {
               image(figuraEfecto, ubicacionX, ubicacionY, figAncho, figAlto);  
            } 
        }
      }
      
      displayNombre();
    }
    
    public int get_Y()
    {
       return _y; 
    }
    
    public int get_X()
    {
       return _x; 
    }
    
    public void set_X(int x)
    {
       _x = x; 
    }
    
    public void set_Y(int y)
    {
       _y = y; 
    }
    
    public void set_XY(int x, int y)
    {
       _x = x; 
       _y = y; 
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
    
    public void setXY(int x,int y)
    {
       ubicacionX = x;
       ubicacionY = y; 
    }
    
    public void setY(int y)
    {
       ubicacionY = y; 
    }
    
    boolean overCirculo(int x, int y, int diameter) {
      float disX = x - mouseX;
      float disY = y - mouseY;
      if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
        return true;
      } else {
        return false;
      }
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
    
    public boolean isRastreado(int mx,int my,int masAncho, int masAlto){
     return overRect(ubicacionX + (mx), ubicacionY + (my), figAncho + (masAncho), figAlto + (masAlto),false); 
    }
    
    public boolean isRastreado(boolean efecto){
      //efecto de agrandado
     return overRect(ubicacionX, ubicacionY, figAncho, figAlto, efecto); 
    }
    
    public boolean isRastreado(PApplet applet, boolean efecto){
      //efecto de agrandado
     return overRect(ubicacionX, ubicacionY, figAncho, figAlto, applet, efecto); 
    }
    
    public boolean isCirculoRastreado()
    {
       return overCirculo(ubicacionX,ubicacionY, figAncho);
    }
    
    public void cargarSonido(PApplet applet, String urlSonido)
    {
        if(minim == null)
        {
          minim = new Minim(applet);
        }
        this.urlSonido = urlSonido;
    }
    
    public void ejecutarSonido(){
      try
      {
        soundPlayer = minim.loadFile(urlSonido);
        soundPlayer.play();
        soundPlayer.rewind();
        if(!soundPlayer.isPlaying())
        {
          soundPlayer.close();
        }
      }
      catch(Exception e)
      {
          e.printStackTrace();
      }    
  }
  
  public void sonidoEfecto(PApplet applet)
  {
      try
      {
        if(minim == null)
        {
          minim = new Minim(applet);
        }
        if(soundEfecto == null)
        {
          soundEfecto = minim.loadFile("click.mp3");
        }
        soundEfecto.play();
        soundEfecto.rewind();
        if(!soundEfecto.isPlaying())
        {
          soundEfecto.close();
        }
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
          PFont font = createFont("Comic Sans MS", 15);
          fill(0,0,0);
          textFont(font);
          textAlign(CENTER);
          if(!modoBoton)
          {
            //estado no editable
            if(!editarNombre)
            {
              text(nombre, ubicacionX + (figAncho / 2), ubicacionY + figAlto + 30);
            }
            //estado editable
            else
            {
              nombre = nombre.toUpperCase();
              text(nombre + (frameCount/10 % 2 == 0 ? "_" : ""), ubicacionX + (figAncho / 2), ubicacionY + figAlto + 30);
            }
          }
          else
          {
            text(nombre, ubicacionX + (figAncho / 2), ubicacionY + (figAlto/2)-3);
          }   
        }
        else
        {
            if(editarNombre)
            {
              nombre = nombre.toUpperCase();
              text(nombre.toUpperCase().trim() + (frameCount/10 % 2 == 0 ? "_" : ""), ubicacionX + (figAncho / 2), ubicacionY + figAlto + 30);
            }
        }
    }
  }
  
    public void setEditarNombre(boolean editarNombre)
    {
      this.editarNombre = editarNombre;
    }
    
    public boolean isEditarNombre()
    {
      return editarNombre;
    }
}
