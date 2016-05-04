package  
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Mantis
	 */
	public class LoopSpike extends FlxSprite
	{
		public function LoopSpike() 
		{
			super( x + 99999, y + 99999 );
			makeGraphic( 16, 1, 0x0, false );
			immovable = true;
			width = 12; offset.x = 2;
			
			exists = false;
		}
		public function SpawnOne(tx:int, ty:int):void {
			x = tx+2; y = ty;
			exists = true;
		}
	}
}