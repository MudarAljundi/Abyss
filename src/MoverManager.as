package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Mantis
	 */
	public class MoverManager extends FlxGroup
	{
		public function MoverManager() {
			super();
			for ( var i:int; i < 3; i++ ) {
				add( new Mover( ) );
			}
		}
		public function SpawnOne(tx:int, ty:int):void {
			Mover( getFirstAvailable() ).SpawnOne( tx, ty, 0 );
		}
		public function SpawnTwo(tx:int, ty:int):void {
			Mover( getFirstAvailable() ).SpawnOne( tx, ty, 1 );
		}
		override public function update():void {
			super.update();
			for each( var b:FlxSprite in members ) {
				if ( b.y >= FlxG.camera.scroll.y + 250 && b.exists ) {
					Registry.SaveCrusher();
					b.exists = false;
				}
			}
		}
	}
}