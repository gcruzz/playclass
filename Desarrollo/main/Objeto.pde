public class Objeto extends Elemento
{   
   private String tmpNombre;
   private final int limiteText = 14;
    
    public Objeto(PImage figura)
    {
        super(figura);
        sizeFigura(Parametros.tamObjAncho, Parametros.tamObjAlto);
        setNombre("");
    }
    
    public Objeto(String urlFigura)
    {
        super(urlFigura);
        sizeFigura(Parametros.tamObjAncho, Parametros.tamObjAlto);
        setNombre("");
    }
    
    public Objeto(String nombre, PImage figura)
    {
        super(nombre, figura);
        sizeFigura(Parametros.tamObjAncho, Parametros.tamObjAlto);
        tmpNombre = getNombre();
    }
    
    //Metodo llamado en keyReleased()
    public void editandoTexto()
    {
        if(isEditarNombre())
        {
          tmpNombre = getNombre();
          if (key != CODED) {
            switch(key) {
              case ENTER:
                setEditarNombre(false);
                break;
              case BACKSPACE:
                tmpNombre = tmpNombre.substring(0,max(0,tmpNombre.length()-1));
                setNombre(tmpNombre);
                break;
              default:
                if(tmpNombre.length() < limiteText){
                    tmpNombre += key;
                    setNombre(tmpNombre);
                }
            }
          }
        } 
    }
}
