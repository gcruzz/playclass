abstract class Screen{
  private AnimationControl control;

  public AnimationControl getAnimationControl(){
    return control;
  }
  public void setAnimationControl(AnimationControl control){
    this.control = control;
  }
  
   abstract void draw();
   abstract void drawImage();
   abstract void mousePressed();
}
