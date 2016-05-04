package  
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Mantis
	 */
	public class Background extends FlxSprite
	{
		[Embed(source = "/../assets/BG22.png")] private var bg1_PNG:Class;
		public function Background() {
			loadGraphic( bg1_PNG, false, false, 130, 240, false );
			exists = false;
		}
		public function SpawnOne(tx:int, ty:int):void {
			x = tx; y = ty;
			exists = true;
		}
	}
}