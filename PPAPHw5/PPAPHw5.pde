import processing.video.*;

int numPixelsWide, numPixelsHigh;
int blockSize = 5;
Movie mov;
color movColors[];
color pixColors[];

void setup() {
  size(800, 400);
  noStroke();
  mov = new Movie(this, "/Users/ramya/Documents/Processing/PPAPHw5/Data/PPAP.mp4");
  mov.loop();
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
    
    ////count = 0;
    //for (int x = 0; x < width; x++) {
    //  for (int y = 0; y < height; y++) {
    //    int index0 = x + (y)*width;
    //    pixColors[index0] = mov.pixels[index0];
    //    //count++;
    //  }//end of inner for
    //}//end of outer for
    
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
  float mt = mov.time();
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
