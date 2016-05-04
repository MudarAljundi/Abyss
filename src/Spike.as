package  
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Mantis
	 */
	public class Spike extends FlxSprite
	{
		[Embed(source="../assets/img/hazards/Spike.png")] private var spike_PNG:Class;
		public function Spike() 
		{
			super( x, y, spike_PNG );
			offset.x = 10; offset.y = 10;
			height = 38;
			exists = false;
		}
		public function SpawnOne( tx:int, ty:int ):void {
			reset( tx, ty );
			//x = ty; y = ty;
			exists = true;
		}
	}

}