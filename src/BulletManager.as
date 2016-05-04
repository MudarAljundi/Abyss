package  
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author Mantis
	 */
	public class BulletManager extends FlxGroup
	{
		public function BulletManager()
		{
			super();
			for ( var i:int = 0; i < 5; i++ ) {
				add(new Bullet);
			}
		}
		public function SpawnOne(tx:int, ty:int, arrow:Boolean):void {
			Bullet( getFirstAvailable() ).SpawnOne( tx, ty, arrow );
		}
		override public function update():void {
			super.update();
			for each( var b:Bullet in members ) {
				if ( b.y >= FlxG.camera.scroll.y+240 && b.exists ) {
					b.exists = false;
				}
			}
		}
	}
}