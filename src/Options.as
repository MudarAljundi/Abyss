package  
{
	import flash.display.StageScaleMode;
	import flash.display.StageDisplayState;
	import org.flixel.FlxG;
	import org.flixel.FlxButton;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Mantis
	 */
	public class Options extends FlxGroup {
		[Embed(source = "/../assets/img/other/Options1.png")] private var optionsLow_PNG:Class;
		[Embed(source = "/../assets/img/other/Options2.png")] public static var optionsHigh_PNG:Class;
		[Embed(source = "/../assets/img/other/Options2_Full.png")] private var fullscreen_PNG:Class;
		[Embed(source = "/../assets/img/other/Options2_Sound1.png")] private var sound1_PNG:Class;
		[Embed(source = "/../assets/img/other/Options2_Sound2.png")] private var sound2_PNG:Class;
		[Embed(source = "/../assets/img/other/Sound_MSFX.png")] private var sound_Text_PNG:Class;
		
		public var show:Boolean = true;
		public var _options:FlxButton;
		
		public var fullscreen:FlxButton;
		public var muteMusic:FlxButton;
		public var muteSFX:FlxButton;
		public function Options(Low:Boolean) {
			_options = new FlxButton( 146, 3, null, showOptions );
			_options.loadGraphic( optionsHigh_PNG, false, false, 12, 12, false );
			if ( Low ) {
				_options.loadGraphic( optionsLow_PNG, false, false, 12, 12, false );
			}
			_options.scrollFactor.y = 0;
			
			muteMusic = new FlxButton( 113, 16, null, MuteMusic );
			muteMusic.loadGraphic( AssetsRegistry.soundMusic1_PNG, false, false, 29, 9, false );
			muteMusic.scrollFactor.y = 0; muteMusic.visible = false;
			if ( !Registry.playMusic || FlxG.volume == 0 ) {
				muteMusic.loadGraphic( AssetsRegistry.soundMusic2_PNG, false, false, 29, 9, false );
			}
			
			muteSFX = new FlxButton( 113, 29, null, MuteSFX );
			muteSFX.loadGraphic( sound1_PNG, false, false, 29, 9, false );
			muteSFX.scrollFactor.y = 0; muteSFX.visible = false;
			if ( !Registry.playSFX || FlxG.volume == 0 ) {
				muteSFX.loadGraphic( sound2_PNG, false, false, 29, 9, false );
			}
			
			fullscreen = new FlxButton( 100, 3, null, GoFullscreen );
			fullscreen.loadGraphic( fullscreen_PNG, false, false, 41, 11, false );
			fullscreen.scrollFactor.y = 0; fullscreen.visible = false;
			
			add( _options );
			add( fullscreen );
			add( muteMusic );
			add( muteSFX );
		}
		public function showOptions():void {
			if ( show ) {
				show = false;
				fullscreen.visible = true;
				muteMusic.visible = true;
				muteSFX.visible = true;
			} else {
				show = true;
				fullscreen.visible = false;
				muteMusic.visible = false;
				muteSFX.visible = false;
			}
		}
		private function MuteMusic():void {
			FlxG.volume = 1;
			if ( Registry.playMusic ) {
				muteMusic.loadGraphic( AssetsRegistry.soundMusic2_PNG, false, false, 29, 9, false );
				if ( Registry.gameOver ) {
					Registry.gameOver.changeSong.label.text = "Song: 0";
				}
				Registry.playMusic = false;
				FlxG.music.pause();
			} else {
				muteMusic.loadGraphic( AssetsRegistry.soundMusic1_PNG, false, false, 29, 9, false );
				if ( Registry.gameOver ) {
					if ( Registry.currentTrack == 1 ) {
						Registry.gameOver.changeSong.label.text = "Song: 1";
					} else if ( Registry.currentTrack == 1 ) {
						Registry.gameOver.changeSong.label.text = "Song: 2";
					}
				}
				Registry.playMusic = true;
				FlxG.music.play();
				if ( FlxG.music ) {
					FlxG.music.volume = 1;
				}
			}
		}
		private function MuteSFX():void {
			FlxG.volume = 1;
			Registry.playSFX != Registry.playSFX;
			if ( Registry.playSFX ) {
				muteSFX.loadGraphic( sound2_PNG, false, false, 29, 9, false );
				Registry.playSFX = false;
			} else {
				muteSFX.loadGraphic( sound1_PNG, false, false, 29, 9, false );
				Registry.playSFX = true;
			}
		}
		private function GoFullscreen():void {
			FlxG.stage.scaleMode = StageScaleMode.SHOW_ALL;
			FlxG.stage.align = "";
			if (FlxG.stage.displayState == StageDisplayState.NORMAL) {
				FlxG.stage.displayState=StageDisplayState.FULL_SCREEN_INTERACTIVE;
			} else {
				FlxG.stage.displayState=StageDisplayState.NORMAL;
			}
		}
	}
}