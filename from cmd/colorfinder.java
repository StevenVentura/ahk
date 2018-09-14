
import java.io.*;

import java.awt.MouseInfo;
import java.awt.Robot;
import java.awt.Color;
import java.awt.datatransfer.*;
import java.awt.*;

public class colorfinder
{
	Robot r;
	public colorfinder() throws Exception
	{
		r = new Robot();
	}
	public void wayt(long time) throws Exception
	{
	try{
		Thread.sleep(time);
		}catch(Exception e){};
	}
	public void g() throws Exception
	{
	
	int consecutiveStillness = 0;
	int lx=-1, ly=-1, x=-1, y=-1;
		while(true){
		
		while(consecutiveStillness < 5)
		{
		
		try{Thread.sleep(100);}catch(Exception e){};
		
		lx = x; ly = y;
		x = MouseInfo.getPointerInfo().getLocation().x; y = MouseInfo.getPointerInfo().getLocation().y;
		
		if (lx == x && ly == y)
		consecutiveStillness++;
		
		}
		Toolkit.getDefaultToolkit().beep();
		consecutiveStillness = 0;
 Color color = r.getPixelColor(x,y);
 String col = color.toString();
  System.out.println("x=" + x + ",y=" + y + "," + col.substring(col.indexOf('[') ));
  String clip = x + ","+y+","+color.getRed()+","+color.getGreen()+","+color.getBlue();
  StringSelection selection = new StringSelection(clip);
    Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard();
    clipboard.setContents(selection, selection);
  wayt(1);
}
}
//	public 
	public static void main(String[]args) throws Exception
	{
		colorfinder c = new colorfinder();
		c.wayt(2000);
		c.g();
	}
}

