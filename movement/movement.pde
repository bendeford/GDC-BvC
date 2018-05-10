int imgs;
int blocks;

boolean[][] temp;
Entity[] things;
void setup()
{
  things = new Entity[2];
  for(int k = 0; k<things.length; k++){
    things[k]=new Entity();
  }
  things[0] = new Entity(5,5);
  temp = new boolean[16][16];
  imgs = 32;
  blocks = 16;
  size(512, 512);
  background(#ffffff);
  surface.setTitle("bob v. chapman");
  noLoop();
}

void draw()
{
  fill(#ffffff);
  rect(0,0,width,height);
  
  for(int i = 0; i < blocks; i++)
  {
    line((1+i) * imgs,0,(1+i) * imgs, height); 
    line(0, (1+i) * imgs, width, (1+i) * imgs);
  }
  
  if(mousePressed)
  {
    temp=new boolean[16][16];  
    loop();
      things[1].setX(mouseX/imgs);
      things[1].setY(mouseY/imgs);
      things[1].moveArea(things[1].getMov(),things[1].getX(), things[1].getY());
      
  } else {
    fill(#4C36CE,64);
      for(int k = 0; k<temp.length; k++){
        for(int m = 0; m< temp[k].length; m++){
          if(temp[k][m]) rect(k*imgs,m*imgs,imgs,imgs);
        }
      }
  }
  fill(#D61C1C);
  if(frameCount>1) rect(things[1].getX()*imgs, things[1].getY()*imgs ,imgs,imgs);
}

void mousePressed(){
  redraw();
}