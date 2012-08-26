package  
{
	import net.flashpunk.*;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import flash.display.BitmapData;
	
	public class UpgradeBar extends Entity
	{
		
		protected var bulletImage:Image;
		public var time:Number = 10;
		
		public function UpgradeBar() 
		{
			bulletImage = new Image(new BitmapData(FP.screen.width - (35*2), 10));
			x = 35;
			y = FP.screen.height - 17;
			bulletImage.color = 0xFFFFFF;
			graphic = bulletImage;
		}
		
		override public function update():void
		{
			time -= FP.elapsed;
			bulletImage.scaleX = time/10;
			if (time <= 0)
			{
				time = 10;
			}
		}
		
	}

}