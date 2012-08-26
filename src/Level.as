package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.FP;
	import net.flashpunk.masks.Grid;
	
	public class Level extends Entity
	{
		[Embed(source = "assets/tilemap.png")] public static var SPRITE_TILESET:Class;
		
		private var _tiles:Tilemap;
		private var _grid:Grid;
		public static var tileWidth:Number = 16;
		
		public function Level() 
		{
			_tiles = new Tilemap(SPRITE_TILESET, FP.screen.width, FP.screen.height, 32, 32);
			graphic = _tiles;
			layer = 1;
			
			//_tiles.setRect(0, 0, FP.screen.width / tileWidth, FP.screen.height / tileWidth, 0);
			
			//right side
			_tiles.setRect(19, 0, 1, 15, 2);
			_tiles.setTile(19, 3, 5);
			_tiles.setTile(19, 11, 5);
			_tiles.setTile(19, 12, 5);
			
			//left side
			_tiles.setRect(0, 0, 1, 15, 1);
			_tiles.setTile(0, 3, 5);
			_tiles.setTile(0, 11, 5);
			_tiles.setTile(0, 12, 5);
			
			//side platform left
			_tiles.setRect(1, 3, 4, 1, 0);
			_tiles.setTile(5, 3, 4);
			
			//side platform right
			_tiles.setRect(15, 3, 4, 1, 0);
			_tiles.setTile(14, 3, 3);
			
			//small middle platform
			_tiles.setRect(8, 7, 4, 1, 0);
			_tiles.setTile(7, 7, 3);
			_tiles.setTile(12, 7, 4);
			
			//bottom left platform
			_tiles.setRect(1, 11, 4, 1, 8);
			_tiles.setTile(5, 11, 7);
			
			//bottom right platform
			_tiles.setRect(15, 11, 4, 1, 8);
			_tiles.setTile(14, 11, 6);
			
			//bottom floor
			//_tiles.setRect(1, 12, 18, 1, 0);	//length-18
			_tiles.setRect(1, 12, 5, 1, 5);
			
			_tiles.setRect(7, 12, 6, 1, 8);
			_tiles.setTile(6, 12, 9);
			_tiles.setTile(13, 12, 10);
			
			_tiles.setRect(14, 12, 5, 1, 5);
			
			
			_grid = new Grid(FP.screen.width, FP.screen.height, 32, 32, 0, 0);
			mask = _grid;
			
			_grid.setRect(19, 0, 1, 15, true);
			_grid.setRect(0, 0, 1, 15, true);
			
			_grid.setRect(1, 3, 5, 1, true);
			_grid.setRect(14, 3, 5, 1, true);
			
			_grid.setRect(7, 7, 6, 1, true);
			
			_grid.setRect(1, 11, 5, 1, true);
			_grid.setRect(14, 11, 5, 1, true);
			
			_grid.setRect(1, 12, 18, 1, true);
			
			type = "level";
		}
		
	}

}