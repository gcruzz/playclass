public class Pieza extends Elemento
{   
    private boolean arrastrar;
    
    public Pieza(String nombre, String urlPieza)
    {
        super(nombre,true);
        setMostrarNombre(true);
        setUrlFigura(urlPieza);
        setFiguraEfecto(loadImage(urlPieza));
        sizeFigura(Parametros.tamPzAncho, Parametros.tamPzAlto);
    }
    
    public void setArrastrar(boolean arrastrar)
    {
      this.arrastrar = arrastrar;
    }
    
    public boolean isArrastrar()
    {
      return arrastrar;
    }
    
    public boolean isArrastrado()
    {
      return (mousePressed && arrastrar); 
    }
    
    public void ubicarMvto()
    {
       ubicarXY(mouseX - (getFigAncho() / 2), mouseY - (getFigAlto() / 2));
    }
}
