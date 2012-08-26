package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.*;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	
	public class MenuText_Start extends Entity
	{
		public var MENU_START:Text = new Text("Press SPACE to begin", 0, 0, FP.screen.width, FP.screen.height);
		
		public function MenuText_Start() 
		{
			MENU_START.text = "Press SPACE to begin";
			MENU_START.x = (FP.screen.width/2) - 90;
			MENU_START.y = (FP.screen.height/2) + 70;
			
			super(x, y, MENU_START);
		}
		
	}

}