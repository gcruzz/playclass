public class Boton extends Elemento
{ 
    public Boton(String nombre)
    {
        super(nombre,true);
        setMostrarNombre(true);
        setUrlFigura("boton_2.png");
        setFiguraEfecto(loadImage("boton_1.png"));
        sizeFigura(Parametros.tamBtnAncho, Parametros.tamBtnAlto);
    }
    
    public Boton(String nombre, int masAncho)
    {
        super(nombre,true);
        setMostrarNombre(true);
        setUrlFigura("boton_2.png");
        setFiguraEfecto(loadImage("boton_1.png"));
        sizeFigura(Parametros.tamBtnAncho + masAncho, Parametros.tamBtnAlto);
    }
}
