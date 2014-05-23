public class Diagrama extends Elemento
{   
  private ArrayList<Pieza> piezas;
  private Pieza elemento;
  
  private int clase = 0;
  private int objeto = 1;
  private int atributo = 5;
  
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
    
    public void armarRelacion(ArrayList<Pieza> figuras)
    {
        int cl = clase;
        int ob = objeto;
        int at = atributo;
        
        for(int i=0; i < figuras.size(); i++)
        {
            if(figuras.get(i).isClase())
            {
               figuras.get(i).setXY((piezas.get(cl).getX() + (Parametros.ANCHO/2)), (piezas.get(cl).getY() + 68));
               piezas.get(cl).setActivo(true);
               figuras.get(i).setPosicion(cl);
            }
            else if(figuras.get(i).isObjeto())
            {
               figuras.get(i).setXY((piezas.get(ob).getX() + (Parametros.ANCHO/2)), (piezas.get(ob).getY() + 68));                      
               piezas.get(ob).setActivo(true);
               figuras.get(i).setPosicion(ob);
               ob++;
            }
            else 
            {
               figuras.get(i).setXY((piezas.get(at).getX() + (Parametros.ANCHO/2)), (piezas.get(at).getY() + 68));
               piezas.get(at).setActivo(true);
               figuras.get(i).setPosicion(at);
               at++;
            }
                  
             figuras.get(i).setCorrecta(true);
             figuras.get(i).setPosicionado(true);
        }
    }
}
