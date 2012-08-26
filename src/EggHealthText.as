package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	
	public class EggHealthText extends Entity
	{
		public var health:Text = new Text("Health: " + 100 + "%", 0, 0, 320, 240);
		
		public function EggHealthText() 
		{
			health.text = "Volve's Health: " + 100 + "%";
			health.x = 15;
			health.y = FP.screen.height - 48;
			
			super(x, y, health);
		}
		
		override public function update():void
		{
			health.text = "Volve's Health: " + Math.ceil(GameWorld.EGG_HEALTH/10) + "%";
		}
		
	}

}