import java.util.Collections;

public class Cuestionario
{ 
  private ArrayList<Pregunta> cuestionario;
  private int tipoCategoria;
  private int indice;
  private int x;
  private int y;
  
    public Cuestionario(int tipoCategoria)
    {
        this.tipoCategoria = tipoCategoria;
        cuestionario=new ArrayList<Pregunta>();
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
            
            Collections.shuffle(pregunta.getRespuestas());
            
            cuestionario.add(pregunta);
         }
         
         Collections.shuffle(cuestionario);
    }
    
    public void nextPregunta()
    {
      if(indice < (cuestionario.size()-1))
      {
        indice++;
      }
    }
    
    public Pregunta getPregunta()
    {
        return cuestionario.get(indice);
    }
    
    public ArrayList<Pregunta> getCuestionario()
    {
      return cuestionario; 
    }
    
    public boolean  esCorrecta(String respuesta)
    {
       return ((respuesta.toCharArray()[0]+"").equals("*"));
    }
    
    public void dibujarPregunta(int xp,int yp)
    {
      PFont font = createFont("Comic Sans MS", 18);
      fill(0);
      textFont(font);
      textAlign(BASELINE);
      text(getPregunta().getEnunciado(), xp, yp);
      int k=0;
      
      for(int i=0; i < getPregunta().getRespuestas().size(); i++)
      {
         k=k+35;
         getPregunta().getOpciones().get(i).setXY(xp+10,yp+40+k-5);
         getPregunta().getOpciones().get(i).setNombre(getPregunta().getRespuestas().get(i));
         fill(0);
         textAlign(BASELINE);
         text(getPregunta().getRespuestas().get(i).replaceAll("\\*",""),getPregunta().getOpciones().get(i).getX()+25,getPregunta().getOpciones().get(i).getY() +5);
         
         getPregunta().pintarRadio(getPregunta().getOpciones().get(i));
      }
    }
}
