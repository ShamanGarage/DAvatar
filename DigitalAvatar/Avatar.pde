class Avatar {
  String avatar;
  
  int numFaces = 1;
  int numMouths = 4;
  PImage[] faces = new PImage[numFaces];
  PImage[] mouths = new PImage[numMouths];
  
  int img_size = 800;
  int loop = 3; //num of images in the loop
  int numFrames = loop;
  int fps = 12;
  int frame = 0;
  int last_time = 0;
  int min_speaking = 15;
  
  Avatar(String avatar) {
    this.avatar = avatar; 
  }
  
  
  void avatar_setup() {
  
    for (int i =0; i < faces.length; i++) {
      String name = "face" + (i+1) + ".png";
      faces[i] = loadImage(avatar + "\\faces\\" + name);  
    }
  
    for (int i =0; i < mouths.length; i++) {
      String name = "mouth" + (i+1) + ".png";
      mouths[i] = loadImage(avatar + "\\mouths\\" + name);  
    }
  }
  
  
  void display(int speaking) {
    translate(width/2, 0);
    //face:
    image(faces[0], -img_size/2, 0);
    //mouth:
    if (speaking > min_speaking) {
      loop();
    }
    else {
      image(mouths[0], -img_size/2, 0); 
    }
    translate(-width/2, 0);
  }
  
  void loop() {
    image(mouths[frame+1], -img_size/2, 0);
    if ((millis() - last_time) > 1000/fps) {
       //mouth0 is the static mouth
       //mouth1 to mouth 3 are the loop when there is sound
       frame = ((frame + 1) % numFrames);
       last_time = millis();
    }
  }
  
  void display_slider_fps(){
     translate(width/2, img_size);
     translate(-img_size/2, 0);  
     
     stroke(0);
     strokeWeight(5);
     textSize(30);
     int text_height = 30;
      
     fill(0); 
     text("FPS: ", 0, text_height);  
     noFill();
     rect(-5,0, 120, text_height+7);
     rect(-5,0 + text_height+7, img_size, text_height+7); 
     //translate(int(img_size/7), 0);  
     //line(0, 0+text_adjustment, int(img_size/7)*5, 0+text_adjustment); 
  }
  
  
}
