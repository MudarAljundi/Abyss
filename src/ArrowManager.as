package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	/**
	 * ...
	 * @author Mantis
	 */
	public class ArrowManager extends FlxGroup {
		
		public function ArrowManager() {
			super();
			for ( var i:int = 0; i < 5; i++ ) {
				add(new Arrow);
			}
		}
		public function SpawnOne(tx:int, ty:int, Facing:Boolean):void {
			Arrow( getFirstAvailable() ).Spawn( tx, ty, Facing );
		}
		override public function update():void {
			for each( var a:Arrow in members ) {
				if ( a.y >= FlxG.camera.scroll.y+240 && a.exists ) {
					a.exists = false;
				}
			}
		}
	}
}