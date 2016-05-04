package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Mantis
	 */
	public class Tutorial1 extends FlxSprite
	{
		[Embed(source="../assets/img/other/Tutorial1.png")] private var tutorial_PNG:Class;
		
		public function Tutorial1() 
		{
			super(16, FlxG.height / 2 - 100);
			loadGraphic( tutorial_PNG, false, false, 128, 150, false );
		}
	}
}