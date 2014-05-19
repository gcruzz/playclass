import java.util.Collections;

public class ListaPieza extends Elemento
{
    private ArrayList<Pieza> piezas;
    private int distanciaPiezas;
    private int bordeX;
    private int bordeY;
    private int dirX;
    private int dirY;
    private int salto;
    private int saltoVal;
    
    public ListaPieza()
    {
        super();
        cargarLista();
    }
    
    public void cargarLista()
    {
        piezas = new ArrayList<Pieza>();
        
        piezas.add(new Pieza("CLASE","clase.png",Parametros.CLASE));
        piezas.add(new Pieza("OBJ 1","objeto1.png",Parametros.OBJETO));
        piezas.add(new Pieza("OBJ 2","objeto2.png",Parametros.OBJETO));
        piezas.add(new Pieza("OBJ 3","objeto3.png",Parametros.OBJETO));
        piezas.add(new Pieza("OBJ 4","objeto4.png",Parametros.OBJETO));
        piezas.add(new Pieza("ATR 1","atributo1.png",Parametros.ATRIBUTO));
        piezas.add(new Pieza("ATR 2","atributo2.png",Parametros.ATRIBUTO));
        piezas.add(new Pieza("ATR 3","atributo3.png",Parametros.ATRIBUTO));
        piezas.add(new Pieza("ATR 4","atributo4.png",Parametros.ATRIBUTO));
        piezas.add(new Pieza("ATR 5","atributo5.png",Parametros.ATRIBUTO));
        piezas.add(new Pieza("ATR 6","atributo6.png",Parametros.ATRIBUTO));

        //Barajea al azar        
        Collections.shuffle(piezas);

        //guarda la cantidad a sumar en caso de salto
        saltoVal = 0;
        //para dar forma a la sgt fila de la matriz
        salto = 3;
        //Distancia entre las piezas
        distanciaPiezas = 10;
        //valores para la margen invisible 
        bordeX=20;
        bordeY=20;
        
        //reacomoda x para la rerencia el mvto en el eje x cuando es horizontal
        dirX = getX()+ bordeX;
    }
    
    private void dibujarPiezas()
    {
        for(int i=0; i < piezas.size(); i++)
        {
           if(piezas.get(i).isPosicionado())
           {
              piezas.get(i).ubicar();
           }
           else
           {
               if(!piezas.get(i).isArrastrar())
               {         
                  piezas.get(i).ubicarXY(dirX,getY()+bordeY+saltoVal);
               }  
           }
           
            if(i >= (salto-1))
            {
              dirX = getX()+ bordeX;
              saltoVal += 95;
              salto += 3;
            }
            else
            {
               dirX += (distanciaPiezas + Parametros.tamPzAncho); 
            }
        }
    }
    
    @Override
    public void ubicarXY(int x,int y)
    {
      setX(x);
      setY(y);
      ubicar();

      saltoVal = 0;
      salto = 3;
      dirX = getX()+ bordeX;
      
      dibujarPiezas();
    }
    
    @Override
    public void ubicarX(int x)
    {
      setX(x);
      ubicar();
      
      saltoVal = 0;
      salto = 3;
      dirX = getX()+ bordeX;
      
      dibujarPiezas();
    }
    
    public ArrayList<Pieza> getPiezas()
    {
        return piezas;
    }
    
    public boolean validarUnicaSeleccion()
    {
      boolean valido = true;
      
      for(int i=0; i < piezas.size() ; i++)
      {
          if(piezas.get(i).isArrastrar() == false)
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
    
    public boolean validarCorrectas()
    {
      boolean valido = true;
      
      for(int i=0; i < piezas.size() ; i++)
      {
          if(piezas.get(i).isCorrecta() == true)
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
    
    public void resetValListaPieza()
    {
       for(int i=0; i < piezas.size() ; i++)
       {
          piezas.get(i).setCorrecta(false);
          piezas.get(i).setPosicionado(false);
          piezas.get(i).setPosicion(-1);
          piezas.get(i).setArrastrar(false);
       }
       
       //Barajea al azar
       Collections.shuffle(piezas);
    }
}
