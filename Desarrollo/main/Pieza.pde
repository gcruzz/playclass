public class Pieza extends Elemento
{   
    private boolean arrastrar;
    private boolean posicionado;
    
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
    
    public void setPosicionado(boolean posicionado)
    {
      this.posicionado = posicionado;
    }
    
    public boolean isPosicionado()
    {
      return posicionado;
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
