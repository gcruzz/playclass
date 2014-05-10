public class Pregunta
{ 
  private String enunciado;
  private ArrayList<String> respuestas;
  private ArrayList<Elemento> opciones;
  
    public Pregunta()
    {
      respuestas=new ArrayList<String>();
      opciones=new ArrayList<Elemento>();
    }
    
    public Pregunta(String enunciado)
    {
      respuestas=new ArrayList<String>();
      opciones=new ArrayList<Elemento>();
      this.enunciado = validarLargo(enunciado);
    }
    
    public void addRespuesta(String respuesta)
    {
      respuestas.add(respuesta);
      Elemento opc=new Elemento();
      opc.sizeFigura(20,20);
      opciones.add(opc);
    }
    
    public void setEnunciado(String enunciado)
    {
      this.enunciado = validarLargo(enunciado);
    }
    
    public String getEnunciado()
    {
       return enunciado; 
    }
    
    public ArrayList<Elemento> getOpciones()
    {
      return opciones;
    }
    
    public ArrayList<String> getRespuestas()
    {
      return respuestas;
    }
    
    private String validarLargo(String cadena)
    {
        int limite=60;
        
        String retorno=cadena;
        StringBuilder sb = new StringBuilder();
        sb.append(cadena);
        
        if(cadena.length()>limite)
        {
          while(!(cadena.charAt(limite)+"").equals(" ") && limite < (cadena.length()-1))
          {
            limite++;
          }
          sb.insert(limite, "\n");
          
          retorno =sb.toString().replaceAll("\n ","\n");
        }
        return retorno;
    }
    
    public void pintarRadios()
    {
        if(opciones.size() > 0)
        {
            for(int i=0; i < opciones.size(); i++)
            {
                pintarRadio(opciones.get(i));
            }
        } 
    }
    
    public void pintarRadio(Elemento radio)
    {
       if(radio.isActivo())
       {
         stroke(168,77,8);
         fill(255);
         ellipse(radio.getX(),radio.getY(),radio.getFigAncho(),radio.getFigAlto());
         fill(168,77,8);
         ellipse(radio.getX(),radio.getY(),radio.getFigAncho()-9,radio.getFigAlto()-9); 
       }
       else
       {
         stroke(168,77,8);
         fill(255);
         ellipse(radio.getX(),radio.getY(),radio.getFigAncho(),radio.getFigAlto()); 
       }
    }
    
    public void activarRadio(Elemento radio)
    {
        for(int i=0; i < opciones.size(); i++)
        {
           opciones.get(i).setActivo(false);
        }

        radio.setActivo(true);
    }
}
