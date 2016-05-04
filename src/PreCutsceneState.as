package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxSound;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxCamera;
	import org.flixel.FlxText;
	import org.flixel.FlxTileblock;
	/**
	 * ...
	 * @author Mantis
	 */
	public class PreCutsceneState extends FlxState
	{
		[Embed(source = "../assets/sfx/bird cutscene1 cut1.mp3")] private var tune_MP3:Class;
		[Embed(source = "../assets/img/cutscene/CloudBIG1.png")] private var cloudBIG1_PNG:Class;
		[Embed(source = "../assets/img/cutscene/CloudBIG2.png")] private var cloudBIG2_PNG:Class;
		[Embed(source = "../assets/img/cutscene/CloudSmall1.png")] private var cloudSmall1_PNG:Class;
		[Embed(source = "../assets/img/cutscene/CloudSmall2.png")] private var cloudSmall2_PNG:Class;
		[Embed(source = "../assets/img/cutscene/Faller.png")] private var faller_PNG:Class;
		[Embed(source="../assets/img/cutscene/Background1.png")] private var image_PNG:Class;
		[Embed(source = "../assets/img/cutscene/Space.png")] private var space_PNG:Class;
		private var camera:FlxCamera;
		private var cameraScroller:FlxSprite;
		private var skipTimer:Number = -5000;
		private var timer:Number = 0;
		private var space:FlxSprite;
		private var ok:FlxText;
		
		private var cloudBIG1:FlxSprite;
		private var cloudBIG2:FlxSprite;
		private var cloudSmall1A:FlxSprite;
		private var cloudSmall1B:FlxSprite;
		private var cloudSmall2:FlxSprite;
		
		private var image:FlxSprite;
		private var faller:FlxSprite;
		
		override public function create():void {
			camera = new FlxCamera( 0, 0, 320, 480, 1 ); 
			FlxG.addCamera( camera );
			FlxG.flash( 0xff000000, 1.5 );
			if ( Registry.playMusic ) {
				FlxG.playMusic( tune_MP3, 0.7 );
			} else {
				FlxG.playMusic( tune_MP3, 0 );
			}
			
			cameraScroller = new FlxSprite( 0, 0 );
			cameraScroller.makeGraphic( 1, 1, 0x00000000, false );
			cameraScroller.maxVelocity.y = 50;
			
			cloudBIG1 = new FlxSprite( 0, 137, cloudBIG1_PNG );
			cloudBIG1.maxVelocity.x = 8;
			cloudBIG1.velocity.x -= 8;
			cloudBIG2 = new FlxSprite( 231, 179, cloudBIG2_PNG );
			cloudBIG2.maxVelocity.x = 5;
			cloudBIG2.velocity.x += 5;
			cloudSmall1A = new FlxSprite( 139, 198, cloudSmall1_PNG );
			cloudSmall1A.maxVelocity.x = 2;
			cloudSmall1A.velocity.x -= 2;
			cloudSmall1B = new FlxSprite( 217, 177, cloudSmall1_PNG );
			cloudSmall1B.maxVelocity.x = 3;
			cloudSmall1B.velocity.x += 3;
			cloudSmall2 = new FlxSprite( 93, 150, cloudSmall1_PNG );
			cloudSmall2.maxVelocity.x = 3;
			cloudSmall2.velocity.x -= 3;
			
			image = new FlxSprite( 0, 0, image_PNG );
			faller = new FlxSprite( 110, 600, faller_PNG );
			faller.scrollFactor.y = 0.7;
			
			space = new FlxSprite( 24, 420, space_PNG );
			space.scrollFactor.y = 0;
			space.visible = false;
			
			add( cameraScroller );
			add( image );
			add( cloudSmall1A ); add( cloudSmall1B ); add( cloudSmall2 );
			add( cloudBIG1 ); add( cloudBIG2 );
			add( faller );
			add( space );
		}
		
		override public function update():void {
			super.update();
			timer += FlxG.elapsed;
			skipTimer += FlxG.elapsed;
			if ( skipTimer > 0 && FlxG.keys.justPressed("SPACE") ) {
				SkipShit();
			}
			if ( FlxG.keys.justPressed("SPACE") || FlxG.keys.justPressed("ENTER") || FlxG.keys.justPressed("ESCAPE") || FlxG.mouse.justPressed() ) {
				skipTimer = 0;
				space.visible = true;
			}
			if ( skipTimer > 2.5 ) {
				skipTimer = -5000;
				space.visible = false;
			}
			if ( timer >= 3 && cameraScroller.y < 500 ) {
				cameraScroller.acceleration.y += 5;
				camera.scroll.y = cameraScroller.y;
			}
			if ( cameraScroller.y > 50 ) {
				cameraScroller.maxVelocity.y = 55;
			} if ( cameraScroller.y > 100 ) {
				cameraScroller.maxVelocity.y = 60;
			} if ( cameraScroller.y > 150 ) {
				cameraScroller.maxVelocity.y = 65;
			} if ( cameraScroller.y > 200 ) {
				cameraScroller.maxVelocity.y = 70;
			} if ( cameraScroller.y > 250 ) {
				cameraScroller.maxVelocity.y = 75;
			} if ( cameraScroller.y > 300 ) {
				cameraScroller.maxVelocity.y = 80;
			} if ( cameraScroller.y > 350 ) {
				cameraScroller.maxVelocity.y = 85;
			} if ( cameraScroller.y > 400 ) {
				cameraScroller.maxVelocity.y = 90;
			} if ( cameraScroller.y > 450 ) {
				cameraScroller.maxVelocity.y = 95;
			} if ( cameraScroller.y > 500 ) {
				cameraScroller.velocity.y = 0;
				cameraScroller.exists = false;
			}
			if ( timer >= 11.5 ) {
				timer = int.MIN_VALUE;
				FadeIn();
			}
		}
		private function FadeIn():void {
			FlxG.fade( 0xff000000, 0.5, Start );
		}
		private function Start():void {
			FlxG.switchState( new CutsceneState );
		}
		private function SkipShit():void {
			FlxG.fade( 0xff000000, 0.5, StartNOW );
		}
		private function StartNOW():void {
			FlxG.music.stop();
			FlxG.switchState( new TutorialState );
		}
	}
}