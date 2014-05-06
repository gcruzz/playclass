public class AnimationControl {
  private int currentScreen;
  private ArrayList<Screen> screens;
  private Categoria catgSeleccionada;
  
   public AnimationControl(){
    this(-1, new ArrayList<Screen>());
  } 
  
  public AnimationControl(int currentScreen){
    this(currentScreen, new ArrayList<Screen>());
  } 
  
  public AnimationControl(int currentScreen, ArrayList<Screen> screens){
    this.currentScreen = currentScreen;
    this.screens = screens;
  }
 
  public void setCatgSeleccionada(Categoria catgSeleccionada){
    this.catgSeleccionada = catgSeleccionada;
  }
  
  public Categoria getCatgSeleccionada(){
    return catgSeleccionada;
  }
  
  public void setCurrentScreen(int currentScreen){
    this.currentScreen = currentScreen;
  }
  
  public int getCurrentScreen(){
    return currentScreen;
  }

  public ArrayList<Screen> getScreens(){
    return screens;
  }
  
  public void setNextScreen(){
    currentScreen++;
  }
  
  public void insertScreen(Screen screen){
    screens.add(screen);
    screen.setAnimationControl(this);
  }
  
  public void drawCurrentScreen(){
    if(screens != null){
      if (screens.size() > 0 && currentScreen > -1){
        screens.get(currentScreen).draw();
      }
      
    }
  }
  
  public void clickOnCurrentScreem(){
    if(screens != null){
      if (screens.size() > 0 && currentScreen > -1){
        screens.get(currentScreen).mousePressed();
      }
    }    
  }
  
  public void keyReleasedCurrentScreem(){
    if(screens != null){
      if (screens.size() > 0 && currentScreen > -1){
        screens.get(currentScreen).keyReleased();
      }
    }    
  }
}
