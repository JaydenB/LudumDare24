package 
{
	import net.flashpunk.Engine
	import net.flashpunk.FP;
	
	[SWF(width = "640", height = "416")]
	
	public class Main extends Engine
	{
		
		public function Main()
		{
			super(640, 416, 60, false);
			FP.world = new MenuWorld();
			
			//FP.console.enable();
		}
	
	}
	
}