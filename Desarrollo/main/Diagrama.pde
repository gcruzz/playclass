public class Diagrama extends Elemento
{   
  private ArrayList<Elemento> piezas;
  private Elemento elemento;
  
    public Diagrama(String urlFigura)
    {
      super(urlFigura);
      sizeFigura(Parametros.tamDgrAncho, Parametros.tamDgrAlto);
      cargarCoordenadasPiezas();
    }
    
    private void cargarCoordenadasPiezas()
    {
        piezas=new ArrayList<Elemento>();
      
        //pieza 1
        elemento = new Elemento();
        elemento.setXY(getX() + 153, getY() + 19);
        piezas.add(elemento);
        
        //pieza 2
        elemento = new Elemento();
        elemento.setXY(getX() + 20, getY() + 152);
        piezas.add(elemento);
        
        //pieza 3
        elemento = new Elemento();
        elemento.setXY(getX() + 20 + 89, getY() + 152);
        piezas.add(elemento);
        
        //pieza 4
        elemento = new Elemento();
        elemento.setXY(getX() + 20 + 178, getY() + 152);
        piezas.add(elemento);
        
        //pieza 5
        elemento = new Elemento();
        elemento.setXY(getX() + 20 + 267, getY() + 152);
        piezas.add(elemento);
        
        //pieza 6
        elemento = new Elemento();
        elemento.setXY(getX() - 2, getY() + 275);
        piezas.add(elemento);
        
        //pieza 7
        elemento = new Elemento();
        elemento.setXY(getX() - 2 + 100, getY() + 275);
        piezas.add(elemento);
    
        //pieza 8
        elemento = new Elemento();
        elemento.setXY(getX() - 2 + 200, getY() + 275);
        piezas.add(elemento);
        
        //pieza 9
        elemento = new Elemento();
        elemento.setXY(getX() - 2 + 295, getY() + 275);
        piezas.add(elemento);
        
        //pieza 10
        elemento = new Elemento();
        elemento.setXY(getX() + 48, getY() + 369);
        piezas.add(elemento);
        
        //pieza 11
        elemento = new Elemento();
        elemento.setXY(getX() + 48 + 184, getY() + 369);
        piezas.add(elemento);
    }
    
    public ArrayList<Elemento> getPiezas()
    {
       return piezas; 
    }
}
