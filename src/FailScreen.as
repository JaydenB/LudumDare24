package  
{
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.*;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class FailScreen extends World
	{
		
		public function FailScreen() 
		{
			add(new FailScreenText());
			add(new restartText());
			add(new EvolutionStage_FailText());
			add(new EnemiesKilled_FailText());
			
			add(new Level());
		}
		
		override public function update():void
		{
			if (Input.pressed(Key.SPACE))
			{
				FP.world = new GameWorld();
			}
			super.update();
		}
		
	}

}