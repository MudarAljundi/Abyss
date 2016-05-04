package  
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Mantis
	 */
	public class Arrow extends FlxSprite {
		[Embed(source = "/../assets/img/hazards/Arrow.png")] private var arrow_PNG:Class;
		public function Arrow() {
			loadGraphic( arrow_PNG, false, true, 16, 5, false );
			exists = false;
		}
		public function Spawn(tx:int, ty:int, Facing:Boolean):void {
			if ( Facing == false ) {
				reset( 9, ty );
				facing = LEFT;
			} else {
				reset( 135, ty );
				facing = RIGHT;
			}
			exists = true;
		}
	}
}