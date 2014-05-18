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
        cargarLista();
    }
    
    public void cargarLista()
    {
        piezas = new ArrayList<Pieza>();
        
        piezas.add(new Pieza("Sisarras","clase.png"));
        piezas.add(new Pieza("Sisarras","objeto1.png"));
        piezas.add(new Pieza("Sisarras","objeto2.png"));
        piezas.add(new Pieza("Sisarras","objeto3.png"));
        piezas.add(new Pieza("Sisarras","objeto4.png"));
        piezas.add(new Pieza("Sisarras","atributo1.png"));
        piezas.add(new Pieza("Sisarras","atributo2.png"));
        piezas.add(new Pieza("Sisarras","atributo3.png"));
        piezas.add(new Pieza("Sisarras","atributo4.png"));
        piezas.add(new Pieza("Sisarras","atributo5.png"));
        piezas.add(new Pieza("Sisarras","atributo6.png"));
        
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
           if(!piezas.get(i).isArrastrar())
           {         
              piezas.get(i).ubicarXY(dirX,getY()+bordeY+saltoVal);
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
}
