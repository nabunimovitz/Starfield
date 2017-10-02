Particle [] stars;

void setup()
{
	size(500,500);
	stars = new Particle[200];
	for(int i=0; i<stars.length; i++)
	{
		stars[i] = new NormalParticle(250,150);
	}
	stars[0] = new OddballParticle();
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
	//arc(250,400,250,250,0,);
}
class NormalParticle implements Particle
{
	int myColor;
	double myX, myY, dAngle, dSpeed;
	NormalParticle(double x, double y) 
	{
		myX=x;
		myY=y;

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
		ellipse((float)myX, (float)myY, 5,5);
	}

}
interface Particle
{
	//your code here
	public void show();
	public void move();
}
class OddballParticle implements Particle
{
	//your code here
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
		rect(oddX,440,15,10);
		rect(oddX+15,445,5,5);
		fill(192,192,192);
		ellipse(oddX+5,447,5,5);
	}
}
class JumboParticle //uses inheritance
{
	//your code here
}

