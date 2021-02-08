import processing.sound.*;

//We used the example IO - AudioInput of the sound library
AudioIn input;
Amplitude loudness;

Avatar avatar;

void setup() {
  size(1000, 1100);
  
  avatar = new Avatar("shaman_pabgre");
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
  float volume = loudness.analyze();
  int speaking = int(map(volume, 0, 0.5, 1, 350));
  
  avatar.display(speaking);
  avatar.display_slider_fps();
}
