package  
{
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	import net.flashpunk.FlashEntity;
	import net.flashpunk.FP;
	import net.flashpunk.*;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	import net.flashpunk.Sfx;
	
	public class Player extends FlashEntity
	{
		//load swf assets
		[Embed(source = "assets/player_idle_right.swf", mimeType = "application/octet-stream")] public static var PLAYER_IDLE_RIGHT:Class;
		[Embed(source = "assets/player_idle_left.swf", mimeType = "application/octet-stream")] public static var PLAYER_IDLE_LEFT: Class;
		[Embed(source = "assets/player_walk_right.swf", mimeType = "application/octet-stream")] public static var PLAYER_WALK_RIGHT:Class;
		[Embed(source = "assets/player_walk_left.swf", mimeType = "application/octet-stream")] public static var PLAYER_WALK_LEFT: Class;
		[Embed(source = "assets/player_shoot_right.swf", mimeType = "application/octet-stream")] public static var PLAYER_SHOOT_RIGHT:Class;
		[Embed(source = "assets/player_shoot_left.swf", mimeType = "application/octet-stream")] public static var PLAYER_SHOOT_LEFT: Class;
		
		//load audio
		[Embed(source = "assets/audio/hurt1.mp3")] private const HURT_SFX:Class;
		[Embed(source = "assets/audio/jump1.mp3")] private const JUMP_SFX:Class;
		[Embed(source = "assets/audio/shoot1.mp3")] private const SHOOT_SFX:Class;
		
		public var loader_idle_right:Loader = new Loader();
		public var loader_idle_left:Loader = new Loader();
		public var loader_walk_right:Loader = new Loader();
		public var loader_walk_left:Loader = new Loader();
		public var loader_shoot_right:Loader = new Loader();
		public var loader_shoot_left:Loader = new Loader();
		
		public static var direction:int = 1;
		private var H_SPEED:Number = 200;
		public var PLAYER_HEIGHT:Number = 64;
		public static var GRAVITY:int = 16;
		private var a:Point;
		private var v:Point;
		
		public var PLAYER_LIVES:int = 2;
		
		public var weaponSlot:Number = 1;	//1=Gun	2=Melee
		
		private var tileSize:Number = Level.tileWidth;
		
		private var jumpTimer:Number = 0;
		public var jumping:Boolean = false;
		
		private var recoil:Number = 300;
		
		public var isWalking:Boolean = false;
		
		//load sound effects into variables
		public var hurtSFX:Sfx = new Sfx(HURT_SFX);
		public var shootSFX:Sfx = new Sfx(SHOOT_SFX);
		public var jumpSFX:Sfx = new Sfx(JUMP_SFX);
		
		public var xSize:Number = 64;
		public static var playerHealth:Number = 100;
		
		public function Player() 
		{
			a = new Point();
			v = new Point();
			
			this.setHitbox(xSize, 64, 0, 0);
			x = (FP.screen.width/2)-(xSize/2);
			
			type = "player";
			
			loader_idle_right.contentLoaderInfo.addEventListener(Event.COMPLETE, loadComplete);
			loader_idle_right.loadBytes(new PLAYER_IDLE_RIGHT);
			
			loader_idle_left.loadBytes(new PLAYER_IDLE_LEFT);
			loader_walk_right.loadBytes(new PLAYER_WALK_RIGHT);
			loader_walk_left.loadBytes(new PLAYER_WALK_LEFT);
			loader_shoot_right.loadBytes(new PLAYER_SHOOT_RIGHT);
			loader_shoot_left.loadBytes(new PLAYER_SHOOT_LEFT);
		}
		
		override public function update():void
		{
			//Checking playing input
			var hInput:int;
			if (Input.check(Key.LEFT))
			{
				hInput -= 1;
				direction = -1;
				
				//change player image
				//PLAYER_IMAGE = PLAYER_IDLE_LEFT;
				//PLAYER_IMAGE.nextFrame();
				flashgraphic = MovieClip(loader_idle_left.content);
				isWalking = true;
			}
			if (Input.check(Key.RIGHT))
			{
				hInput += 1;
				direction = 1;
				
				//change player image
				//PLAYER_IMAGE = PLAYER_IDLE_RIGHT;
				//PLAYER_IMAGE.prevFrame();
				flashgraphic = MovieClip(loader_idle_right.content);
				isWalking = true;
			}
			
			if (Input.pressed(Key.UP))
			{
				isWalking = false;
				jump();
			}
			
			if (Input.pressed(Key.SPACE))
			{
				if (weaponSlot == 1)
				{
					shoot();
					//x += recoil * -direction * FP.elapsed;
					shootSFX.play();
				}
				if (weaponSlot == 2)
				{
					meleeAttack();
				}
			}
			
			//Update physics
			v.x = H_SPEED * hInput;
			
			a.y = GRAVITY;
			v.y += a.y;
			
			updateCollision();
			
			//Collision with Boundaries
			if (y + PLAYER_HEIGHT > FP.screen.height)
			{
				v.y = 0;
				y = FP.screen.height - PLAYER_HEIGHT;
				jumpTimer = 0;
			}
			
			if (collide("enemy", x, y))
			{
				playerHealth -= 0.25;
			}
			
			/*
			//Collide with enemies
			if (collide("enemy", x, y))
			{
				hitTimer();
				PLAYER_LIVES -= 1;
				this.collidable = false;
				this.collidable = true;
			}
			*/
			if (jumping == false)
			{
				if (Input.check(Key.LEFT) || Input.check(Key.RIGHT))
				{
					if (direction == -1)
					{
						flashgraphic = MovieClip(loader_walk_left.content);
					}
					else if (direction == 1)
					{
						flashgraphic = MovieClip(loader_walk_right.content);
					}
				}
				else
				{
					if (direction == -1)
					{
						flashgraphic = MovieClip(loader_idle_left.content);
					}
					else if (direction == 1)
					{
						flashgraphic = MovieClip(loader_idle_right.content);
					}
				}
			}
			
			//Update other shit
			super.update();
		}
		
		private function loadComplete(e:Event):void
		{
			flashgraphic = MovieClip(loader_idle_right.content);
		}
		
		private function jump():void
		{
			
			if (jumpTimer <= 1 )
			{
				jumping = true;
				v.y = -400;
				jumpTimer += 1;
				jumpSFX.play();
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
					jumpTimer = 0;
					jumping = false;
				}
				else
				{
					//moving left
					v.x = 0
					x = (Math.floor(x / tileSize) * tileSize) + tileSize;
					jumpTimer = 0;
					jumping = false;
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
					jumpTimer = 0;
					jumping = false;
				}
				else
				{
					//moving left
					v.y = 0
					y = (Math.floor(y / tileSize) * tileSize) + tileSize;
					//jumpTimer = 0;
					jumping = false;
				}
			}
		}
		
		public function shoot():void
		{
			world.add(new Bullet(x,y,direction));
		}
		
		public function meleeAttack():void
		{
			
		}
		
		public var time:Number = 0;
		
		private function hitTimer():void
		{
			time += FP.elapsed;
			if (time >= 2)
			{
				time = 0;
				this.collidable = true;
			}
		}
		
	}

}