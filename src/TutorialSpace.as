package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Mantis
	 */
	public class TutorialSpace extends FlxSprite
	{
		[Embed(source = "/../assets/img/other/TutorialInGame.png")] private var tutorial_PNG:Class;
		private var turn:int = 0;
		private var hasTouched:Boolean = false;
		private var hasJumped:Boolean = false;
		private var onLeftWall:Boolean = false;
		private var onRightWall:Boolean = false;
		public function TutorialSpace() 
		{
			super( 55, 115 );
			loadGraphic( tutorial_PNG, true, false, 50, 21, false );
			addAnimation( "0", [0], 0, false );
			addAnimation( "KeyLeft", [1], 0, false );
			addAnimation( "KeyRight", [2], 0, false );
			addAnimation( "wall", [3], 0, false );
			scrollFactor.y = 0;
		}
		override public function update():void {
			super.update();
			if ( Registry.player.exists == false ) {
				exists = false;
			}
			
			if ( turn >= 6 ) {
				Registry.knowsWallJump = true;
				exists = false;
			}
			if ( Registry.player.onLeftWall ) {
				onLeftWall = true;
				onRightWall = false;
				play( "0" );
				hasTouched = true;
			} else if ( Registry.player.onRightWall ) {
				onLeftWall = false;
				onRightWall = true;
				play( "0" );
				hasTouched = true;
			}
			
			if ( FlxG.keys.justPressed("SPACE") || FlxG.keys.justPressed("Z")
				|| FlxG.keys.justPressed("UP") || FlxG.keys.justPressed("W") || FlxG.keys.justPressed("ENTER") ) {
					hasJumped = true;
					if ( onLeftWall ) {
						onLeftWall = false;
						if ( Registry.playSFX ) {
							FlxG.play( AssetsRegistry.unlock1_MP3, 0.2, false, false );
						}
						play( "KeyLeft" );
						turn += 1;
					}
					if ( onRightWall ) {
						onRightWall = false;
						if ( Registry.playSFX ) {
							FlxG.play( AssetsRegistry.unlock1_MP3, 0.2, false, false );
						}
						play( "KeyRight" );
						turn += 1;
					}
				}
			
			//Down
			if ( Registry.player.velocity.y == 4.8 ) {
				play( "0" );
			} else {
				if ( !hasTouched && hasJumped ) {
					if ( !onLeftWall || !onRightWall ) {
						play( "wall" );
					}
				}
			}
		}
	}
}