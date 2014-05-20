public class Pieza extends Elemento
{   
    private boolean arrastrar;
    private boolean posicionado;
    private int posicion = -1;
    //variable para validacion diagrama correcto
    private int tipoPieza;
    //posicion correcta
    private boolean correcta;
    
    public Pieza(int tipoPieza)
    {
        super();
        this.tipoPieza = tipoPieza;
    }
    
    public Pieza(String nombre, String urlPieza, int tipoPieza)
    {
        super(nombre,true);
        setMostrarNombre(true);
        setUrlFigura(urlPieza);
        setFiguraEfecto(loadImage(urlPieza));
        sizeFigura(Parametros.tamPzAncho, Parametros.tamPzAlto);
        this.tipoPieza = tipoPieza;
        
        switch(this.tipoPieza)
        {
           case Parametros.ATRIBUTO:
               setMinuscula(true);
           break;
           default:
               setMinuscula(false);
           break;
        }
        
        setColorTexto(true);
    }
    
    public boolean isClase()
    {
       return (tipoPieza == Parametros.CLASE); 
    }
    
    public boolean isObjeto()
    {
       return (tipoPieza == Parametros.OBJETO); 
    }
    
    public boolean isAtributo()
    {
       return (tipoPieza == Parametros.ATRIBUTO); 
    }
    
    public void setCorrecta(boolean correcta)
    {
      this.correcta = correcta;
    }
    
    public boolean isCorrecta()
    {
      return correcta;
    }
    
    public void setArrastrar(boolean arrastrar)
    {
      this.arrastrar = arrastrar;
    }
    
    public boolean isArrastrar()
    {
      return arrastrar;
    }
    
    public void setPosicion(int posicion)
    {
      this.posicion = posicion;
    }
    
    public int getPosicion()
    {
      return posicion;
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
