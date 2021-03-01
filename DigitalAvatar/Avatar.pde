class Avatar {
  String avatar;
  
  int numFaces = 6;
  int numMouths = 4;
  PImage[] faces = new PImage[numFaces];
  PImage[] mouths = new PImage[numMouths];
 
  int img_size;
  int img_margin;
  
  int loop = 3; //num of images in the loop
  int numFrames = loop;
  //int fps = 12;
  int frame = 0;
  int last_time = 0;
  //int min_speaking = 15;
  
  boolean frame_change = false;
  
  Avatar(String avatar, int img_size, int img_margin) {
    this.avatar = avatar; 
    this.img_size = img_size;
    this.img_margin = img_margin;
  }
  
  void avatar_setup() {
  
    for (int i =0; i < faces.length; i++) {
      String name = "face" + (i+1) + ".png";
      faces[i] = loadImage(avatar + "/faces/" + name);  
      faces[i].resize(img_size, img_size);
    }
  
    for (int i =0; i < mouths.length; i++) {
      String name = "mouth" + (i+1) + ".png";
      mouths[i] = loadImage(avatar + "/mouths/" + name);  
      mouths[i].resize(img_size, img_size);
    }
  }
  
  
  void display(int speaking, int fps) {
    translate(img_margin, img_margin);
    ////face:
    image(faces[frame % numFaces], 0, 0);
    //mouth:
    //if (speaking > min_speaking) {
    //Note that volume_for_speaking is a gloabal variable
    if (speaking > volume_for_speaking) {
      frame_change = false;
      image(mouths[frame % (numMouths - 1) + 1], 0, 0); 
    }
    else {
      if (frame_change){
              image(mouths[0], 0, 0); 
      }else {
              image(mouths[frame % (numMouths - 1) + 1], 0, 0); 
      }

    }
    translate(-img_margin, -img_margin);
    update_frame(fps);
  }
  
  void update_frame(int fps) {
    if (fps == 0) {
    }
    else {
      if ((millis() - last_time) > 1000/fps) {
         last_time = millis();
         frame = (frame + 1) % ((numMouths -1) * (numFaces));
         frame_change = true;
      }
    }
  }
  
}
