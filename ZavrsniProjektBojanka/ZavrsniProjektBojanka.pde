PImage img;
PImage png;
PShape svg;
PShape naslovna;
int flag = 0;
color CurrentColor;
int strokeWeight = 5;
int n = 0;  //n=0 je naslovna strana, n>0 su slike
int[] saved = new int[11];

void setup(){
 size(1100,800); 
 if(n != 0){
   CurrentColor = color(0, 0, 0, 0);
   ucitajSliku(n);
   for(int i=0; i<10; i++)
     saved[i] = 0;
 }
 else{
  //ucitavanje naslovne
     background(255,255,153);
     img = loadImage("tekst/naslovna.png"); 
     image(img, 270, 100);  
     img = loadImage("tekst/start.png"); 
     image(img, 455, 650);  
     naslovna = loadShape("inkscape/brush.svg"); 
     shape(naslovna, 250, 220);      
 }
}

void draw(){
  if(n != 0){
     noStroke();
     paletaBoja();
     buttons();
     fill(CurrentColor);
     ellipse(155, 717, strokeWeight, strokeWeight);
     stroke(CurrentColor);
     strokeWeight(strokeWeight);
     if(flag==1 && mouseX > 300 && pmouseX > 300)
       line(mouseX, mouseY, pmouseX, pmouseY); 
     kontura();
  }
}

void mouseDragged() {
  flag=1;
}
void mouseReleased(){
  flag=0;
}

void mousePressed(){
  if(n != 0){
    //boje
    if(mouseY > 20 && mouseY < 80){
       if(mouseX > 20 && mouseX < 80)
         CurrentColor = color(0,0,0);
       if(mouseX > 100 && mouseX < 160)
         CurrentColor = color(128,128,128);
       if(mouseX > 180 && mouseX < 240)
         CurrentColor = color(192,192,192);
    }
    
    if(mouseY > 100 && mouseY < 160){
       if(mouseX > 20 && mouseX < 80)
         CurrentColor = color(128,0,0);
       if(mouseX > 100 && mouseX < 160)
         CurrentColor = color(255,0,0);
       if(mouseX > 180 && mouseX < 240)
         CurrentColor = color(128,128,0);
    }
    
    if(mouseY > 180 && mouseY < 240){
       if(mouseX > 20 && mouseX < 80)
         CurrentColor = color(255,255,0);
       if(mouseX > 100 && mouseX < 160)
         CurrentColor = color(0,128,0);
       if(mouseX > 180 && mouseX < 240)
         CurrentColor = color(0,255,0);
    }
    
    if(mouseY > 260 && mouseY < 320){
       if(mouseX > 20 && mouseX < 80)
         CurrentColor = color(0,128,128);
       if(mouseX > 100 && mouseX < 160)
         CurrentColor = color(0,255,255);
       if(mouseX > 180 && mouseX < 240)
         CurrentColor = color(0,0,128);
    }
    
    if(mouseY > 340 && mouseY < 400){
       if(mouseX > 20 && mouseX < 80)
         CurrentColor = color(0,0,255);
       if(mouseX > 100 && mouseX < 160)
         CurrentColor = color(128,0,128);
       if(mouseX > 180 && mouseX < 240)
         CurrentColor = color(255,0,255);
    }
    
    
    //previous
    if(mouseX > 20 && mouseX < 280 && mouseY > 450 && mouseY < 487){
      n = max(n-1, 1);
      ucitajSliku(n);
    }  
    //next
    if(mouseX > 20 && mouseX < 280 && mouseY > 500 && mouseY < 544){
      n = min(n+1, 10);
      ucitajSliku(n);
    }
    //save
    if(mouseX > 20 && mouseX < 179 && mouseY > 600 && mouseY < 638){
       saved[n] = 1;
       PImage png = get(300, 0, 800, 800);
       String s = "saved/saved" + n + ".png";
       png.save(s); 
    }
    //restart
    if(mouseX > 20 && mouseX < 211 && mouseY > 650 && mouseY < 687){
       saved[n] = 0;
       setup();
    }
    //kist
    if(mouseX > 20 && mouseX < 120 && mouseY > 700 && mouseY < 737){
       CurrentColor = color(255,255,255);
    }
  }
  
  else{
    //kreni
     if(mouseX > 455 && mouseX < 645 && mouseY > 650 && mouseY < 699)
       n = 1;
       setup();
  }
}

void keyPressed(){
  if(n != 0){
      if(key == '+')
        strokeWeight = min(strokeWeight + 10, 45);
      if(key == '-'){ 
        strokeWeight = max(5, strokeWeight - 10);
        fill(255,255,153);
        noStroke();
        ellipse(155, 717, 47, 47);
      }
  }
}
 
void paletaBoja(){
  noStroke();
  
  fill(0,0,0);
  rect(20, 20, 60, 60, 20);
  fill(128,128,128);
  rect(100, 20, 60, 60, 20);
  fill(192,192,192);
  rect(180, 20, 60, 60, 20);
  
  fill(128,0,0);
  rect(20, 100, 60, 60, 20);
  fill(255,0,0);
  rect(100, 100, 60, 60, 20);
  fill(128,128,0);
  rect(180, 100, 60, 60, 20);
  
  fill(255,255,0);
  rect(20, 180, 60, 60, 20);
  fill(0,128,0);
  rect(100, 180, 60, 60, 20);
  fill(0,255,0);
  rect(180, 180, 60, 60, 20);
  
  fill(0,128,128);
  rect(20, 260, 60, 60, 20);
  fill(0,255,255);
  rect(100, 260, 60, 60, 20); 
  fill(0,0,128);
  rect(180, 260, 60, 60, 20);
 
  fill(0,0,255);
  rect(20, 340, 60, 60, 20);
  fill(128,0,128);
  rect(100, 340, 60, 60, 20);
  fill(255,0,255);
  rect(180, 340, 60, 60, 20);  
}

void buttons(){
   img = loadImage("tekst/prev.png"); 
   image(img, 20, 450);  
   img = loadImage("tekst/next.png"); 
   image(img, 20, 500); 
   img = loadImage("tekst/save.png"); 
   image(img, 20, 600); 
   img = loadImage("tekst/restart.png"); 
   image(img, 20, 650); 
   img = loadImage("tekst/kist.png"); 
   image(img, 20, 700); 
}

void ucitajSliku(int n){
   background(255,255,153);
   String slika;
   if(saved[n] == 0){
     slika = "png/png" + n + ".png";
   }
   else{
     slika = "saved/saved" + n + ".png";
   }
   png = loadImage(slika); 
   image(png, 300, 0);  
} 

void kontura(){
  String source = "inkscape/svg" + n + ".svg";
  svg = loadShape(source);
  shape(svg, 300, 0);
}
 
 
 
 
 
 
 
 
 
 
 
 