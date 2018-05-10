class Entity{
  
  PVector pos;
  int mov;
  public Entity(){
    pos=new PVector(0,0);
    mov=5;
  }
  
  public Entity(int x, int y){
    pos=new PVector(x,y);
    mov=5;
  }
  
  int getMov(){
    return mov;
  }
  
  int getX(){
    return (int)pos.x;
  }
  
  int getY(){
    return (int)pos.y;
  }
  
  void display(){
    //put stuff here later
  }
  
  boolean[][] findOthers(Entity[] ents){
    boolean[][] ret = new boolean[16][16];
    for(int k = 0; k < ents.length; k++){
      ret[ents[k].getX()][ents[k].getY()] = true;
    }
    return ret;
  }
  
  void moveArea(int s, int x, int y){
    if(s>=0 && x>=0 && x<16 && y>=0 && y<16 && !findOthers(things)[x][y]){
      
      moveArea(s-1, x+1, y);
      moveArea(s-1, x-1, y);
      moveArea(s-1, x, y-1);
      moveArea(s-1, x, y+1);
      temp[x][y] = true;
    }
  }
  
  void setX(int x){
    pos.x=x;
  }
  
  void setY(int x){
    pos.y=x;
  }
}