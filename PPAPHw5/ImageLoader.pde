import java.util.Map;

public class ImageLoader {
  private String basePath;
  private String penImageName;
  private String pineappleImageName;
  private String appleImageName;
  private Map<String, PImage> dictionary = new HashMap<String, PImage>();
  
  public ImageLoader(String basePath, String penImageName, String pineappleImageName, String appleImageName) {
    this.basePath = basePath;
    this.penImageName = penImageName;
    this.pineappleImageName = pineappleImageName;
    this.appleImageName = appleImageName;
    dictionary.put(penImageName, doLoadImageByName(penImageName));
    dictionary.put(pineappleImageName, doLoadImageByName(pineappleImageName));
    dictionary.put(appleImageName, doLoadImageByName(appleImageName));
  }
  
  public PImage loadPen() {
    return this.loadImageByName(this.penImageName);
  }
  
  public PImage loadApple() {
    return this.loadImageByName(this.appleImageName);
  }
  
  public PImage loadPineapple() {
    return this.loadImageByName(this.pineappleImageName);
  }
  
  private PImage loadImageByName(String imageName) {
    return this.dictionary.get(imageName);
  }
  
  private PImage doLoadImageByName(String imageName) {
    PImage theLoadedImage = loadImage(this.basePath + File.separatorChar + imageName);
    //if(theLoadedImage.width > width/2 || theLoadedImage.height> height/2) {
      theLoadedImage.resize(20, 20);
    //}
    return theLoadedImage;
    
  }
}
