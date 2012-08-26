package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.*;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	
	public class EndText_Start extends Entity
	{
		public var ENDMENU_START:Text = new Text("Press SPACE to restart", 0, 0, FP.screen.width, FP.screen.height);
		
		public function EndText_Start() 
		{
			ENDMENU_START.text = "Press SPACE to restart";
			ENDMENU_START.x = (FP.screen.width/2) - 100;
			ENDMENU_START.y = (FP.screen.height/2) + 70;
			
			super(x, y, ENDMENU_START);
		}
		
	}

}