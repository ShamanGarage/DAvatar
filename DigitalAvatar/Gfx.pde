
void display_background(int img_size, int img_margin, Boolean cut_edges,
  color background){
    translate(img_margin, img_margin);
    
    fill(background);
    noStroke();
    rect(0, 0, img_size, img_size);
        
    if (cut_edges){ 
      display_cut_edges(img_size);
    }
    
    translate(-img_margin, -img_margin);
  }
  
void display_cut_edges(int img_size){
    stroke(0);
    int lenght_cut_edge = 20;
    
    line(5, -lenght_cut_edge, 5, 0);
    line(-lenght_cut_edge, 5, 0, 5);
    
    translate(img_size, 0);
    line(-5, -lenght_cut_edge, -5, 0);
    line(lenght_cut_edge, 5, 0, 5);
    
    translate(0, img_size);
    line(-5, lenght_cut_edge, -5, 0);
    line(lenght_cut_edge, -5, 0, -5);
    
    translate(-img_size, 0);
    line(5, lenght_cut_edge, 5, 0);
    line(-lenght_cut_edge, -5, 0, -5);
    
    translate(0, -img_size);
  }
  
  
