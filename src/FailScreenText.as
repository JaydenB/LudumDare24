package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.FP;
	
	public class FailScreenText extends Entity
	{
		public var failText:Text = new Text("You Failed!", 0, 0, 320, 240);
		
		public function FailScreenText() 
		{
			failText.text = "You Failed!";
			failText.x = (FP.screen.width/2) - 90;
			failText.y = (FP.screen.height / 2) - 110;
			
			failText.scaleX = 2;
			failText.scaleY = 2;	
			
			super(x, y, failText);
		}
		
	}

}