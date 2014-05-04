public class Objeto extends Elemento
{   
   private PFont font;
   private int limiteText;
    
    public Objeto(PImage figura)
    {
        super(figura);
        //this.figura = figura;
        getFigura().resize(Parametros.tamObjAncho, Parametros.tamObjAlto);
        
        font = createFont("Arial Bold", 15);
        limiteText = 20;
        
        //nombre = "MI FIGURA";
    }
    
    public Objeto(String nombre, PImage figura)
    {
        super(nombre, figura);
    }
    
    /*private void ingresoNombre()
    {
      fill(0,0,0);
      textFont(font);
      textAlign(CENTER);
      text(nombre +(frameCount/10 % 2 == 0 ? "_" : ""), ubicacionX + (Parametros.tamObjAncho / 2), ubicacionY + Parametros.tamObjAlto + limiteText);
    }*/
}
