package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.*;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	
	public class EvolutionCounter_Game extends Entity
	{
		
		public var EVOLUTION_INGAME:Text = new Text("Press SPACE to restart", 0, 0, FP.screen.width, FP.screen.height);
		
		public function EvolutionCounter_Game() 
		{
			EVOLUTION_INGAME.text = "Evolutions: " + GameWorld.evolutionCounter + "/8";
			EVOLUTION_INGAME.x = (FP.screen.width/2) + 150;
			EVOLUTION_INGAME.y = FP.screen.height - 53;		//47
			
			super(x, y, EVOLUTION_INGAME);
		}
		
		override public function update():void
		{
			EVOLUTION_INGAME.text = "Evolutions: " + GameWorld.evolutionCounter + "/8";
			
			super.update();
		}
		
	}

}