package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	import net.flashpunk.FlashEntity;
	import net.flashpunk.FP;
	import flash.display.Loader;
	import net.flashpunk.*;
	
	import net.flashpunk.Sfx;
	
	public class Enemy extends FlashEntity
	{
		[Embed(source = "assets/enemy_walk_right.swf", mimeType = "application/octet-stream")] public static var ENEMY_WALK_RIGHT:Class;
		[Embed(source = "assets/enemy_walk_left.swf", mimeType = "application/octet-stream")] public static var ENEMY_WALK_LEFT:Class;
		public var loader_right:Loader = new Loader();
		public var loader_left:Loader = new Loader();
		
		//load audio files
		[Embed(source = "assets/audio/enemyDeath1.mp3")] private const DEATH_SFX:Class;
		private var deathSFX:Sfx = new Sfx(DEATH_SFX);
		
		public var a:Point;
		public var v:Point;
		public var GRAVITY:int = 10;	//16
		private var H_SPEED:Number = 100;
		private var ENEMY_HEIGHT:Number = 64;
		
		public var hInput:int = 1;
		private var tileSize:Number = Level.tileWidth;
		
		public function Enemy(_x:Number)
		{
			loader_right.contentLoaderInfo.addEventListener(Event.COMPLETE, loadComplete);
			loader_right.loadBytes(new ENEMY_WALK_RIGHT);
			loader_left.loadBytes(new ENEMY_WALK_LEFT);
			
			a = new Point();
			v = new Point();
			
			x = _x;
			y = -64;
			
			this.setHitbox(64, 64, 0, 0);
			
			type = "enemy";
		}
		
		override public function update():void
		{
			v.x = H_SPEED * hInput;
			
			a.y = GRAVITY;
			v.y += a.y;
			
			if (y + ENEMY_HEIGHT > FP.screen.height)
			{
				v.y = 0;
				y = FP.screen.height - ENEMY_HEIGHT;
			}
			
			//stop moving with egg
			if (collide("egg", x, y))
			{
				x = (FP.screen.width / 2) - 32;
				GameWorld.EGG_HEALTH -= 100 * FP.elapsed;
			}
			else
			{
				//if not at egg, move
				updateCollision();
			}
			
			if (collide("bullet", x, y))
			{
				//kill self when collide with bullet
				destroy();
				//deathSFX.play();
			}
			
			
			
			super.update();
		}
		
		private function loadComplete(e:Event):void
		{
			flashgraphic = MovieClip(loader_right.content);
		}
		
		private function destroy():void
		{
			FP.world.remove(this);
		}
		
		private var timeOutside:Number;
		private function checkOutside():void
		{
			timeOutside += FP.elapsed;
			if (timeOutside >= 1)
			{
				if (x > FP.screen.width || x < 0)
				{
					destroy();
				}
				if (y > FP.screen.height || y < 0)
				{
					destroy();
				}
			}
		}
		
		private function updateCollision():void
		{
			x += v.x * FP.elapsed;
			if (collide("level", x, y))
			{
				//trace("Collisions" + x + y);
				
				//Handle Collision here
				if (FP.sign(v.x) > 0)
				{
					//moving right
					v.x = 0;
					x = Math.floor(x / tileSize) * tileSize;
					
					//Change Direction
					hInput = -1;
					flashgraphic = MovieClip(loader_left.content);
				}
				else
				{
					//moving left
					v.x = 0
					x = (Math.floor(x / tileSize) * tileSize) + tileSize;
					
					//Change Direction
					hInput = 1;
					flashgraphic = MovieClip(loader_right.content);
				}
			}
			
			y += v.y * FP.elapsed;
			if (collide("level", x, y))
			{
				//trace("Collisions" + x + y);
				
				//Handle Collision here
				if (FP.sign(v.y) > 0)
				{
					//moving right
					v.y = 0;
					y = Math.floor(y / tileSize) * tileSize;
				}
				else
				{
					//moving left
					v.y = 0
					y = (Math.floor(y / tileSize) * tileSize) + tileSize;

				}
			}
		}
		
	}

}