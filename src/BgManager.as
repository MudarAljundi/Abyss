package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Mantis
	 */
	public class BgManager extends FlxGroup
	{
		public function BgManager() 
		{
			super();
			for ( var i:int = 0; i < 3; i++ ) {
				add( new Background );
			}
		}
		public function spawnBG(tx:int, ty:int):void {
			Background( getFirstAvailable() ).SpawnOne( tx, ty );
		}
		override public function update():void {
			for each( var b:FlxSprite in members ) {
				if ( b.y >= FlxG.camera.scroll.y+240 && b.exists ) {
					b.exists = false;
				}
			}
		}
	}
}