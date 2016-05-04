package  
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author Mantis
	 */
	public class Darkness extends FlxSprite
	{
		public function Darkness() 
		{
			makeGraphic( 160, 256, 0xca000000);
			scrollFactor.x = 0; scrollFactor.y = 0;
			blend = "multiply";
		}
	}
}