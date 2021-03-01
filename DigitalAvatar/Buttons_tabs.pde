
int display_color_buttons(int x_iz, int y_iz, String name, String[] names, color[] colors, int current_color, Boolean is_activate){
      
   int margin = 10;
   int width_box = 390;   
   int text_height = 26;
   int height_letter_box = text_height + 7;
   int height_big_box = text_height + 7 + 50;
   
   int radius = 30;
   int num_colors = names.length;
   int num_rows = num_rows(num_colors, radius, margin, width_box);
   int margin_colors;
   if (num_rows == 1){ 
     margin_colors = (width_box - (radius * num_colors)) / (num_colors+1);
   }
   else { margin_colors = 30; }
   
   //Buttons:
   //the position is absolute for this function:
   int x = x_iz + margin;
   int y = y_iz + margin + height_letter_box;
   current_color = over_button(x, y, current_color, colors, names, width_box, height_big_box, num_rows, num_colors, radius,  margin, margin_colors, is_activate);
   
   translate(x_iz + margin, y_iz + margin);
   
   stroke(0);
   strokeWeight(1);
   //rectangle of the text:
   noFill();
   stroke(0);
   strokeWeight(1);
   rect(0, 0, width_box/2, height_letter_box);
   fill(0); 
   textSize(20);
   text_height = 24;
   textAlign(LEFT);
   text(name + ": " + names[current_color], 10, text_height);  
   
   translate(0, height_letter_box);
   
   //rectangle of the buttons:
   noFill();
   rect(0, 0, width_box, num_rows * height_big_box);
   
   translate(0, -height_letter_box);
   translate(-x_iz - margin, -y_iz - margin); 
   
   return current_color;
}

int over_button(int x_iz, int y_iz, int current_color, color[] colors, String[] colors_names, int width_box, int height_box, int num_rows, int num, int radius,  int margin, int margin_colors, Boolean is_activate){
  //the buttons are over the left:
  int k = 0; //index of the colors[]
  for (int i = 0; i < num_rows; i ++) {
    int j = 0;
    int ax = x_iz + margin_colors;
    int bx = ax + radius;
    int ay = y_iz + margin + i * height_box;
    //print(" radius: " + width_box);
    //print(" j: " + j + " num: " + num + " otro: " + (bx + margin));
    while ( j < num && (bx + margin_colors) < (x_iz + width_box)) {
      
      fill(colors[k]);
      noStroke();
      Boolean over_ellipse = over_ellipse(ax + radius/2, ay + height_box/3, radius, radius);
      if (over_ellipse) {
        stroke(0, 100);
        if (is_activate){
          //is_over[k] = true; 
          strokeWeight(5);
          current_color = k;
        }
      }
      if ( k == current_color ) {
        stroke(dark_beige);
        strokeWeight(5); 
      }
      ellipse(ax + radius/2, ay + height_box/3, radius, radius);
      textSize(15);
      textAlign(CENTER);
      fill(0);
      text(colors_names[k], ax + radius/2, ay + height_box - 17); 
      ax += radius + margin_colors;
      j++;
      k++;
    }
    k++;
  }
  return current_color;
}

int num_rows (int num, int radius,  int margin, int width_box) {
  int aux = num * radius + (num + 1) * margin;
  return int( aux / width_box) + 1;
}

Boolean over_ellipse(int x, int y, int rx, int ry) {
  Boolean over_ellipse = false;
  if ( x - rx/2 < mouseX && mouseX < x + rx/2) {
    if  ( y - ry < mouseY && mouseY < y + ry) {
      over_ellipse = true; 
    }
  }
  return over_ellipse;
}
