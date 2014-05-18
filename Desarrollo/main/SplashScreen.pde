import ddf.minim.*;

public class SplashScreen extends Screen{
  PImage logoImage;
  float transparency;
  float step;
  String imagePath;
  int cycle;
  AudioPlayer player;
  int currentMillis;
  int countMillis;
  float logoDelay;
  boolean musicPlayed;
  boolean redimen;
  Minim minim;
  
  
  public SplashScreen(PApplet applet,String imagePath, String soundPath, float step, float logoDelay, boolean redimen){ //<>//
    this.logoImage  = loadImage(imagePath);
    this.transparency = 0f;
    this.step = step;
    this.imagePath = imagePath;
    this.cycle = 0;
    minim = new Minim(applet);
    this.player = minim.loadFile(soundPath);
    this.currentMillis = 0;
    this.countMillis = 0;
    this.logoDelay = logoDelay;
    this.musicPlayed = false; 
    this.redimen=redimen;
  } 
  
  void drawImage(){
      background(255);
      if(!redimen)
      {
        image(logoImage, (width/2) - (logoImage.width/2),(height/2) - (logoImage.height/2));
      }
      else
      {
         image(logoImage, (Parametros.ANCHO/2) - (520/2),(Parametros.ALTO/2) - (200/2), 520,200);
      }
  }
  
  void increaseTransparency(){
    if (cycle == 0){   
      transparency += step;    
      tint(255, transparency);
      this.drawImage();
      if (this.transparency > 255){
        cycle++;
        transparency = 255f;
      }   
    }
  }
  
  void delay(){
    if (cycle == 1){   
      countMillis = millis() - currentMillis;
      if(countMillis >= logoDelay){
        cycle++;
      }      
    }
  }
  
  void decreaseTransparency(){
    if (cycle == 2){
      transparency -= step;
      tint(255, transparency);
      this.drawImage();
      if (this.transparency <= 0){
        cycle=0;
        super.getAnimationControl().setNextScreen();
        tint(255, 255);
      }     
    }
  }
  
  float getTransparency(){
    return this.transparency;
  }
  
  void setTransparency(float transparency){
    this.transparency = transparency;
  }
  
  int getCycle(){
    return this.cycle;
  }
  
  void setCycle(int cycle){
    this.cycle = cycle;
  }
  
  void draw(){
     if(!musicPlayed){
       if(player!= null)
       {
         this.player.play();
       }
       musicPlayed = true;
     }
     increaseTransparency();   
     delay();
     decreaseTransparency();
  }
  
  void mousePressed(){
  }
  
  void keyPressed() {
  }
  
  void mouseDragged() {
  }
  
  void mouseReleased() {
  }
}
