package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Mantis
	 */
	public class BlockManager extends FlxGroup
	{
		public function BlockManager() 
		{
			super();
			for ( var i:int = 0; i < 21; i++ ) {
				add(new Block);
			}
		}
		public function Platform1(tx:int, ty:int):void {
			Block( getFirstAvailable() ).SpawnOne( tx, ty );
		}
		public function Platform2(tx:int, ty:int):void {
			Block( getFirstAvailable() ).SpawnOne( tx, ty );
			Block( getFirstAvailable() ).SpawnOne( tx + 16, ty );
		}
		public function Platform3(tx:int, ty:int):void {
			Block( getFirstAvailable() ).SpawnOne( tx, ty );
			Block( getFirstAvailable() ).SpawnOne( tx + 16, ty );
			Block( getFirstAvailable() ).SpawnOne( tx + 32, ty );
		}
		public function Platform4(tx:int, ty:int):void {
			Block( getFirstAvailable() ).SpawnOne( tx, ty );
			Block( getFirstAvailable() ).SpawnOne( tx + 16, ty );
			Block( getFirstAvailable() ).SpawnOne( tx + 32, ty );
			Block( getFirstAvailable() ).SpawnOne( tx + 48, ty );
		}
		public function Platform5(tx:int, ty:int):void {
			Block( getFirstAvailable() ).SpawnOne( tx, ty );
			Block( getFirstAvailable() ).SpawnOne( tx + 16, ty );
			Block( getFirstAvailable() ).SpawnOne( tx + 32, ty );
			Block( getFirstAvailable() ).SpawnOne( tx + 48, ty );
			Block( getFirstAvailable() ).SpawnOne( tx + 64, ty );
		}
		public function Platform2x2(tx:int, ty:int):void {
			Block( getFirstAvailable() ).SpawnOne( tx, ty );
			Block( getFirstAvailable() ).SpawnOne( tx + 16, ty );
			Block( getFirstAvailable() ).SpawnOne( tx, ty + 16 );
			Block( getFirstAvailable() ).SpawnOne( tx + 16, ty + 16 );
		}
		public function Platform3x2(tx:int, ty:int):void {
			Block( getFirstAvailable() ).SpawnOne( tx, ty );
			Block( getFirstAvailable() ).SpawnOne( tx + 16, ty );
			Block( getFirstAvailable() ).SpawnOne( tx + 32, ty );
			Block( getFirstAvailable() ).SpawnOne( tx, ty + 16 );
			Block( getFirstAvailable() ).SpawnOne( tx + 16, ty + 16 );
			Block( getFirstAvailable() ).SpawnOne( tx + 32, ty + 16 );
		}
		public function Platform2x3(tx:int, ty:int):void {
			Block( getFirstAvailable() ).SpawnOne( tx, ty );
			Block( getFirstAvailable() ).SpawnOne( tx + 16, ty );
			Block( getFirstAvailable() ).SpawnOne( tx, ty + 16 );
			Block( getFirstAvailable() ).SpawnOne( tx + 16, ty + 16 );
			Block( getFirstAvailable() ).SpawnOne( tx, ty + 32 );
			Block( getFirstAvailable() ).SpawnOne( tx + 16, ty + 32 );
		}
		public function Platform1x4(tx:int, ty:int):void {
			Block( getFirstAvailable() ).SpawnOne( tx, ty );
			Block( getFirstAvailable() ).SpawnOne( tx, ty + 16 );
			Block( getFirstAvailable() ).SpawnOne( tx, ty + 32 );
			Block( getFirstAvailable() ).SpawnOne( tx, ty + 48 );
		}
		public function Platform1x5(tx:int, ty:int):void {
			Block( getFirstAvailable() ).SpawnOne( tx, ty );
			Block( getFirstAvailable() ).SpawnOne( tx, ty + 16 );
			Block( getFirstAvailable() ).SpawnOne( tx, ty + 32 );
			Block( getFirstAvailable() ).SpawnOne( tx, ty + 48 );
			Block( getFirstAvailable() ).SpawnOne( tx, ty + 64 );
		}
		override public function update():void {
			for each( var b:FlxSprite in members ) {
				if ( b.y >= FlxG.camera.scroll.y + 240 && b.exists ) {
					Registry.SaveBlock();
					b.exists = false;
				}
			}
		}
	}
}