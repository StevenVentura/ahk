import java.awt.Robot;
import java.awt.event.InputEvent;

import java.awt.MouseInfo;
public class clickInOnePlace implements Runnable
{
long delay = 0;
public clickInOnePlace(long delay)
{
this.delay = delay;

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



{


System.out.println("Left clicking");
System.out.println("Move the mouse to the left/right of the screen to enable clicking, and to the bottom or the top of the screen to disable clicking.");
long CT = System.currentTimeMillis();
long LT = System.currentTimeMillis();
while(true)
{
CT = System.currentTimeMillis();
if (CT - LT > 10)
{
LT = CT;
rwEnabled = rwCheck();
}
int x = MouseInfo.getPointerInfo().getLocation().x, y = MouseInfo.getPointerInfo().getLocation().y;
if (rwEnabled && y > 200)
{
Thread.sleep(delay);
if (delay > 0)
{
	rwEnabled = rwCheck();
	if (rwEnabled == false)
		continue;
}
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

boolean out = rwEnabled;
if (x > 100)
out = true;
if (y > 1000 || y <= 200) // overwrites the X check
out = false;

return out;

}


public static void main(String[]args)//has parameter for delay between clicks, in milliseconds.
{
long delay = 0;
if (args != null && args.length == 1)
{
delay = Long.parseLong(args[0]);
System.out.println("Delay set to " + delay + " milliseconds.");
}

new Thread(new clickInOnePlace(delay)).start();

}


}