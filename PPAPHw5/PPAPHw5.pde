import processing.video.*;
import java.util.*;

int numPixelsWide, numPixelsHigh;
int blockSize = 5;
Movie mov;
color movColors[];
color pixColors[];
 private ImageHandler penImageHandler;
 private ImageHandler appleImageHandler;
 private ImageHandler pineappleImageHandler;

void setup() {
  size(800, 400);
  noStroke();
  
  String basePath = "/Users/raminfarhanian/Documents/Processing/Visualization/unit 6/PPAP/PPAPHw5/Data/";
  String videoName = "PPAP.mp4";
  ImageLoader imageLoader = new ImageLoader(basePath, "pen.jpg", "pineapple.jpg", "apple.jpg");
   
  mov = new Movie(this, basePath + videoName);
  mov.loop();

  penImageHandler = new ImageHandler(new HashSet<Integer>(Arrays.asList(15, 19, 22, 25, 28, 30, 34, 40, 41, 72, 74, 78, 86, 92, 106)), imageLoader.loadPen(), mov, new Location(0,0));
  appleImageHandler = new ImageHandler(new HashSet<Integer>(Arrays.asList(16, 19,     28,     34, 40, 41, 80, 84, 87, 92, 106)), imageLoader.loadApple(), mov, new Location(width-(width/8),0));
  pineappleImageHandler = new ImageHandler(new HashSet<Integer>(Arrays.asList(23, 25, 30,     34, 40, 41, 82, 84, 87, 92, 106)), imageLoader.loadPineapple(), mov, new Location(0,height- (height/8)));

  numPixelsWide = width / blockSize;
  numPixelsHigh = height / blockSize;
  println(numPixelsWide);
  movColors = new color[numPixelsWide * numPixelsHigh];
}

// Display values from movie
void draw() {
  if (mov.available() == true) {
    mov.read();
    
    mov.loadPixels();
    int count = 0;
    for (int j = 0; j < numPixelsHigh; j++) {
      for (int i = 0; i < numPixelsWide; i++) {
        movColors[count] = mov.get(i*blockSize, j*blockSize);
        count++;
      }//end of inner for
    }//end of outer for
    

    
  }// end of if
  //background(255);
  //noTint();
  
  image(mov, 0, 0, width, height);
  
  
  if(key =='i' || key =='I'){
    filter(INVERT);
    image(mov, 0, 0, width/2, height/2);
  }
   if(key =='p' || key =='P'){
    filter(POSTERIZE, 4);
    image(mov, width/2, height/2, width/2, height/2);
  }
  
  
  
  //float md = mov.duration();
  Float mt = mov.time();
  if (mt<10) {
    background(255);
    for (int j = 0; j < numPixelsHigh; j++) {
      for (int i = 0; i < numPixelsWide; i++) {
        fill(movColors[j*numPixelsWide + i]);
        rect(i*blockSize, j*blockSize, blockSize, blockSize);
      }//end of inner for
    }//end of outer for
  }//end of mt if
  
  if (mt<60 && mt>45) {
    tint(0, 153, 204);
    //image(mov, 0, 0, width, height);
  }
  //surface.setTitle(String.valueOf(mt.intValue()));

  penImageHandler.draw();
  appleImageHandler.draw();
  pineappleImageHandler.draw();
  
}//end of draw

void keyPressed() {
  if(keyPressed == true){
    if (key == 'b' || key == 'B') {
      tint(0, 153, 204);
     // image(mov, 0, 0, width/2, height/2);
    }
    else if(key =='r' || key =='R'){
      tint(204, 0, 153);
      //image(mov, width/2, 0, width/2, height/2);
    }
    else if(key =='g' || key == 'G'){
      tint(0, 204, 153);
      //image(mov, 0, height/2, width/2, height/2);
    }
    else if(key =='c' || key=='C'){
      noTint();
      //image(mov, width/2, height/2, width, height);
    }
    
    //image(mov, 0, 0, width, height);
    //if(key =='i' || key =='I'){
    //  filter(INVERT);
    //}//end of filter if
  }//end of KeyPressed if
  
  //else{
  //  noTint();
  //}
}//end of keyPressed
