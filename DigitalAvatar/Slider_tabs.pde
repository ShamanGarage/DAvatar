
int display_slider(int x_iz, int y_iz, String name, int value, int min_value, int max_value, Boolean is_activate){
      
   int margin = 10;

   int width_box = 390;   
   int text_height = 26;
   int height_box = text_height + 7;
   
   stroke(0);
   strokeWeight(1);
   
   translate(x_iz + margin, y_iz + margin);
   translate(0, height_box);
   
   //rectangle of the slider:
   noFill();
   rect(0, 0, width_box, height_box);
   //the position is absolute for this function:
   boolean is_over = over_slider(x_iz + margin, y_iz + height_box + margin, width_box, height_box);
   
   fill(0); 
   textSize(15);
   text_height = 20;
   textAlign(LEFT);
   text("min", 10, text_height);  
   textAlign(RIGHT);
   text("max", width_box - 10, text_height);   
   line(50, height_box/2,  width_box - 50, height_box/2);
   fill(beige);
   
   //the position is absolute for this function:
   int new_value = slider(value, x_iz + margin + 50 + 3, x_iz + margin + width_box - 50 -3, is_over, is_activate, min_value, max_value);
   float x_relative = map(new_value, min_value, max_value, 0, width_box - 100);
   ellipse(50 + x_relative, height_box/2, 10, 10); 
   
   translate(0, -height_box);
   
   //rectangle of the text:
   
   noFill();
   rect(0, 0, width_box/2, height_box);
   fill(0); 
   textSize(20);
   text_height = 24;
   textAlign(LEFT);
   text(name + ": " + new_value, 10, text_height);  
   
   translate(-x_iz - margin, -y_iz - margin); 
   return new_value;
}

int slider(int value, int x_iz, int x_dr, Boolean is_over, Boolean is_activate, int min_value, int max_value){ 
  if (is_over && (is_activate)) {
    value = int(map(mouseX, x_iz, x_dr, min_value, max_value));
  }
  if (value > max_value) { value = max_value;}
  if (value < min_value) { value = min_value;}
  return value;
}

Boolean over_slider(int x_iz, int y_iz, int width_box, int height_box){
  Boolean is_over = false; 
  if (x_iz < mouseX && mouseX < x_iz + width_box + 5 && y_iz < mouseY && mouseY <  y_iz + height_box){
   is_over = true; 
  }
  return is_over;
}
