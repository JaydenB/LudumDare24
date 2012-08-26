package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Emitter;
	import net.flashpunk.FP;
	import net.flashpunk.Tween;
	import net.flashpunk.utils.*;
	
	import flash.display.BitmapData;
	
	public class UpgradeParticles extends Entity
	{
		
		protected var upgradeEmmitter:Emitter;
		protected const UPGRADE_SIZE:uint = 100;
		protected var _yUp:Number;
		
		public function UpgradeParticles(_y:Number = 0)
		{
			//setup emmitter
			upgradeEmmitter = new Emitter(new BitmapData(3, 3), 3, 3);
			
			
			//define particles
			upgradeEmmitter.newType("upgrade", [0]);
			upgradeEmmitter.setAlpha("upgrade", 1, 0);
			upgradeEmmitter.setMotion("upgrade", 0, 50, 2, 360, -40, -0.5, Ease.quadOut);
			
			upgradeEmmitter.relative = false;	
			graphic = upgradeEmmitter;
			
			_yUp = _y;
			
			spawn();
		}
		
		override public function update():void
		{ 
			super.update();
		}
		
		public function spawn():void
		{
			for (var i:uint = 0; i < UPGRADE_SIZE; i++)
			{
				upgradeEmmitter.emit("upgrade", (FP.screen.width / 2), ((FP.screen.height - 64) - 24 + 64 - _yUp));
			}
		}
		
	}

}