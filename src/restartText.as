package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.FP;
	
	public class restartText extends Entity
	{
		public var restartText1:Text = new Text("Press SPACE to restart", 0, 0, 320, 240);
		
		public function restartText() 
		{
			restartText1.text = "Press SPACE to restart";
			restartText1.x = (FP.screen.width/2) - 100;
			restartText1.y = (FP.screen.height/2) - 30;
			
			super(x, y, restartText1);
		}
		
	}

}