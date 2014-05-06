public class Pizarra extends Elemento
{
    private Categoria categoria;
    private int bordeX;
    private int bordeY;
    private int distanciaObjetos;
    private int dirX;
    private int cant;
    private ArrayList<Objeto> objetosPizarra;
  
    public Pizarra(Categoria categoria)
    {
        objetosPizarra = new ArrayList<Objeto>();
        
        setUrlFigura("pizarra.png");
        sizeFigura(Parametros.tamPizAncho, Parametros.tamPizAlto);
        
        this.categoria = categoria;
        //valores para la margen de la pizarra y a partir de ella se posiciona el obj
        bordeX=58;
        bordeY=20;
        //Valor para mantener la distancia al agregar objetos a la pizarra
        distanciaObjetos = 75;
        //variable para mantener la sumatoria de x al agregar objetos a la pizarra
        dirX = getX()+ bordeX;
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
    public void ubicarX(int x)
    {
      setX(x);
      ubicar();
      //reacomoda x para la rerencia al agregar objetos
      dirX = getX()+ bordeX;
    }
    
    public void setCategoria(Categoria categoria)
    {
      this.categoria = categoria;
    }
    
    public Categoria getCategoria()
    {
      return categoria;
    }
    
    private void ubicarObjeto()
    {
        cant++;
        
        if(cant <= Parametros.limiteObjetos)
        {
          categoria.getSacado().ubicarXY( dirX, getY()+bordeY);
          dirX += (distanciaObjetos + Parametros.tamObjAncho);
        }
    }
    
    public void agregarObjeto()
    {
      //Saca un objeto al azar de la caja
      if(categoria.sacar() != null)
      {
        objetosPizarra.add(categoria.getSacado());
      }
      //Adiciona el objeto dentro de la pizarra
      ubicarObjeto();
    }
    
    private void resetValPizarra()
    {
        categoria.setSacado(null);
        dirX = getX()+ bordeX;
        cant = 0;
        objetosPizarra = new ArrayList<Objeto>(); 
    }
    
    public void cambiarCategoria(Categoria categoria)
    {
      ubicar();
      setCategoria(categoria);
      resetValPizarra();
    }
    
    public ArrayList<Objeto> getObjetosPizarra()
    {
        return objetosPizarra;
    }
}
