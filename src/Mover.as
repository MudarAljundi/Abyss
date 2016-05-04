package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Mantis
	 */
	public class Mover extends FlxSprite
	{	
		[Embed(source = "/../assets/sfx/Mover.mp3")] private var mover_MP3:Class;
		[Embed(source = "/../assets/img/hazards/Mover1.png")] private var mover1_PNG:Class;
		[Embed(source = "/../assets/img/hazards/Mover2.png")] private var mover2_PNG:Class;
		private var _type:int;
		public function Mover() {
			super( x, y );
			immovable = true;
			exists = false;
			maxVelocity.x = 75;
		}
		public function SpawnOne(tx:int, ty:int, type:int):void {
			x = tx; y = ty;
			exists = true;
			_type = type;
			
			if ( type == 0 ) {
				loadGraphic( mover1_PNG, false, true, 84, 36, false );
				width = 64;
				height = 16;
				var temp:int = Math.round( Math.random() );
				if ( temp == 0 ) {
					facing = LEFT;
				} else {
					facing = RIGHT
				}
			} else if ( type == 1 ) {
				loadGraphic( mover2_PNG, false, false, 36, 84, false );
				width = 16;
				height = 64;
			}
			offset.x = 10; offset.y = 10;
			
			var rand:int = Math.round( Math.random() );
			if ( rand == 0 ) {
				velocity.x = 50;
				if ( _type == 1 ) {
					velocity.x += 25;
				}
			} else {
				velocity.x = -50;
				if ( _type == 1 ) {
					velocity.x -= 25;
				}
			}
		}
		override public function update():void {
			if ( x <= 16 ) {
				if ( Registry.playSFX ) {
					FlxG.play( mover_MP3, 0.5, false, false );
				}
				velocity.x = +50;
				if ( _type == 1 ) {
					velocity.x += 25;
				}
			} else if ( x + width >= 144 ) {
				if ( Registry.playSFX ) {
					FlxG.play( mover_MP3, 0.5, false, false );
				}
				velocity.x = -50;
				if ( _type == 1 ) {
					velocity.x -= 25;
				}
			}
		}
	}
}