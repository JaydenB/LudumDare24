package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.*;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	
	public class EvolutionStage_FailText extends Entity
	{
		public var EVOLUTION_FAILTEXT:Text = new Text("Press SPACE to restart", 0, 0, FP.screen.width, FP.screen.height);
		
		public function EvolutionStage_FailText() 
		{
			EVOLUTION_FAILTEXT.text = "Evolutions: " + GameWorld.evolutionCounter;
			EVOLUTION_FAILTEXT.x = (FP.screen.width/2) - 200;
			EVOLUTION_FAILTEXT.y = (FP.screen.height/2) + 70;
			
			super(x, y, EVOLUTION_FAILTEXT);
		}
		
	}

}