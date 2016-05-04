package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSound;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Mantis
	 */
	public class Lava extends FlxSprite
	{
		[Embed(source = "/../assets/sfx/Lava5.mp3")] private var lava_MP3:Class;
		[Embed(source = "../assets/img/hazards/Lava2.png")] private var lava_PNG:Class;
		[Embed(source = "../assets/img/hazards/LavaTop10.png")] private var lavaTop_PNG:Class;
		public var lavaTop:FlxSprite;
		public var rumble:FlxSound;
		public var fastMove:Boolean = false;
		public var hasJumped:Boolean = false;
		public function Lava() 
		{
			super( 0, 239 );
			lavaTop = new FlxSprite( 16, 239 );
			lavaTop.loadGraphic( lavaTop_PNG, true, false, 128, 8, false );
			lavaTop.addAnimation( "0", [0, 0, 0, 0, 0, 1, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22,
			23, 23, 24, 24, 24, 24, 24, 25, 23, 23, 22, 21, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 1], 25, true );
			lavaTop.play( "0" );
			
			loadGraphic( lava_PNG, false, false, 160, 272, false );
			rumble = FlxG.play( lava_MP3, 0, true, false );
			height = 256; offset.y = 25;
			maxVelocity.y = 10;
			immovable = true;
		}
		override public function update():void {
			super.update();
			lavaTop.y = y - 10;
			acceleration.y = -1;
			if ( fastMove ) {
				acceleration.y = -7;
			}
			if ( Registry.player.y <= Registry.lava.y - 200 ) {
				maxVelocity.y = 70;
			} else if ( Registry.player.y <= Registry.lava.y - 128 ) {
				maxVelocity.y = 40;
			} else if ( Registry.player.y <= Registry.lava.y - 64 ) {
				maxVelocity.y = 30;
			} else if ( Registry.player.y <= Registry.lava.y && !hasJumped ) {
				maxVelocity.y = 1;
				acceleration.y = -0.5;
			}
			
			if ( !hasJumped ) {
				if ( FlxG.keys.justPressed("SPACE") || FlxG.keys.justPressed("Z")
				|| FlxG.keys.justPressed("UP") || FlxG.keys.justPressed("W") || FlxG.keys.justPressed("ENTER") ) {
					hasJumped = true;
				}
			}
			//if ( Registry.player.y >= Registry.lava.y - 240 && rumble.volume < 0.1 ) {
			//	rumble.volume += 0.1;
			//} else if ( Registry.player.y >= Registry.lava.y - 170 && rumble.volume <= 0.3 ) {
			//	rumble.volume += 0.1;
			//} else if ( Registry.player.y >= Registry.lava.y - 125 && rumble.volume <= 0.6 ) {
				//rumble.volume += 0.1;
			if ( !rumble.active ) {
				rumble.resume();
			}
			
			if ( Registry.playSFX && rumble.volume <= 0.5 && Registry.player.y >= Registry.lava.y - 75  ) {
					rumble.volume += 0.2;
			} else {
				rumble.volume = 0.0;
			}
			if ( !Registry.playSFX ) {
				rumble.volume = 0.0;
			}
			if ( y <= FlxG.camera.scroll.y-6 ) {
				maxVelocity.y = 0;
				velocity.y = 0;
			}
		}
	}
}