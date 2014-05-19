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
        elemento.sizeFigura(Parametros.tamPzAncho, Parametros.tamPzAlto);
        elemento.setXY(153, 19);
        piezas.add(elemento);
        
        //pieza 2
        elemento = new Elemento();
        elemento.sizeFigura(Parametros.tamPzAncho, Parametros.tamPzAlto);
        elemento.setXY(20, 152);
        piezas.add(elemento);
        
        //pieza 3
        elemento = new Elemento();
        elemento.sizeFigura(Parametros.tamPzAncho, Parametros.tamPzAlto);
        elemento.setXY(20 + 89, 152);
        piezas.add(elemento);
        
        //pieza 4
        elemento = new Elemento();
        elemento.sizeFigura(Parametros.tamPzAncho, Parametros.tamPzAlto);
        elemento.setXY(20 + 178, 152);
        piezas.add(elemento);
        
        //pieza 5
        elemento = new Elemento();
        elemento.sizeFigura(Parametros.tamPzAncho, Parametros.tamPzAlto);
        elemento.setXY(20 + 267, 152);
        piezas.add(elemento);
        
        //pieza 6
        elemento = new Elemento();
        elemento.sizeFigura(Parametros.tamPzAncho, Parametros.tamPzAlto);
        elemento.setXY(- 2, 275);
        piezas.add(elemento);
        
        //pieza 7
        elemento = new Elemento();
        elemento.sizeFigura(Parametros.tamPzAncho, Parametros.tamPzAlto);
        elemento.setXY(- 2 + 100, 275);
        piezas.add(elemento);
    
        //pieza 8
        elemento = new Elemento();
        elemento.sizeFigura(Parametros.tamPzAncho, Parametros.tamPzAlto);
        elemento.setXY(- 2 + 200, 275);
        piezas.add(elemento);
        
        //pieza 9
        elemento = new Elemento();
        elemento.sizeFigura(Parametros.tamPzAncho, Parametros.tamPzAlto);
        elemento.setXY(- 2 + 295, 275);
        piezas.add(elemento);
        
        //pieza 10
        elemento = new Elemento();
        elemento.sizeFigura(Parametros.tamPzAncho, Parametros.tamPzAlto);
        elemento.setXY(48, 369);
        piezas.add(elemento);
        
        //pieza 11
        elemento = new Elemento();
        elemento.sizeFigura(Parametros.tamPzAncho, Parametros.tamPzAlto);
        elemento.setXY(48 + 184, 369);
        piezas.add(elemento);
    }
    
    public ArrayList<Elemento> getPiezas()
    {
       return piezas; 
    }
}
