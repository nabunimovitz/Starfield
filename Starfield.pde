Particle [] stars;

void setup()
{
	size(500,500);
	stars = new Particle[200];
	for(int i=0; i<stars.length; i++)
	{
		stars[i] = new NormalParticle();
	}
	stars[0] = new OddballParticle();
	stars[1] = new JumboParticle();
}
void draw()
{
	background(0);
	for(int i=0; i<stars.length; i++)
	{
		stars[i].move();
		stars[i].show();
	}

	fill(255,0,0);
	noStroke();
	rect(0,450,500,20);
	rect(125,350,15,150);
	rect(375,350,15,150);
	noFill();
	stroke(255,0,0);
	strokeWeight(3);
	arc(250,350,250,220,0,PI);

	noStroke();
}
class NormalParticle implements Particle
{
	int myColor;
	double myX, myY, dAngle, dSpeed;
	NormalParticle() 
	{
		myX=250;
		myY=150;

		int red = (int)(Math.random()*256);
		int green = (int)(Math.random()*256);
		int blue = (int)(Math.random()*256);

		myColor = color(red, green, blue);
		dAngle = (double)(Math.random()*360);
		dSpeed = (double)(Math.random()*3);
	}

	public void move()
	{
		myX = myX + Math.cos(dAngle)*dSpeed;
		myY = myY + Math.sin(dAngle)*dSpeed;
	}

	public void show()
	{
		fill(myColor);
		ellipse((float)myX, (float)myY, 4,4);
	}

}
interface Particle
{
	public void show();
	public void move();
}
class OddballParticle implements Particle
{
	int oddX;
	OddballParticle()
	{
		oddX=10;
	}

	public void move()
	{
		oddX = oddX+1;
	}

	public void show()
	{
		fill(255);
		rect(oddX,436,15,10);
		rect(oddX+15,441,5,5);
		fill(105);
		ellipse(oddX+5,448,5,5);
		ellipse(oddX+15,448,5,5);
	}
}
class JumboParticle extends NormalParticle
{
	public void show()
	{
		fill(myColor);
		ellipse((float)myX, (float)myY, 15,15);
	}
}

