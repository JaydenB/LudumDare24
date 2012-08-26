package  
{
	import net.flashpunk.*;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.utils.*;
	
	public class MenuWorld extends World
	{
		
		public function MenuWorld() 
		{
			add(new Level());
			add(new MenuText_Title());
			add(new MenuText_Start());
			add(new Egg_stage1());
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