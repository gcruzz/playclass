public class Cuestionario
{ 
  private Pregunta[] cuestionario;
  private final int cantidadPreguntas = 6;
  private int tipoCategoria;
  
    public Cuestionario(int tipoCategoria)
    {
        this.tipoCategoria = tipoCategoria;
        cuestionario=new Pregunta[cantidadPreguntas];
        cargarCuestionario();
    }
    
    public void cargarCuestionario()
    {
         String[] lecturaTxt = loadStrings("cuestionario"+tipoCategoria+".txt");
         
         for(int i=0; i < lecturaTxt.length; i++)
         {
            String datos[] = lecturaTxt[i].split("\\\\");
            Pregunta pregunta=new Pregunta(datos[0]);
            
            for(int j=1; j < datos.length; j++)
            {
                pregunta.addRespuesta(datos[j]);
            }
         }
    }
}
