public class AnimationControl {
  private int currentScreen;
  private ArrayList<Screen> screens;
  
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
}
