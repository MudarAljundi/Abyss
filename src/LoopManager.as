package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxGroup;
	import org.flixel.FlxTileblock;
	/**
	 * ...
	 * @author Mantis
	 */
	public class LoopManager extends FlxGroup
	{
		[Embed(source = "/../assets/img/hazards/TilesLoop.png")] private var loop_PNG:Class;
		public var loop1:FlxTileblock;
		public var loop2:FlxTileblock;
		public function LoopManager() 
		{
			super();
		}
		public function SpawnLoop1():FlxTileblock {
			loop1 = getFirstAvailable() as FlxTileblock;
			if ( loop1 == null ) {
				loop1 = new FlxTileblock( 0, 0, 80, 26 );
				loop1.loadTiles( loop_PNG, 16, 26 );
				loop1.allowCollisions = FlxObject.WALL + FlxObject.UP;
				loop1.height = 20;
				add(loop1);
				return loop1;
			}
			return loop1;
		}
		public function SpawnLoop2():FlxTileblock {
			loop2 = getFirstAvailable() as FlxTileblock;
			if ( loop2 == null ) {
				loop2 = new FlxTileblock( 0, 0, 80, 26 );
				loop2.loadTiles( loop_PNG, 16, 26 );
				loop2.allowCollisions = FlxObject.WALL + FlxObject.UP;
				loop2.height = 20;
				add(loop2);
				return loop2;
			}
			return loop2;
		}
		override public function update():void {
			for each( var b:FlxTileblock in members ) {
				if ( b.y >= FlxG.camera.scroll.y + 240 && b.exists ) {
					Registry.SaveLoop();
					b.exists = false;
				}
			}
		}
	}
}