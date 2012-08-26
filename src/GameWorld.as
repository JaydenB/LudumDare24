package  
{
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.*;
	
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class GameWorld extends World
	{
		public static var player:Player;
		private var spawnTimer:Number;
		private var spawnInterval:Number = 5;
		
		//load sounds
		[Embed(source = "assets/audio/upgrade1.mp3")] private const UPGRADE_SFX:Class;
		private var upgradeSFX:Sfx = new Sfx(UPGRADE_SFX);
		[Embed(source = "assets/audio/explosion1.mp3")] private const EXPLOSION_SFX:Class;
		private var explosionSFX:Sfx = new Sfx(EXPLOSION_SFX);
		
		public static var enemiesKilled:Number = 0;
		
		public static var EGG_HEALTH:Number = 1000;
		
		public function GameWorld() 
		{
			GameWorld.player = new Player;
			
			add(player);
			add(new Egg_stage1());
			add(new Level());
			
			//add GUI
			add(new EggHealthText());
			add(new UpgradeBar());
			add(new EvolutionCounter_Game());
			add(new PlayerHealth());
			
			resetSpawnTimer();
			
		}
		
		public var timer:Number = 0;
		
		override public function update():void
		{
			updateEggEVOLUTIONCounter();
			
			spawnTimer -= FP.elapsed;
			if (spawnTimer < 0)
			{
				spawnEnemy();
				resetSpawnTimer();
			}
			
			if (EGG_HEALTH < 0 || Player.playerHealth < 0)
			{
				EGG_HEALTH = 0;
				Player.playerHealth = 0;
				//add(new Explosion());
				updateEggExplosionCounter();
				
				explosionSFX.play();
				
			}
			
			super.update();
		}
		
		private function spawnEnemy():void
		{
			var _random:Number = Math.random()*2;
			var _x:Number;
			trace(Math.ceil(_random));
			
			if (Math.ceil(_random) == 1)
			{
				_x = 32;
				add(new Enemy(_x));
				_random = 1.5;
			}
			if (Math.ceil(_random) == 2)
			{
				_x = (FP.screen.width) - 64 - 32 - 10;
				add(new Enemy(_x));
				_random = 0.5;
			}
		}
		
		private function resetSpawnTimer():void
		{
			spawnTimer = spawnInterval;
			spawnInterval *= 0.9
			//spawnInterval *= 0.2;
			if (spawnInterval < 0.2)
			{
				spawnInterval = 0.2;
			}
		}
		
		public var time:Number = 0;
		public var time1:Number = 0;
		public var time2:Number = 0;
		public var time3:Number = 0;
		public var timeEnd:Number = 0;
		
		private function updateEggExplosionCounter():void
		{
			EGG_HEALTH = 0;
			time += FP.elapsed;
			if (time >= 2)
			{
				time = 0;
				resetWorld();
			}
		}
		
		public function resetWorld():void
		{
			FP.world = new FailScreen();
			EGG_HEALTH = 1010;
			Player.playerHealth = 100;
			spawnInterval = 2.5;
			spawnTimer = 0;
			evolutionCounter = 1;
			time1 = 0;
		}
		
		private function updateEndCounter():void
		{
			timeEnd += FP.elapsed;
			if (timeEnd >= 2)
			{
				timeEnd = 0;
				FP.world = new WinWorld();
			}
		}
		
		public static var evolutionCounter:Number = 1;
		private var endEnd:Boolean = false;
		
		private function updateEggEVOLUTIONCounter():void
		{
			var egg1:Entity = FP.world.classFirst(Egg_stage1);
			var egg2:Entity = FP.world.classFirst(Egg_stage2);
			var egg3:Entity = FP.world.classFirst(Egg_stage3);
			var egg4:Entity = FP.world.classFirst(Egg_stage4);
			var egg5:Entity = FP.world.classFirst(Egg_stage5);
			var egg6:Entity = FP.world.classFirst(Egg_stage6);
			var egg7:Entity = FP.world.classFirst(Egg_stage7);
			
			time1 += FP.elapsed;
			if (time1 >= 10)
			{
				
				
				if (evolutionCounter == 1)
				{
					if (egg1) FP.world.remove(egg1);
					add(new Egg_stage2(2));
					
					//create explosion
					add(new UpgradeParticles(15));
					
					upgradeSFX.play();
					time1 = 0;
				}
				else if (evolutionCounter == 2)
				{
					if (egg2) FP.world.remove(egg2);
					add(new Egg_stage3(3));
					
					//create explosion
					add(new UpgradeParticles(15));
					
					upgradeSFX.play();
					time1 = 0;
				}
				else if (evolutionCounter == 3)
				{
					if (egg3) FP.world.remove(egg3);
					add(new Egg_stage4(4));
					
					//create explosion
					add(new UpgradeParticles(15));
					
					upgradeSFX.play();
					time1 = 0;
				}
				else if (evolutionCounter == 4)
				{
					if (egg4) FP.world.remove(egg4);
					add(new Egg_stage5(3));
					
					//create explosion
					add(new UpgradeParticles(15));
					
					upgradeSFX.play();
					time1 = 0;
				}
				else if (evolutionCounter == 5)
				{
					if (egg5) FP.world.remove(egg5);
					add(new Egg_stage6(17));
					
					//create explosion
					add(new UpgradeParticles(25));
					
					upgradeSFX.play();
					time1 = 0;
				}
				else if (evolutionCounter == 6)
				{
					if (egg6) FP.world.remove(egg6);
					add(new Egg_stage7(20));
					
					//create explosion
					add(new UpgradeParticles(30));
					
					upgradeSFX.play();
					time1 = 0;
				}
				else if (evolutionCounter == 7)
				{
					if (egg7) FP.world.remove(egg7);
					add(new Egg_stage8(3));
					evolutionCounter = 8;
					
					//create explosion
					add(new UpgradeParticles(40));
					
					upgradeSFX.play();
					
					time = 0;
					endEnd = true;
				}
				
				if (endEnd == false)
				{
					evolutionCounter += 1;
				}
				
			}
			
			
			if (time1 >= 5 && endEnd)
			{
				resetWorld();
				FP.world = new WinWorld();
			}
		}
		
	}

}