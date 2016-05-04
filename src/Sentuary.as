package  
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author Mantis
	 */
	public class Sentuary extends FlxSprite
	{
		[Embed(source = "/../assets/sfx/Fire1.mp3")] private var fire_MP3:Class;
		[Embed(source = "/../assets/img/hazards/Turret1.png")] private var turret_PNG:Class;
		[Embed(source = "/../assets/img/hazards/Turret2.png")] private var turret2_PNG:Class;
		private var canFire:Boolean = true;
		private var arrow:Boolean = false;
		public function Sentuary() 
		{
			super( x, y - 999999 );
			width = 16;
			addAnimation( "normal", [0], 0, false );
			addAnimation( "active", [1], 0, false );
			exists = false;
		}
		public function SpawnOne(tx:int, ty:int, _Arrow:Boolean):void {
			x = tx; y = ty;
			arrow = false;
			play( "normal" );
			if ( x == 0 ) {
				offset.x = 0;
				if ( !_Arrow ) {
					loadGraphic( turret_PNG, true, true, 18, 16, false );
				} else {
					loadGraphic( turret2_PNG, true, true, 23, 16, false );
					arrow = true;
				}
				facing = RIGHT;
			} else if ( x == 143 ) {
				if ( !_Arrow ) {
					loadGraphic( turret_PNG, true, true, 18, 16, false );
					offset.x = 1;
				} else {
					loadGraphic( turret2_PNG, true, true, 23, 16, false );
					offset.x = 6; arrow = true;
				}
				facing = LEFT;
			}
			exists = true;
			canFire = true;
		}
		public function Fire():void {
			if ( canFire ) {
				if ( facing == RIGHT ) {
					if ( !arrow ) {
						Registry.bullet_Man.SpawnOne( x + 5, y + 7, false );
					} else {
						Registry.bullet_Man.SpawnOne( x + 22, y + 6, true );
						play( "active" );
					}
				} else if ( facing == LEFT ) {
					if ( !arrow ) {
						Registry.bullet_Man.SpawnOne( x + 12, y + 7, false );
					} else {
						Registry.bullet_Man.SpawnOne( x - 5, y + 6, true );
						play( "active" );
					}
				}
				if ( Registry.playSFX ) {
					FlxG.play( fire_MP3, 0.4, false, false );
				}
			}
			canFire = false;
		}
	}
}