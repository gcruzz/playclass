public class Objeto extends Elemento
{   
   /*private PFont font;
   private int limiteText;*/
    
    public Objeto(PImage figura)
    {
        super(figura);
        sizeFigura(Parametros.tamObjAncho, Parametros.tamObjAlto);
    }
    
    public Objeto(String urlFigura)
    {
        super(urlFigura);
        sizeFigura(Parametros.tamObjAncho, Parametros.tamObjAlto);
    }
    
    public Objeto(String nombre, PImage figura)
    {
        super(nombre, figura);
        sizeFigura(Parametros.tamObjAncho, Parametros.tamObjAlto);
    }
}
