package  
{
	import org.flixel.FlxButton;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;
	import org.flixel.FlxState;
	/**
	 * ...
	 * @author Mantis
	 */
	public class TutorialState extends FlxState {
		private var space:FlxSprite;
		private var ok:FlxText;
		override public function create():void {
			FlxG.flash( 0xff000000, 0.6 );
			if ( FlxG.music && Registry.playMusic && !Registry.firstTimeEVAR ) {
				FlxG.music.volume = 0.5;
			}
			if ( Registry.firstTimeEVAR ) {
				FlxG.playMusic( Theme1, 0 );
				FlxG.music.stop();
			}
			
			space = new FlxSprite( 11, 200, AssetsRegistry.space_PNG );
			ok = new FlxText( 60, 199, 128, " OK", true )
			add( space ); add( ok );
			
			Registry.tutorial1 = new Tutorial1();
			Registry.options = new Options(false);
			
			add( Registry.tutorial1 );
			add( Registry.options );
		}
		override public function update():void {
			super.update();
			if ( Registry.firstTimeEVAR ) {
				FlxG.music.stop();
			}
			if ( FlxG.keys.justPressed("SPACE") || FlxG.keys.justPressed("Z") || FlxG.keys.justPressed("O")
				|| FlxG.keys.justPressed("UP") || FlxG.keys.justPressed("W") || FlxG.keys.justPressed("ENTER") ) {
				FadeIn();
			}
		}
		private function FadeIn():void {
			FlxG.fade( 0xff000000, 0.5, SwitchState, false ); 
		}
		private function SwitchState():void {
			Registry.firstTimeEVAR = false;
			FlxG.switchState( new PlayState() ); 
		}
	}
}