package  
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author Mantis
	 */
	public class LoopSpikeManager extends FlxGroup
	{
		
		public function LoopSpikeManager() 
		{
			super();
			for ( var i:int = 0; i < 20; i++ ) {
				add(new LoopSpike);
			}
		}
		public function SpawnOne(tx:int, ty:int):void {
			LoopSpike( getFirstAvailable() ).SpawnOne( tx, ty );
		}
		override public function update():void {
			for each( var s:LoopSpike in members ) {
				if ( s.y >= FlxG.camera.scroll.y+240 && s.exists ) {
					s.exists = false;
				}
				if ( s.x >= 144 ) {
					s.exists = false;
				} else if ( s.x <= 15 ) {
					s.exists = false;
				}
			}
		}
	}
}