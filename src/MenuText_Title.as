package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.*;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	
	public class MenuText_Title extends Entity
	{
		public var MENU_TITLE:Text = new Text("Volve", 0, 0, FP.screen.width, FP.screen.height);
		
		public function MenuText_Title() 
		{
			MENU_TITLE.text = "Volve";
			MENU_TITLE.x = (FP.screen.width/2) - 45;
			MENU_TITLE.y = (FP.screen.height/2) - 70;
			MENU_TITLE.scaleX = 2;
			MENU_TITLE.scaleY = 2;
			
			super(x, y, MENU_TITLE);
		}
		
	}

}