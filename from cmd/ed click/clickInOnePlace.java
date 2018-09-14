import java.awt.Robot;
import java.awt.event.InputEvent;

import java.awt.MouseInfo;
public class clickInOnePlace implements Runnable
{
public clickInOnePlace()
{


}


public void run()
{
try{
Robot r = new Robot();
System.out.println("Clicking\r\nStarting in 3...");
Thread.sleep(1000);
System.out.println("Starting in 2...");
Thread.sleep(1000);
System.out.println("Starting in 1...");
Thread.sleep(1000);


/*if (args.length > 0)
{
System.out.println("Right clicking");
while(true)
{
r.mousePress(InputEvent.BUTTON3_MASK);
Thread.sleep(25);
r.mouseRelease(InputEvent.BUTTON3_MASK);
Thread.sleep(25);
}
}
else*/
{


System.out.println("Left clicking");
System.out.println("Move the mouse to the left/right of the screen to enable clicking, and to the bottom or the top of the screen to disable clicking.");
long CT = System.currentTimeMillis();
long LT = System.currentTimeMillis();
while(true)
{
CT = System.currentTimeMillis();
if (CT - LT > 420)
{
LT = CT;
rwEnabled = rwCheck();
}
int x = MouseInfo.getPointerInfo().getLocation().x, y = MouseInfo.getPointerInfo().getLocation().y;
if (rwEnabled && y > 200)
{
r.mousePress(InputEvent.BUTTON1_MASK);
Thread.sleep(50);//Thread.sleep(3);
r.mouseRelease(InputEvent.BUTTON1_MASK);
Thread.sleep(50);//Thread.sleep(4);
}//end rwEnabled
}//end while(true)
}//end block statement{}

}catch(Exception e){};
return;
}

public boolean rwEnabled = false;

public boolean rwCheck()
{
int x = MouseInfo.getPointerInfo().getLocation().x, y = MouseInfo.getPointerInfo().getLocation().y;
//System.out.println("x = " + x + ", " + "y = " + y);

boolean out = rwEnabled;
if (x > 1800 || x < 100)
out = true;
if (y > 1000 || y <= 200) // overwrites the X check
out = false;

return out;

}
/*public static Runnable rw()
{
return new Runnable() {
public void run() {
try{

while(true)
{
Thread.sleep(420);
int x = MouseInfo.getPointerInfo().getLocation().x, y = MouseInfo.getPointerInfo().getLocation().y;
//System.out.println("x = " + x + ", " + "y = " + y);
if (y > 1000)
System.exit(0);//stop the program if the mouse goes to the bottom of the screen.

}

}catch(Exception e){
	e.printStackTrace();System.exit(-1);};


}};

}*/

public static void main(String[]args)
{
//new Thread(rw()).start();//checks to see if the user wants to shut the program off.
new Thread(new clickInOnePlace()).start();

}


}