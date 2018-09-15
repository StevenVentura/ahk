import java.io.*;
import java.util.*;
//import java.net.*;
import javax.swing.*;
import java.awt.event.*;
import java.awt.*;
import java.awt.geom.Line2D;
import java.awt.image.BufferedImage;

public class elevator extends JApplet
{

public elevator()
{

}
private BufferedImage bi;
private Graphics2D g;
private Graphics2D g2;

static final double TRAVEL_TIME = 12;//13;//in seconds.
static final double STALL_TIME = 4.5;
static final double TOTAL_TIME = STALL_TIME*2 + TRAVEL_TIME*2;

private double time = 0;//in seconds.

public void begin()
{

bi = new BufferedImage(getSize().width,getSize().height, 5);
g = bi.createGraphics();
g2 = (Graphics2D)(this.getGraphics());

try{
while(true)
{

Thread.sleep(200);
time += 200f/1000f;
if (time > TOTAL_TIME)
time %= TOTAL_TIME;

/*
if its stlaling them dont move.


*/
if (time < STALL_TIME  || (time > STALL_TIME+TRAVEL_TIME && time< STALL_TIME*2+TRAVEL_TIME))
;//donothing?
else
{
//if moving up, then move up.
if (time >= STALL_TIME && time < STALL_TIME+TRAVEL_TIME)
height += 0.2f / TRAVEL_TIME;
else // if it s moving down, then move down.
height -= 0.2f / TRAVEL_TIME;

}
System.out.println(time);



this.paint();


}}catch(Exception e){};


}

private double height = 0; //goes between 0 and 1;

public void paint()
{
g.setPaint(new Color(43f/255,15f/255,1f/255));//background brown
g.fillRect(0,0,getSize().width,getSize().height);



g.setPaint(new Color(207f/255,186f/255,40f/255));//arrow yellow!!

//if going up, draw up arrows.
if (time > STALL_TIME && time < STALL_TIME+TRAVEL_TIME)
{
//gonna be two lines for a V in a for loop.

for (int h = 0; h < getSize().height - 10; h+= 10)
{

g.draw(new Line2D.Double(50, h+10, 100, h));
g.draw(new Line2D.Double(100, h, 150, h+10));
}

}

//if going down, draw down arrows.
if (time > STALL_TIME*2 + TRAVEL_TIME && time < TOTAL_TIME)
//else
{
for (int h = 0; h < getSize().height - 10; h+= 10)
{
g.draw(new Line2D.Double(50, h-10, 100, h));
g.draw(new Line2D.Double(100, h, 150, h-10));
}

}




g.setPaint(new Color(230f/255,32f/255,32f/255));//elevator red :D
g.fillRect(0,getSize().height-(int)(height/1 * getSize().height) - 5,getSize().width,10);



g2.drawImage(bi, null, 0, 0);
}






public static void main(String[]args)//start the program when the elevator just hits the bottom.
{
elevator e = new elevator();

JFrame f =  new JFrame("EV");

f.setSize(200,(int)java.awt.Toolkit.getDefaultToolkit().getScreenSize().getHeight() - 100);
f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

f.add(e);
f.setVisible(true);
f.setFocusable(false);
e.begin();




}


}