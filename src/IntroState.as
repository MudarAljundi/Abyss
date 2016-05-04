package  
{
	import org.flixel.FlxButton;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxG;
	import org.flixel.FlxText;
	/**
	 * ...
	 * @author Mantis
	 */
	public class IntroState extends FlxState
	{
		[Embed(source = "../assets/img/other/Sound1.png")] private var sound1_PNG:Class;
		[Embed(source = "../assets/img/other/Sound2.png")] private var sound2_PNG:Class;
		private var sound1:FlxSprite;
		private var sound2:FlxSprite;
		
		private var startGame:FlxText;
		private var withSound:FlxButton;
		private var muted:FlxButton;
		private var volume:FlxText;
		override public function create():void {
			FlxG.flash( 0xff000000, 0.5 );
			FlxG.playMusic( AssetsRegistry.silence_MP3, 0 );
			
			Registry.options = new Options(false);
			sound1 = new FlxSprite( 20, 106, sound1_PNG );
			sound2 = new FlxSprite( 20, 146, sound2_PNG );
			startGame = new FlxText( 49, 80, 100, "Start Game?", true );
			withSound = new FlxButton( 40, 100, "With Sound", Sound );
			muted = new FlxButton( 40, 140, "Muted", NoSound );
			volume = new FlxText( 0, 225, 110, " Change Volume: + -", true );
			
			add( sound1 );
			add( sound2 );
			add( startGame );
			add( withSound );
			add( muted );
			add( volume );
			add( Registry.options );
		}
		private function Sound():void {
			FlxG.volume = 1;
			Registry.playMusic = true;
			Registry.playSFX = true;
			FadeIn();
		}
		private function NoSound():void {
			Registry.playMusic = false;
			Registry.playSFX = false;
			FadeIn()
		}
		private function FadeIn():void {
			FlxG.fade( 0xff000000, 0.5, Start );
		}
		private function Start():void {
			FlxG.switchState( new PreMenuState );
		}
	}
}