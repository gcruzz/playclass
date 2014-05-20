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
    private int tipoCategoria;
    
    public ListaPieza()
    {
        super();
        cargarConfig();
    }
    
    public void cargarConfig()
    {
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
    
    public void llenarPiezas(int tipoCategoria)
    {
        this.tipoCategoria = tipoCategoria;
        piezas = new ArrayList<Pieza>();
        
        switch(this.tipoCategoria)
        {
           case Parametros.FIGURAS_GEOMETRICAS:
              piezas.add(new Pieza("FIGURAS\nGEOMÉTRICAS","clase.png",Parametros.CLASE));
              piezas.add(new Pieza("cuadrado","objeto1.png",Parametros.OBJETO));
              piezas.add(new Pieza("poligono","objeto2.png",Parametros.OBJETO));
              piezas.add(new Pieza("triangulo","objeto3.png",Parametros.OBJETO));
              piezas.add(new Pieza("circulo","objeto4.png",Parametros.OBJETO));
              piezas.add(new Pieza("Son figuras\ncon todos sus\nlados cerrados","atributo1.png",Parametros.ATRIBUTO));
              piezas.add(new Pieza("4 elementos","atributo2.png",Parametros.ATRIBUTO));
              piezas.add(new Pieza("3 puntos\nblancos","atributo3.png",Parametros.ATRIBUTO));
              piezas.add(new Pieza("Verde, Violeta,\nNaranja y\nAmarillo","atributo4.png",Parametros.ATRIBUTO));
              piezas.add(new Pieza("Los puntos\nblancos","atributo5.png",Parametros.ATRIBUTO));
              piezas.add(new Pieza("Conjunto de\nfiguras\ngeométricas","atributo6.png",Parametros.ATRIBUTO));
           break;
               
          case Parametros.ANIMALES:
              piezas.add(new Pieza("ANIMALES","clase.png",Parametros.CLASE));
              piezas.add(new Pieza("conejo","objeto1.png",Parametros.OBJETO));
              piezas.add(new Pieza("mariposa","objeto2.png",Parametros.OBJETO));
              piezas.add(new Pieza("mariquita","objeto3.png",Parametros.OBJETO));
              piezas.add(new Pieza("zebra","objeto4.png",Parametros.OBJETO));
              piezas.add(new Pieza("Todos tienen\npatas","atributo1.png",Parametros.ATRIBUTO));
              piezas.add(new Pieza("4 elementos","atributo2.png",Parametros.ATRIBUTO));
              piezas.add(new Pieza("Reino Animal","atributo3.png",Parametros.ATRIBUTO));
              piezas.add(new Pieza("2 vuelan","atributo4.png",Parametros.ATRIBUTO));
              piezas.add(new Pieza("Rojo, negro,\nblanco, rosa,\n naranja","atributo5.png",Parametros.ATRIBUTO));
              piezas.add(new Pieza("2 vertebrados,\n2 invertebrados","atributo6.png",Parametros.ATRIBUTO));
           break;
           
           case Parametros.FRUTAS:
              piezas.add(new Pieza("FRUTAS","clase.png",Parametros.CLASE));
              piezas.add(new Pieza("banano","objeto1.png",Parametros.OBJETO));
              piezas.add(new Pieza("cereza","objeto2.png",Parametros.OBJETO));
              piezas.add(new Pieza("coco","objeto3.png",Parametros.OBJETO));
              piezas.add(new Pieza("MANZANA","objeto4.png",Parametros.OBJETO));
              piezas.add(new Pieza("Postres","atributo1.png",Parametros.ATRIBUTO));
              piezas.add(new Pieza("4 elementos","atributo2.png",Parametros.ATRIBUTO));
              piezas.add(new Pieza("Frutas","atributo3.png",Parametros.ATRIBUTO));
              piezas.add(new Pieza("Dulces","atributo4.png",Parametros.ATRIBUTO));
              piezas.add(new Pieza("Amarillo,\nverde, rojo,\nblanco","atributo5.png",Parametros.ATRIBUTO));
              piezas.add(new Pieza("Los elementos\nestan inscritos\nen una\ncircunferencia","atributo6.png",Parametros.ATRIBUTO));
           break;
        }
        //Barajea al azar        
        Collections.shuffle(piezas);
    }
    
    public int getTipoCategoria()
    {
      return tipoCategoria;
    }
}
