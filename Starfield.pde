Particle[] part = new Particle[1000];

public void setup()
{
  size(1000,800);
  for(int i = 0; i < part.length; i++){
    part[i] = new NormalParticle();
  }
  for(int i = 0; i < part.length; i = i + 100){
    part[i] = new JumboParticle();
  }
  part[0] = new OddballParticle();
}



public void draw()
{
  background(0);
  for(int i = 0; i < part.length; i++){
    part[i].move();
    part[i].show();
  }

}
class NormalParticle implements Particle
{
  float x;
  float y;
  float z;
  int speed;

  NormalParticle() {
    x = (float)(Math.random() * 2001)-1000;
    y = (float)(Math.random() * 1601)-800;
    z = (float)(Math.random() * 801);
    speed = (int)(Math.random() * 5);
  }


public void move(){
  z = z - speed;
  if( z < 1){
    x = (float)(Math.random() * 2001)-1000;
    y = (float)(Math.random() * 1601)-800;
    z = 1000;
    fill((int)(Math.random() * 256),(int)(Math.random() * 256),(int)(Math.random() * 256));
  }
}

public void show(){
  noStroke();
  if(z > 1){
    fill((int)(Math.random() * 256),(int)(Math.random() * 256),(int)(Math.random() * 256));
  }
  float dx = map(x/z,0,1,0,x);
  float dy = map(y/z,0,1,0,y);
  float s = map(z,0,width,10,0);
  ellipse(dx,dy,s,s);

}
}



interface Particle
{
  public void show();
  public void move();
}




class OddballParticle implements Particle //uses an interface
{
  float x;
  float y;
  float z;


  OddballParticle(){
    x = (float)(Math.random() * 200);
    y = (float)(Math.random() * 200);
    z = 100;
  }

  public void move(){
    
    if(mousePressed == true){
      z = z - 10;
    }
    if(keyPressed == true) {
      z = z + 10;
    }
    if(mouseX > x + 50)
    {
      x = x + (int)(Math.random()*5); 
    }
      else
    {
      x = x - (int)(Math.random()*5); 
    }
      if(mouseY > y + 50)
    {
      y = y + (int)(Math.random()*5); 
    }
      else
    {
      y = y - (int)(Math.random()*5); 
    }
    
  }



  public void show() {
    fill(255);
    rect(x,y,100,100,100+z);
    }
  }



class JumboParticle extends NormalParticle
{
  public void show() {
  noStroke();
  if(z > 1){
    fill((int)(Math.random() * 256),(int)(Math.random() * 256),(int)(Math.random() * 256));
  }
  float dx = map(x/z,0,1,0,x);
  float dy = map(y/z,0,1,0,y);
  float s = map(z,0,width,10,0);
  ellipse(dx,dy,50+s,50+s);
  }
}

