import processing.sound.*;

//We used the example IO - AudioInput of the sound library
AudioIn input;
Amplitude loudness;

color dark_beige = color(228,206,162);
color beige = color(245, 237, 221);
color red = color(255, 0, 0);
color green = color(0, 255, 0);
color blue = color(0, 0, 255);
color aux = color(128, 140, 127);
color[] colors = {red, green, blue, beige, aux};
String[] colors_names = {"red", "green", "blue", "beige", "aux"};
int current_color = 3;

Avatar avatar;
int img_size = 720;
int img_margin = 30;

int fps = 12;
int volume_for_speaking = 10;
Boolean is_pressed = false;

void setup() {
  size(1200, 780);
  
  avatar = new Avatar("pako", img_size, img_margin);
  avatar.avatar_setup();
  
  // Create an Audio input and grab the 1st channel
  input = new AudioIn(this, 0);
  // Begin capturing the audio input
  input.start();
  // Create a new Amplitude analyzer
  loudness = new Amplitude(this);
  // Patch the input to the volume analyzer
  loudness.input(input);
}

void draw() {  
  background(beige);
  float volume = loudness.analyze();
  int speaking = int(map(volume, 0, 0.5, 1, 350));
  
  display_background(img_size, img_margin, true, colors[current_color]);
  fps = display_slider(780, 30, "FPS", fps, 0, 24, is_pressed);
  volume_for_speaking = display_slider(780, 115, "MIC", volume_for_speaking, 1, 350, is_pressed);
  
  avatar.display(speaking, fps);
  
  current_color =  display_color_buttons(780, 200, "BG", colors_names, colors, current_color, is_pressed);
  
  //stroke(red);
  //line(780,0, 780, 780);
}

void mousePressed() {
  is_pressed= true;
}

void mouseReleased(){
  is_pressed = false;
}
