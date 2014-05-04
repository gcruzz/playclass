public class Elemento
{
   private String nombre;
   private PImage figura;
   private int ubicacionX;
   private int ubicacionY;
   private AudioPlayer soundPlayer;
   private Minim minim;
   private String urlSonido;
   
   
   private PFont font;
    
    public Elemento()
    {
    }
    
    public Elemento(PImage figura)
    {
        this.figura = figura;
    }
    
    public Elemento(String nombre, PImage figura)
    {
        this.nombre = nombre;
        this.figura = figura;
    }
    
    public String getNombre()
    {
       return nombre.toUpperCase().trim(); 
    }
    
    public PImage getFigura()
    {
      return figura;
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
        image(figura, ubicacionX, ubicacionY);
      }
    }
    
    public void ubicarX(int x)
    {
      ubicacionX = x;
      if(figura != null)
      {
        image(figura, ubicacionX, ubicacionY);
      }
    }
    
    public void ubicarY(int y)
    {
      ubicacionY = y;
      if(figura != null)
      {
        image(figura, ubicacionX, ubicacionY);
      }
    }
    
    public void ubicar()
    {
      if(figura != null)
      {
        image(figura, ubicacionX, ubicacionY);
      }
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
    
    public boolean overRect(int x, int y, int width, int height)  {
      if (mouseX >= x && mouseX <= x+width && 
          mouseY >= y && mouseY <= y+height) {
        return true;
      } else {
        return false;
      } 
    }
    
    public boolean isRastreado(){
     return overRect(ubicacionX, ubicacionY, this.figura.width, this.figura.height); 
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
}
