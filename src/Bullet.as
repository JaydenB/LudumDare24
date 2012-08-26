package  
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.*;
	import net.flashpunk.graphics.Emitter;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Tween;
	import net.flashpunk.utils.*;
	
	public class Bullet extends Entity
	{
		[Embed(source = "assets/bullet.png")] private static var BULLET_IMAGE:Class;
		private const BULLET_SPEED:int = 1000;
		private var direction:int;
		protected var bulletImage:Image;
		
		protected var bulletEmmitter:Emitter;
		protected const EXPLOSION_SIZE:uint = 10;
		
		public function Bullet(_x:Number=0, _y:Number=0,_dir:Number=1) 
		{
			bulletEmmitter = new Emitter(new BitmapData(3, 3), 3, 3);
			bulletEmmitter.newType("bullet", [0]);
			bulletEmmitter.setAlpha("bullet", 0.5, 0);
			bulletEmmitter.setMotion("bullet", 0, 50, 2, 0, 0, -0.5, Ease.quadOut);
			
			this.setHitbox(3, 3);
			direction = _dir;
			x = _x + 32;
			y = _y + 32;
			
			type = "bullet";
			//graphic = bulletEmmitter;
			
			bulletImage = new Image(new BitmapData(8, 5));
			bulletImage.color = 0xFFFFFF;
			graphic = bulletImage;
		}
		
		public function spawnSparticles():void
		{
			for (var i:uint = 0; i < EXPLOSION_SIZE; i++)
			{
				bulletEmmitter.emit("bullet", x, y);
			}
		}
		
		override public function update():void
		{
			x += BULLET_SPEED * direction * FP.elapsed;
			
			if (collide("level", x, y))
			{
				destroy();
			}
			
			if (collide("enemy", x, y))
			{
				GameWorld.enemiesKilled += 1;
				destroy();
			}
			
			
			super.update();
		}
		
		public function destroy():void
		{
			FP.world.remove(this);
		}
		
	}

}