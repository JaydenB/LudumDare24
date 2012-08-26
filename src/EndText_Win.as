package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.*;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	
	public class EndText_Win extends Entity
	{
		public var ENDMENU_WIN:Text = new Text("Press SPACE to restart", 0, 0, FP.screen.width, FP.screen.height);
		
		public function EndText_Win() 
		{
			ENDMENU_WIN.text = "You Win!";
			ENDMENU_WIN.x = (FP.screen.width/2) - 70;
			ENDMENU_WIN.y = (FP.screen.height / 2) - 115;
			
			ENDMENU_WIN.scaleX = 2;
			ENDMENU_WIN.scaleY = 2;
			
			super(x, y, ENDMENU_WIN);
		}
		
	}

}