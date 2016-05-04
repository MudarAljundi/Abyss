package  
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Mantis
	 */
	public class Block extends FlxSprite
	{
		[Embed(source = "/../assets/img/hazards/Spike1.png")] private var spike1_PNG:Class;
		[Embed(source = "/../assets/img/hazards/Spike2.png")] private var spike2_PNG:Class;
		[Embed(source = "/../assets/img/hazards/Spike3.png")] private var spike3_PNG:Class;
		private var graphic:int = 0;
		public function Block() 
		{
			super( x + 99999, y + 99999 );
			graphic = Math.floor( Math.random() * 3 );
			if ( graphic == 0 ) {
				loadGraphic( spike1_PNG, false, false, 16, 16, false );
			} else if ( graphic == 1 ) {
				loadGraphic( spike2_PNG, false, false, 16, 16, false );
			} else if ( graphic == 2 ) {
				loadGraphic( spike3_PNG, false, false, 16, 16, false );
			}
			immovable = true;
			exists = false;
			height = 6;
		}
		public function SpawnOne(tx:int, ty:int):void {
			x = tx; y = ty;
			exists = true;
		}
	}
}