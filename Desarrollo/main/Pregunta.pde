public class Pregunta
{ 
  private String enunciado;
  private ArrayList<String> respuestas;
  
    public Pregunta()
    {
      respuestas=new ArrayList<String>();
    }
    
    public Pregunta(String enunciado)
    {
      respuestas=new ArrayList<String>();
      this.enunciado = enunciado;
    }
    
    public void addRespuesta(String respuesta)
    {
      respuestas.add(respuesta);
    }
    
    public void setEnunciado(String enunciado)
    {
      this.enunciado = enunciado;
    }
    
    public String getEnunciado()
    {
       return enunciado; 
    }
    
    public ArrayList<String> getRespuestas()
    {
      return respuestas;
    }
}
