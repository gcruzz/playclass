public class Categoria extends Elemento
{
    private ArrayList<Objeto> objetos;
    private ArrayList<Objeto> listSacados;
    private int tipoCategoria;
    private Objeto sacado;
    
    public Categoria(int tipoCategoria)
    {
        this.tipoCategoria = tipoCategoria;
        cargarCategoria();
    }
    
    public void cargarCategoria()
    {
        sizeFigura(Parametros.tamCatgAncho, Parametros.tamCatgAlto);
        objetos = new ArrayList<Objeto>();
        listSacados = new ArrayList<Objeto>();
        
        for(int i=1; i <= Parametros.limiteObjetos; i++)
        {
           Objeto obj =null;
           
           switch(tipoCategoria)
           {
               case Parametros.FIGURAS_GEOMETRICAS:
                  if(i==1)
                  {
                    setUrlFigura("caja_1.png");
                    setNombre("FIGURAS GEOMÉTRICAS");
                  }
                  obj=new Objeto("fig_"+i+".png");
                  obj.setMostrarNombre(Parametros.displayNombreObj);
                  break;
               case Parametros.ANIMALES: 
                  if(i==1)
                  {
                    setUrlFigura("caja_2.png");
                    setNombre("ANIMALES");
                  }
                  obj=new Objeto("animal_"+i+".png");
                  obj.setMostrarNombre(Parametros.displayNombreObj);
                  break;
               case Parametros.FRUTAS: 
                  if(i==1)
                  {
                    setUrlFigura("caja_3.png");
                    setNombre("FRUTAS");
                  }
                  obj=new Objeto("fruta_"+i+".png");
                  obj.setMostrarNombre(Parametros.displayNombreObj);
                  break;   
           }
           
           objetos.add(obj);
        }
    }
    
    public ArrayList<Objeto> getObjetos()
    {
        return objetos;
    }
    
    public Objeto sacar()
    {
        Objeto retorno=null;
        
        if(!objetos.isEmpty())
        {
          int indice = int(random(objetos.size()));
          retorno = objetos.get(indice);
          sacado = retorno;
          //para el uso de clear al cambiar de pantallas
          objetos.get(indice).setNombre("");
          listSacados.add(objetos.get(indice));
          
          objetos.remove(indice);
        }
        
        return retorno;
    }
    
    public void clearSacados()
    {
      if(objetos.isEmpty())
      {
        objetos = listSacados;
        listSacados = new ArrayList<Objeto>();
      }
    }
    
    public int getTipoCategoria()
    {
      return tipoCategoria;
    }
    
    public void setSacado(Objeto obj)
    {
       sacado = obj; 
    }
    
    public Objeto getSacado()
    {
       return sacado; 
    }
}
