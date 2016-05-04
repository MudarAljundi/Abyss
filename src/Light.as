package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Mantis
	 */
	public class Light extends FlxSprite
	{
		[Embed(source="/../assets/Light1.png")] private var light_PNG:Class;
		public function Light() 
		{
			loadGraphic( light_PNG, false, false, 300, 300 );
			immovable = true;
			blend = "screen";
		}
		override public function update():void {
			super.update();
			if ( Registry.player.x >= 0 && Registry.player.exists ) {
				x = Registry.player.x-144; y = Registry.player.y-144;
			}
		}
		override public function draw():void {
			var screenXY:FlxPoint = getScreenXY();
			Registry.darkness.stamp( this, screenXY.x, screenXY.y );
		}
	}
}