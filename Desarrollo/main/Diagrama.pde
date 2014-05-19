public class Diagrama extends Elemento
{   
  private ArrayList<Pieza> piezas;
  private Pieza elemento;
  
    public Diagrama(String urlFigura)
    {
      super(urlFigura);
      sizeFigura(Parametros.tamDgrAncho, Parametros.tamDgrAlto);
      cargarCoordenadasPiezas();
    }
    
    private void cargarCoordenadasPiezas()
    {
        piezas=new ArrayList<Pieza>();
      
        //pieza 1
        elemento = new Pieza(Parametros.CLASE);
        elemento.sizeFigura(Parametros.tamPzAncho, Parametros.tamPzAlto);
        elemento.setXY(153, 19);
        piezas.add(elemento);
        
        //pieza 2
        elemento = new Pieza(Parametros.OBJETO);
        elemento.sizeFigura(Parametros.tamPzAncho, Parametros.tamPzAlto);
        elemento.setXY(20, 152);
        piezas.add(elemento);
        
        //pieza 3
        elemento = new Pieza(Parametros.OBJETO);
        elemento.sizeFigura(Parametros.tamPzAncho, Parametros.tamPzAlto);
        elemento.setXY(20 + 89, 152);
        piezas.add(elemento);
        
        //pieza 4
        elemento = new Pieza(Parametros.OBJETO);
        elemento.sizeFigura(Parametros.tamPzAncho, Parametros.tamPzAlto);
        elemento.setXY(20 + 178, 152);
        piezas.add(elemento);
        
        //pieza 5
        elemento = new Pieza(Parametros.OBJETO);
        elemento.sizeFigura(Parametros.tamPzAncho, Parametros.tamPzAlto);
        elemento.setXY(20 + 267, 152);
        piezas.add(elemento);
        
        //pieza 6
        elemento = new Pieza(Parametros.ATRIBUTO);
        elemento.sizeFigura(Parametros.tamPzAncho, Parametros.tamPzAlto);
        elemento.setXY(- 2, 275);
        piezas.add(elemento);
        
        //pieza 7
        elemento = new Pieza(Parametros.ATRIBUTO);
        elemento.sizeFigura(Parametros.tamPzAncho, Parametros.tamPzAlto);
        elemento.setXY(- 2 + 100, 275);
        piezas.add(elemento);
    
        //pieza 8
        elemento = new Pieza(Parametros.ATRIBUTO);
        elemento.sizeFigura(Parametros.tamPzAncho, Parametros.tamPzAlto);
        elemento.setXY(- 2 + 200, 275);
        piezas.add(elemento);
        
        //pieza 9
        elemento = new Pieza(Parametros.ATRIBUTO);
        elemento.sizeFigura(Parametros.tamPzAncho, Parametros.tamPzAlto);
        elemento.setXY(- 2 + 295, 275);
        piezas.add(elemento);
        
        //pieza 10
        elemento = new Pieza(Parametros.ATRIBUTO);
        elemento.sizeFigura(Parametros.tamPzAncho, Parametros.tamPzAlto);
        elemento.setXY(48, 369);
        piezas.add(elemento);
        
        //pieza 11
        elemento = new Pieza(Parametros.ATRIBUTO);
        elemento.sizeFigura(Parametros.tamPzAncho, Parametros.tamPzAlto);
        elemento.setXY(48 + 184, 369);
        piezas.add(elemento);
    }
    
    public ArrayList<Pieza> getPiezas()
    {
       return piezas; 
    }
    
    public boolean diagramaLleno()
    {
      boolean valido = true;
      
      for(int i=0; i < piezas.size() ; i++)
      {
          if(piezas.get(i).isActivo() == true)
          {
              valido = valido && true;
          }
          else
          {
              valido = valido && false; 
          }
       }
      
      return valido;
    }
    
    public void resetValDiagrama()
    {
       for(int i=0; i < piezas.size() ; i++)
       {
          piezas.get(i).setActivo(false);
       }
    }
}
