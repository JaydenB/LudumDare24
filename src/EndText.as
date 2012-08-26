package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.*;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	
	public class EndText extends Entity
	{
		
		public var ENDTEXT:Text = new Text("Press SPACE to restart", 0, 0, FP.screen.width, FP.screen.height);
		
		public function EndText() 
		{
			ENDTEXT.text = "Volve fully evolved!";
			ENDTEXT.x = (FP.screen.width/2) - 80;
			ENDTEXT.y = (FP.screen.height/2) - 70;		//47
			
			super(x, y, ENDTEXT);
		}
		
	}

}