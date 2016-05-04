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
	public class CutsceneState extends FlxState
	{
		[Embed(source = "../assets/sfx/Fall3.mp3")] private var fall_MP3:Class;
		[Embed(source = "../assets/img/cutscene/Actor.png")] private var actor_PNG:Class;
		[Embed(source = "../assets/img/cutscene/Object.png")] private var object_PNG:Class;
		[Embed(source = "../assets/img/cutscene/Lava.png")] private var lava_PNG:Class;
		[Embed(source = "../assets/img/cutscene/BG3.png")] private var bg_PNG:Class;
		
		private var awake:Boolean = false;
		private var fall:FlxSound;
		private var timer:Number = 0;
		private var skipTimer:Number = -5000;
		
		private var bg1:FlxSprite;
		private var bg2:FlxSprite;
		private var bg3:FlxSprite;
		private var bg4:FlxSprite;
		private var bg5:FlxSprite;
		private var bg6:FlxSprite;
		private var bg7:FlxSprite;
		private var bg8:FlxSprite;
		private var bg9:FlxSprite;
		private var bg10:FlxSprite;
		private var bg11:FlxSprite;
		
		private var space:FlxSprite;
		private var ok:FlxText;
		
		private var lava:FlxSprite;
		private var actor:FlxSprite;
		private var o:FlxTileblock;
		
		override public function create():void {
			FlxG.flash( 0xff000000, 1.5 );
			
			if ( Registry.playSFX ) {
				fall = FlxG.play( fall_MP3, 0.5, false, true );
			} else {
				fall = FlxG.play( fall_MP3, 0, false, true );
			}
			
			Registry.options = new Options(false);
			
			bg1 = new FlxSprite( 0, 0, bg_PNG );
			bg2 = new FlxSprite( 0, 250, bg_PNG );
			bg3 = new FlxSprite( 0, 500, bg_PNG );
			bg4 = new FlxSprite( 0, 750, bg_PNG );
			bg5 = new FlxSprite( 0, 1000, bg_PNG );
			bg6 = new FlxSprite( 0, 1250, bg_PNG );
			bg7 = new FlxSprite( 0, 1500, bg_PNG );
			bg8 = new FlxSprite( 0, 1750, bg_PNG );
			bg9 = new FlxSprite( 0, 2000, bg_PNG );
			bg10 = new FlxSprite( 0, 2250, bg_PNG );
			bg11 = new FlxSprite( 0, 2500, bg_PNG );
			add( bg1 ); add( bg2 );
			add( bg3 ); add( bg4 );
			add( bg5 ); add( bg6 );
			add( bg7 ); add( bg8 );
			add( bg9 ); add( bg10 );
			add( bg11 );
			
			space = new FlxSprite( 11, 210, AssetsRegistry.space_PNG );
			space.scrollFactor.y = 0; space.visible = false;
			ok = new FlxText( 61, 209, 128, "SKIP", true )
			ok.scrollFactor.y = 0; ok.visible = false;
			
			o = new FlxTileblock( 16, 2550, 128, 64 );
			o.loadTiles( object_PNG, 32, 32 );
			add( o );
			
			lava = new FlxSprite( 0, 2545, lava_PNG );
			
			actor = new FlxSprite( 66, 100 );
			actor.loadGraphic( actor_PNG, true, false, 28, 32, false );
			actor.addAnimation( "0", [0], 0, false );
			actor.addAnimation( "sleep", [1], 0, false );
			//							  Half Blink							Blink							Blink							Blink
			actor.addAnimation( "awake", [2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 2, 3, 2, 1, 1, 1, 1, 1, 1, 1, 1, 2, 3, 2, 3, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 3], 15, false );
			actor.velocity.y += 500; //250
			actor.play( "0" );
			
			FlxG.camera.follow( actor, FlxCamera.STYLE_TOPDOWN );
			
			add( actor );
			add( lava );
			add( space ); add( ok );
			add( Registry.options );
		}
		
		override public function update():void {
			super.update();
			timer += FlxG.elapsed;
			skipTimer += FlxG.elapsed;
			if ( skipTimer > 0 && FlxG.keys.justPressed("SPACE") ) {
				FadeIn();
			}
			if ( FlxG.keys.justPressed("SPACE") || FlxG.keys.justPressed("ENTER") || FlxG.keys.justPressed("ESCAPE") || FlxG.mouse.justPressed() ) {
				skipTimer = 0;
				space.visible = true;
				ok.visible = true;
			}
			if ( skipTimer > 2.5 ) {
				skipTimer = -5000;
				space.visible = false;
				ok.visible = false;
			}
			
			if ( Registry.playSFX && fall.volume == 0 ) {
				fall.volume = 0.5;
			} else if ( !Registry.playSFX && fall.active ) {
				fall.volume = 0;
			}
			
			if ( actor.y >= 2519 ) {
				if ( fall ) {
					fall.exists = false;
				}
				FlxG.shake( 0.05, 0.5 );
				if ( Registry.playSFX ) {
					FlxG.play( AssetsRegistry.bulletHitWall_MP3, 1, false, false );
				}
				actor.y = 2518;
				actor.velocity.y = 0;
				actor.maxVelocity.y = 0;
				actor.play( "sleep" );
			}
			if ( timer >= 8 && !awake ) {
				awake = true;
				PostShake();
			}
			if ( timer >= 11 ) {
				timer = int.MIN_VALUE;
				FadeIn();
			}
		}
		private function PostShake():void {
			actor.play( "awake" );
		}
		private function FadeIn():void {
			FlxG.fade( 0xff000000, 0.5, Start );
		}
		private function Start():void {
			FlxG.music.stop();
			FlxG.switchState( new TutorialState );
		}
	}
}