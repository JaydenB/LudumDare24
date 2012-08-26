package net.flashpunk 
{
	import flash.display.IBitmapDrawable;
	import flash.geom.ColorTransform;
	import flash.geom.Point;
	import net.flashpunk.Mask;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	
	/**
	 * ==========================
	 * ENTITIES FLASHENTITY CLASS
	 * ==========================
	 * 
	 * This is a simple base class for any entity that needs to render
	 * a flash graphic type (eg movie clip) instead of or as well as 
	 * traditional FlashPunk graphics types.
	 */
	public class FlashEntity extends Entity
	{
		public var flashgraphic: IBitmapDrawable;
		public var flashscale: Number = 1;
		public var flashoffset: Point = new Point;
		public var flashangle: Number = 0;
		public var flashalpha: Number = 1;
		
		private var m_ColourTransform: ColorTransform = new ColorTransform(1, 1, 1, flashalpha);
		
		public function FlashEntity(x: Number = 0, y: Number = 0, layer: Number = 0, mask: Mask = null)
		{
			super(x, y, null, mask);
			this.layer = layer;
		}
		
		/**
		 * Render function
		 */
		public override function render(): void
		{
			super.render();
			
			m_ColourTransform.alphaMultiplier = flashalpha;
			
			if(flashgraphic && flashalpha > 0)	//if the flash graphic is set
			{
				FP.matrix.identity();	//render it
				FP.matrix.rotate(FP.RAD * (-flashangle));
				FP.matrix.scale(flashscale, flashscale);
				FP.matrix.translate(x - FP.camera.x + flashoffset.x, y - FP.camera.y + flashoffset.y);
				FP.buffer.draw(flashgraphic, FP.matrix, m_ColourTransform);
			}
		}
		
	}

}
