package  
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author Mantis
	 */
	public class SplatterManager extends FlxGroup
	{
		public function SplatterManager() 
		{
			super();
			for ( var i:int = 0; i < 10; i++ ) {
				add( new Splatter );
			}
		}
		public function SpawnOne(X:int, Y:int, Facing:Boolean):void {
			if ( Y > 100 ) {
				if ( X == 47 || X == 110 ) {
					Y += 500;
				}
			}
			if ( countLiving() < 10 ) {
				Splatter( getFirstAvailable() ).SpawnOne( X, Y, Facing );
			}
		}
		override public function update():void {
			super.update();
			for each( var s:Splatter in members ) {
				if ( s.exists && s.splat.y >= FlxG.camera.scroll.y + 240 ) {
					s.exists = false;
				}
			}
		}
	}
}