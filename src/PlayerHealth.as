package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.*;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	
	public class PlayerHealth extends Entity
	{
		
		public var PLAYERHEALTH:Text = new Text("Press SPACE to restart", 0, 0, FP.screen.width, FP.screen.height);
		
		public function PlayerHealth() 
		{
			PLAYERHEALTH.text = "Player Health: " + Math.ceil(Player.playerHealth) + "%";
			PLAYERHEALTH.x = (FP.screen.width/2) + 150;
			PLAYERHEALTH.y = FP.screen.height - 37;
			
			super(x, y, PLAYERHEALTH);
		}
		
		override public function update():void
		{
			PLAYERHEALTH.text = "Player Health: " + Math.ceil(Player.playerHealth) + "%";
			
			if (Math.ceil(Player.playerHealth) <= 0)
			{
				PLAYERHEALTH.text = "Player Health: " + "0" + "%";
			}
			
			super.update();
		}
		
	}

}