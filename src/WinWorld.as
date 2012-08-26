package 
{
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Key;
	import net.flashpunk.utils.Input;
	import net.flashpunk.*;
	
	public class WinWorld extends World
	{
		
		private var timer:Number = 0;
		
		public function WinWorld() 
		{
			add(new Level());
			add(new Egg_stage8(4));
			add(new EndText_Start());
			add(new EndText_Win());
			add(new EnemiesKilled_WinText());
			add(new EndText());
		}
		
		override public function update():void
		{
			timer += FP.elapsed;
			if (timer >= 2)
			{
				if (Input.pressed(Key.SPACE))
				{
					FP.world = new GameWorld();
				}
			}
			super.update();
		}
		
	}

}