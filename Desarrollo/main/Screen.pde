abstract class Screen{
  private AnimationControl control;

  public AnimationControl getAnimationControl(){
    return control;
  }
  public void setAnimationControl(AnimationControl control){
    this.control = control;
  }
  
  public Categoria seleccionada;
  
   abstract void draw();
   abstract void drawImage();
   abstract void mousePressed();
   abstract void keyPressed();
   abstract void mouseDragged();
   abstract void mouseReleased();
}
