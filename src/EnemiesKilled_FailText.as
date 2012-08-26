package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.*;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	
	public class EnemiesKilled_FailText extends Entity
	{
		public var ENEMIES_FAILTEXT:Text = new Text("Press SPACE to restart", 0, 0, FP.screen.width, FP.screen.height);
		
		public function EnemiesKilled_FailText() 
		{
			ENEMIES_FAILTEXT.text = "Enemies Killed: " + GameWorld.enemiesKilled;
			ENEMIES_FAILTEXT.x = (FP.screen.width/2) + 90;
			ENEMIES_FAILTEXT.y = (FP.screen.height/2) + 70;
			
			super(x, y, ENEMIES_FAILTEXT);
		}
		
	}

}

