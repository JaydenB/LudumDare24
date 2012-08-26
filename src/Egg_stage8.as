package  
{
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Loader;
	import flash.events.Event;
	import net.flashpunk.*;
	import net.flashpunk.FP;
	import net.flashpunk.FlashEntity;
	
	public class Egg_stage8 extends FlashEntity
	{
		[Embed(source = "assets/stage8.swf", mimeType = "application/octet-stream")] public static var STAGE8_IMAGE:Class;
		public var loader:Loader = new Loader();
		
		public static var EGG_HEALTH:Number = 1000;
		
		public function Egg_stage8(_y:Number)
		{
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadComplete);
			loader.loadBytes(new STAGE8_IMAGE);
			x = (FP.screen.width / 2) - 32;
			y = (FP.screen.height - 64) - 24 - _y;
			
			type = "egg";
		}
		
		override public function update():void
		{
			super.update();
		}
		
		private function loadComplete(e:Event):void
		{
			flashgraphic = MovieClip(loader.content);
		}
		
		public function destroy():void
		{
			FP.world.remove(this);
		}
		
	}

}