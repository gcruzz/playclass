public class Objeto extends Elemento
{   
   private PFont fontType;
   private int limiteText;
   private boolean editarNombre;
   private String tmpNombre;
    
    public Objeto(PImage figura)
    {
        super(figura);
        sizeFigura(Parametros.tamObjAncho, Parametros.tamObjAlto);
        editarNombre = false;
        setNombre("");
    }
    
    public Objeto(String urlFigura)
    {
        super(urlFigura);
        sizeFigura(Parametros.tamObjAncho, Parametros.tamObjAlto);
        editarNombre = false;
        setNombre("");
    }
    
    public Objeto(String nombre, PImage figura)
    {
        super(nombre, figura);
        sizeFigura(Parametros.tamObjAncho, Parametros.tamObjAlto);
        editarNombre = false;
        tmpNombre = getNombre();
    }
    
    public void setEditarNombre(boolean editarNombre)
    {
      this.editarNombre = editarNombre;
    }
    
    public boolean isEditarNombre()
    {
      return editarNombre;
    }
    
    //Metodo llamado en keyReleased()
    public void editandoTexto()
    {
        if(editarNombre && isRastreado())
        {
          tmpNombre = getNombre();
          if (key != CODED) {
            switch(key) {
              case BACKSPACE:
                tmpNombre = tmpNombre.substring(0,max(0,tmpNombre.length()-1));
                setNombre(tmpNombre);
                break;
              default:
                tmpNombre += key;
                setNombre(tmpNombre);
            }
          }
        } 
    }
}
