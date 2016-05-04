package  
{
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author Mantis
	 */
	public class PostPreMenuState extends FlxState
	{
		private var timer:Number = 0;
		private var genclops:FlxText;
		
		override public function create():void {
			FlxG.flash( 0xff000000, 0.5 );
			
			genclops = new FlxText( 0, 100, 160, "Music By: Genclops", true );
			genclops.alignment = "center";
			add( genclops );
		}
		override public function update():void {
			super.update();
			timer += FlxG.elapsed;
			
			if ( timer >= 2 ) {
				timer = int.MIN_VALUE;
				FlxG.fade( 0xff000000, 0.5, PostGenclops );
			}
			if ( FlxG.keys.justPressed("SPACE") || FlxG.keys.justPressed("ENTER") || FlxG.mouse.justPressed() ) {
				FadeIn();
			}
		}
		private function FadeIn():void {
			FlxG.fade( 0xff000000, 0.5, PostGenclops );
		}
		private function PostGenclops():void {
			genclops.exists = false;
			FlxG.switchState( new MenuState );
		}
	}
}