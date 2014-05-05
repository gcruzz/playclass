public class Categoria extends Elemento
{
    private ArrayList<Objeto> objetos;
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
                  obj.setNombre("fig_"+i);
                  break;
               case Parametros.ANIMALES: 
                  if(i==1)
                  {
                    setUrlFigura("caja_2.png");
                    setNombre("ANIMALES");
                  }
                  obj=new Objeto("animal_"+i+".png");
                  obj.setNombre("animal_"+i);
                  break;
               case Parametros.FRUTAS: 
                  if(i==1)
                  {
                    setUrlFigura("caja_3.png");
                    setNombre("FRUTAS");
                  }
                  obj=new Objeto("fruta_"+i+".png");
                  obj.setNombre("fruta_"+i);
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
          objetos.remove(indice);
        }
        
        return retorno;
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
