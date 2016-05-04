package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxTileblock;
	/**
	 * ...
	 * @author Mantis
	 */
	public class WallManager extends FlxGroup
	{
		[Embed(source = "/../assets/Wall_LeftOld3.png")] private var left_PNG:Class;
		[Embed(source = "/../assets/Wall_RightOld3.png")] private var right_PNG:Class;
		public var wall1:FlxTileblock;
		public var wall2:FlxTileblock;
		public function WallManager() {
			super();
		}
		public function SpawnWall1():FlxTileblock {
			wall1 = getFirstAvailable() as FlxTileblock;
			if ( wall1 == null ) {
				wall1 = new FlxTileblock( 0, 0, 17, 240 );
				wall1.loadTiles( left_PNG, 17, 16 );
				wall1.width = 16;
				wall1.allowCollisions = FlxObject.RIGHT;
				wall1.facing = FlxObject.RIGHT;
				add(wall1);
				return wall1;
			}
			return wall1;
		}
		public function SpawnWall2():FlxTileblock {
			wall2 = getFirstAvailable() as FlxTileblock;
			if ( wall2 == null ) {
				wall2 = new FlxTileblock( 0, 0, 17, 240 );
				wall2.loadTiles( right_PNG, 17, 16 );
				wall2.width = 16; wall2.offset.x = 1;
				wall2.allowCollisions = FlxObject.LEFT;
				add(wall2);
				return wall2;
			}
			return wall2;
		}
		override public function update():void {
			super.update();
			for each( var b:FlxTileblock in members ) {
				if ( b.y >= FlxG.camera.scroll.y+240 && b.exists ) {
					b.exists = false;
				}
			}
		}
	}
}