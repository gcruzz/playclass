public class ListaCategoria extends Elemento
{
    private ArrayList<Categoria> categorias;
    private boolean vertical;
    private int distanciaCategorias;
    private int bordeX;
    private int bordeY;
    private int dirX;
    private int dirY;
    
    public ListaCategoria()
    {
        cargarLista();
    }
    
    public ListaCategoria(boolean vertical)
    {
        this.vertical = vertical;
        cargarLista();
    }
    
    public void cargarLista()
    {
        categorias = new ArrayList<Categoria>();
        
        categorias.add(new Categoria(Parametros.FIGURAS_GEOMETRICAS));
        categorias.add(new Categoria(Parametros.ANIMALES));
        categorias.add(new Categoria(Parametros.FRUTAS));
        //Distancia entre las cajas
        distanciaCategorias = 80;
        //valores para la margen invisible 
        bordeX=20;
        bordeY=20;
        
        //reacomoda x para la rerencia el mvto en el eje x cuando es horizontal
        dirX = getX()+ bordeX;
        //reacomoda y para la rerencia el mvto en el eje y cuando es vertical
        dirY = getY()+ bordeY;
    }
    
    private void orientacion()
    {
      for(int i=0; i < categorias.size(); i++)
        {
          //HORIZONTAL
          if(!vertical)
          {
            categorias.get(i).setMostrarNombre(Parametros.displayNombreCatg);
            categorias.get(i).ubicarXY(dirX,getY()+bordeY);
            dirX += (distanciaCategorias + Parametros.tamCatgAncho);
          }
          //VERTICAL
          else
          {
            categorias.get(i).setMostrarNombre(Parametros.displayNombreCatg);
            categorias.get(i).ubicarXY(getX()+bordeX,dirY);
            dirY += (distanciaCategorias + Parametros.tamCatgAlto);
          }
        }
    }
    
    @Override
    public void ubicarXY(int x,int y)
    {
      setX(x);
      setY(y);
      ubicar();

      if(!vertical)
      {
        dirX = getX()+ bordeX;
      }
      else
      {
        dirY = getY()+ bordeY;  
      }
      
      orientacion();
    }
    
    @Override
    public void ubicarX(int x)
    {
      setX(x);
      ubicar();
      //reacomoda x
      dirX = getX()+ bordeX;
      
      orientacion();
    }
    
    @Override
    public void ubicarY(int y)
    {
      setY(y);
      ubicar();
      //reacomoda y
      dirY = getY()+ bordeY;
      
      orientacion();
    }
    
    public boolean isVertical() {
        return vertical;
    }

    public void setVertical(boolean vertical) {
        this.vertical = vertical;
    }
    
    public ArrayList<Categoria> getCategorias()
    {
        return categorias;
    }
}
