package  
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Mantis
	 */
	public class SentuaryManager extends FlxGroup
	{
		public function SentuaryManager() 
		{
			super();
			for ( var i:int = 0; i < 9; i++ ) {
				add(new Sentuary);
			}
		}
		public function SpawnOne(tx:int, ty:int, arrow:Boolean):void {
			Sentuary( getFirstAvailable() ).SpawnOne( tx, ty, arrow );
		}
		override public function update():void {
			for each( var s:Sentuary in members ) {
				if ( s.y >= FlxG.camera.scroll.y+240 && s.exists ) {
					s.exists = false;
				}
				if ( Registry.player.y <= s.y+8 ) {
					s.Fire();
				}
			}
		}
	}
}