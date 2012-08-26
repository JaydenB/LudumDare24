package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Emitter;
	import net.flashpunk.FP;
	import net.flashpunk.Tween;
	import net.flashpunk.utils.*;
	
	import flash.display.BitmapData;
	
	public class Explosion extends Entity
	{
		
		protected var explosionEmmitter:Emitter;
		protected const EXPLOSION_SIZE:uint = 10;
		
		public function Explosion()
		{
			//setup emmitter
			explosionEmmitter = new Emitter(new BitmapData(3, 3), 3, 3);
			
			
			//define particles
			explosionEmmitter.newType("explode", [0]);
			explosionEmmitter.setAlpha("explode", 1, 0);
			explosionEmmitter.setMotion("explode", 0, 50, 2, 360, -40, -0.5, Ease.quadOut);
			
			explosionEmmitter.relative = false;	
			graphic = explosionEmmitter;
			
			spawn();
		}
		
		override public function update():void
		{
			super.update();
		}
		
		public function spawn():void
		{
			for (var i:uint = 0; i < EXPLOSION_SIZE; i++)
			{
				explosionEmmitter.emit("explode", (FP.screen.width / 2), ((FP.screen.height - 64) - 24 + 64));
			}
		}
		
	}

}