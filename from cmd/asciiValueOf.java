//import java.util.Scanner;
import java.io.*;
import java.util.*;
import java.net.*;
import javax.swing.*;
import java.awt.event.*;
import java.awt.*;

public class asciiValueOf
{

JFrame f;

final JTextArea console = new JTextArea();

public asciiValueOf()
{
}

public void begin()
{
final int width = 200, height = 500;//88;
f = new JFrame("asciiValueOf.java by Steven");
f.setResizable(false);
f.setLayout(new FlowLayout());

f.setSize(width,height);
f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

final JTextField field = new JTextField();
field.setBackground(new Color(0.025f,0.025f,0.025f));
field.setForeground(new Color(0.4862f, 0.1882f, 0.1882f));
field.setFont(new Font("DejaVu Sans", Font.BOLD, 26));

field.setPreferredSize(new Dimension(width-14,88));

field.addActionListener(
	new ActionListener()
	{
		public void actionPerformed(ActionEvent e)
		{
		String text = e.getActionCommand();
		console.append(text + "\r\n");
		
		for (int i = 0; i < text.length(); i++)
		{
		char c = text.charAt(i);
		int lol = (int)c;
		console.append(c + " :: " + lol + "\r\n");
		}
		
		
		
		
		field.setText("");
		}
	}
			);
f.add(field);


JScrollPane jsp = new JScrollPane(console);

console.setBackground(new Color(0.025f,0.025f,0.025f));
console.setForeground(new Color(0.4862f, 0.1882f, 0.1882f));
console.setFont(new Font("DejaVu Sans", Font.BOLD, 12));

jsp.setPreferredSize(new Dimension(width-14,height-88-42));

f.add(jsp);




f.setVisible(true);
}


public static void main(String[]args)
{
asciiValueOf a = new asciiValueOf();
a.begin();
/*Scanner scan = new Scanner(System.in);

while(true)
{
char line = scan.nextLine().charAt(0);
int value = (int)line;
System.out.println(line + " :: " + value);
}*/

}//end main
}//end class asciiValueOf