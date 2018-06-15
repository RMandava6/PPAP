import java.util.*;

public class ImageHandler {
  
  private Set<Integer> appearanceTimes = new HashSet<Integer>();
  private PImage image;
  private Movie movie;
  Location appearanceLocation;
  
 public ImageHandler(Set<Integer> appearanceTimes, PImage image, Movie movie, Location appearanceLocation) {
    this.appearanceTimes = appearanceTimes; 
    this.image = image;
    this.movie = movie;
    this.appearanceLocation = appearanceLocation;
 }
 
  public void draw() {
    Float mt = mov.time();
    if(appearanceTimes.contains(mt.intValue())) {
       image(this.image, appearanceLocation.getX(), appearanceLocation.getY(), width/8, height/8); 
    }
  }
  
}
