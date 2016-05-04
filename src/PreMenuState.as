package  
{
	import org.flixel.FlxState;
	import org.flixel.FlxG;
	import org.flixel.FlxText;
	/**
	 * ...
	 * @author Mantis
	 */
	public class PreMenuState extends FlxState
	{
		private var timer:Number = 0;
		private var mantis:FlxText;
		
		override public function create():void {
			FlxG.flash( 0xff000000, 0.5 );
			
			mantis = new FlxText( 0, 100, 160, "A Game By: Mantis", true );
			mantis.alignment = "center";
			add( mantis );
		}
		override public function update():void {
			super.update();
			timer += FlxG.elapsed;
			
			if ( timer >= 2 ) {
				timer = int.MIN_VALUE;
				FadeIn();
			}
			if ( FlxG.keys.justPressed("SPACE") || FlxG.keys.justPressed("ENTER") || FlxG.mouse.justPressed() ) {
				FadeIn();
			}
		}
		private function FadeIn():void {
			FlxG.fade( 0xff000000, 0.5, PostMantis );
		}
		private function PostMantis():void {
			mantis.exists = false;
			FlxG.switchState( new PostPreMenuState );
		}
	}
}