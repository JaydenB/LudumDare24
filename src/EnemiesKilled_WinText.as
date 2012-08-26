package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.*;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	
	public class EnemiesKilled_WinText extends Entity
	{
		public var ENEMIES_WINTEXT:Text = new Text("Press SPACE to restart", 0, 0, FP.screen.width, FP.screen.height);
		
		public function EnemiesKilled_WinText() 
		{
			ENEMIES_WINTEXT.text = "Enemies Killed: " + GameWorld.enemiesKilled;
			ENEMIES_WINTEXT.x = (FP.screen.width/2) - 65;
			ENEMIES_WINTEXT.y = (FP.screen.height/2) - 10;
			
			super(x, y, ENEMIES_WINTEXT);
		}
		
	}

}

