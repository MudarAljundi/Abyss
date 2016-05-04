package  
{
	import com.newgrounds.API;
	import com.newgrounds.components.ScoreBrowser;
	import com.newgrounds.ScoreBoard;
	import org.flixel.FlxG;
	import org.flixel.FlxButton;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;
	/**
	 * ...
	 * @author Mantis
	 */
	public class GameOverGroup extends FlxGroup
	{
		[Embed(source = "../assets/img/other/Home.png")] private var home_PNG:Class;
		[Embed(source = "/../assets/img/other/TryLeft.png")] private var tryLeft_PNG:Class;
		[Embed(source = "/../assets/img/other/TryRight.png")] private var tryRight_PNG:Class;
		public var menuState:int = 0;
		
		public var genclops:FlxButton;
		public var mantis:FlxButton;
		
		public var home:FlxButton;
		public var noHome:FlxButton;
		public var yesHome:FlxButton;
		public var clearHome:FlxText;
		
		public var changeSong:FlxButton;
		public var medals:FlxButton;
		public var score:FlxButton;
		public var back:FlxButton;
		public var noButton:FlxButton;
		public var yesButton:FlxButton;
		
		public var recordText:FlxText;
		public var recordNumber:FlxText;
		public var jumpsText:FlxText;
		public var clearText:FlxText;
		public var rText:FlxText;
		public var rTextRed:FlxText;
		
		public var firstTry1:FlxSprite;
		public var firstTry2:FlxSprite;
		
		private var scoreBrowser:ScoreBrowser;
		private var scoreSwitcher:FlxButton;
		
		public function GameOverGroup() {
			super();
			Registry.colors = new ColorSelection();
			
			scoreBrowser = new ScoreBrowser();
			scoreBrowser.visible = false;
			scoreBrowser.scoreBoardName = "Records";
			scoreBrowser.period = ScoreBoard.ALL_TIME;
			scoreBrowser.loadScores();
			scoreBrowser.titleText.text = "High Scores";
			scoreBrowser.x = 4.599999999999994;; scoreBrowser.y = 5;
			scoreSwitcher = new FlxButton( 112, 300, "Height", HandleScoreSwitcher );
			scoreSwitcher.loadGraphic( AssetsRegistry.changeSong_PNG, false, false, 46, 20, false );
			scoreSwitcher.scrollFactor.y = 0;
			
			clearText = new FlxText( 33, 80, 130, "Clear ALL records?", true );
			clearText.visible = false; clearText.scrollFactor.y = 0;
			
			recordText = new FlxText( 47, 43, 100, "Your record:" );
			recordText.scrollFactor.y = 0; recordText.color = 0xff0000;
			recordNumber = new FlxText( 16, 52, 128, null );
			recordNumber.text = Registry.record + "m";
			recordNumber.scrollFactor.y = 0; recordNumber.setFormat( null, 24, 0xffFFff, "center" );
			
			rText = new FlxText( 16, 114, 128, "Press 'SPACE' to retry!" );
			rText.scrollFactor.y = 0; rText.setFormat( null, 8, 0xffFFff, "center" );
			rTextRed = new FlxText( 56, 114, 40, "'SPACE'" );
			rTextRed.scrollFactor.y = 0; rTextRed.setFormat( null, 8, 0xff0000 );
			jumpsText = new FlxText( 16, 79, 128, null );
			jumpsText.text = "Jumps: " + Registry.jumps;
			jumpsText.scrollFactor.y = 0; jumpsText.setFormat( null, 8, 0xffFFff, "center" );
			
			if ( Registry.firstTime ) {
				firstTry1 = new FlxSprite( 16, 113 );
				firstTry1.loadGraphic( tryLeft_PNG, true, false, 11, 13, false );
				firstTry1.addAnimation( "norm", [0, 1, 2, 3, 3, 3, 0], 15, true );
				firstTry1.scrollFactor.y = 0; firstTry1.play( "norm" );
				
				firstTry2 = new FlxSprite( 138, 113 );
				firstTry2.loadGraphic( tryRight_PNG, true, false, 11, 13, false );
				firstTry2.addAnimation( "norm", [0, 1, 2, 3, 3, 3, 0], 15, true );
				firstTry2.scrollFactor.y = 0; firstTry2.play( "norm" );
			}
			
			changeSong = new FlxButton( 83, 200, "Song: 1", SwitchSong );
			changeSong.loadGraphic( AssetsRegistry.changeSong_PNG, false, false, 46, 20, false );
			changeSong.scrollFactor.y = 0;
			if ( Registry.currentTrack == 3 || !Registry.playMusic || FlxG.volume == 0 ) {
				changeSong.label.text = "Song: 0";
			} else {
				if ( Registry.currentTrack == 2) {
					changeSong.label.text = "Song: 2";
				}
			}
			medals = new FlxButton( 57, 200, null, SwitchToMedals );
			medals.loadGraphic( AssetsRegistry.medalsButton_PNG, false, false, 21, 20, false );
			medals.scrollFactor.y = 0;
			score = new FlxButton( 31, 200, null, SwitchToScores );
			score.loadGraphic( AssetsRegistry.highscores_PNG, false, false, 21, 20, false );
			score.scrollFactor.y = 0;
			back = new FlxButton( 40, 200, "Back...", SwitchToGameOver );
			back.scrollFactor.y = 0;
			noButton = new FlxButton( 40, 140, "No, Go back", SwitchToGameOver );
			noButton.visible = false; noButton.scrollFactor.y = 0;
			yesButton = new FlxButton( 40, 100, "Yes, Delete", EraseRecords );
			yesButton.visible = false; yesButton.scrollFactor.y = 0;
			
			home = new FlxButton( 146, 18, null, HomeRun );
			home.loadGraphic( home_PNG, false, false, 12, 12, false );
			home.scrollFactor.y = 0;
			clearHome = new FlxText( 16, 80, 128, "Exit to Menu?", true );
			clearHome.visible = false; clearHome.scrollFactor.y = 0; clearHome.alignment = "center";
			noHome = new FlxButton( 40, 500, "No, Go back", SwitchToGameOver );
			noHome.visible = false; noHome.scrollFactor.y = 0;
			yesHome = new FlxButton( 40, 500, "Yes, Exit", GoToMenu );
			yesHome.visible = false; yesHome.scrollFactor.y = 0;
			
			mantis = new FlxButton( 6, 226, null, MantisSite );
			mantis.loadGraphic( AssetsRegistry.iconMantis_PNG, false, false, 50, 12, false );
			mantis.scrollFactor.y = 0;
			
			genclops = new FlxButton( 97, 226, null, GenclopsSite );
			genclops.loadGraphic( AssetsRegistry.iconGenclops_PNG, false, false, 57, 12, false );
			genclops.scrollFactor.y = 0;
			
			add( clearText );
			add( rText ); add( rTextRed );
			add( Registry.colors );
			add( recordText ); add( recordNumber ); add( jumpsText );
			add( changeSong );
			add( back ); add( score ); add( medals );
			add( noButton );
			add( yesButton );
			add( genclops );
			add( mantis );
			add( home ); add( yesHome ); add( noHome ); add( clearHome );
			if ( Registry.firstTime ) {
				add( firstTry1 ); add( firstTry2 );
			}
			add(scoreSwitcher); FlxG.stage.addChild( scoreBrowser );
			
			if ( Registry.unlockRainbow && Registry.birds.length >= 11 ) {
				Registry.birds.pop();
				Registry.birds.pop();
			}
		}
		private function HandleScoreSwitcher():void {
			if ( scoreSwitcher.label.text == "Height" ) {
				scoreSwitcher.label.text = "Jumps";
				scoreBrowser.titleText.text = "Jumps"
				scoreBrowser.scoreBoardName = "Jumps";
				scoreBrowser.loadScores();
			} else {
				scoreSwitcher.label.text = "Height";
				scoreBrowser.titleText.text = "High Scores"
				scoreBrowser.scoreBoardName = "Records";
				scoreBrowser.loadScores();
			}
		}
		public function SwitchSong():void {
			FlxG.music.stop();
			switch ( Registry.currentTrack ) {
					case 1:
				if ( !Registry.playSFX && Registry.options.show ) {
					Registry.options.showOptions();
				}
				Registry.currentTrack = 2;
				FlxG.volume = 1;
				FlxG.playMusic( Theme2, 1 );
				Registry.options.muteMusic.loadGraphic( AssetsRegistry.soundMusic1_PNG, false, false, 29, 9, false );
				Registry.playMusic = true;
				changeSong.label.text = "Song: 2";
				break;
				
					case 2:
				if ( !Registry.playSFX && Registry.options.show ) {
					Registry.options.showOptions();
				}
				Registry.currentTrack = 3;
				FlxG.playMusic( Theme2, 0 );
				Registry.options.muteMusic.loadGraphic( AssetsRegistry.soundMusic2_PNG, false, false, 29, 9, false );
				Registry.playMusic = false;
				FlxG.music.pause();
				changeSong.label.text = "Song: 0";
				break;
				
					case 3:
				if ( !Registry.playSFX && Registry.options.show ) {
					Registry.options.showOptions();
				}
				Registry.currentTrack = 1;
				FlxG.volume = 1;
				FlxG.playMusic( Theme1, 1 );
				Registry.options.muteMusic.loadGraphic( AssetsRegistry.soundMusic1_PNG, false, false, 29, 9, false );
				changeSong.label.text = "Song: 1";
				Registry.playMusic = true;
				break;
			}
		}
		public function SwitchToGameOver():void {
			clearText.visible = false;
			noButton.visible = false;
			yesButton.visible = false;
			if ( !menuState == 0 ) {
				ShowGameOver();
			}
		}
		public function SwitchToMedals():void {
			if ( menuState == 0 ) {
				ShowMedals();
			}
		}
		public function SwitchToScores():void {
			if ( menuState == 0 ) {
				ShowScores();
			}
		}
		
		public function ShowGameOver():void {
			menuState = 0;
			Registry.colors.visible = true;
			Registry.medals.visible = false;
			scoreBrowser.visible = false;
			
			changeSong.visible = true;
			genclops.visible = true;
			mantis.visible = true;
			rText.visible = true; rTextRed.visible = true;
			recordText.visible = true; recordNumber.visible = true; jumpsText.visible = true;
			
			yesHome.visible = false; yesHome.y = 500;
			noHome.visible = false; noHome.y = 500;
			clearHome.visible = false;
			
			score.y = 200; scoreSwitcher.y = 300;
			medals.y = 200;
			back.y = 300;
			if ( firstTry1 ) {
				firstTry1.visible = true; firstTry2.visible = true;
			}
		}
		public function ShowMedals():void {
			menuState = 1;
			Registry.options.show = true; Registry.options.fullscreen.visible = false;
			Registry.options.muteMusic.visible = false; Registry.options.muteSFX.visible = false;
			Registry.colors.visible = false;
			changeSong.visible = false;
			Registry.medals.visible = true;
			scoreBrowser.visible = false;
			rText.visible = false; rTextRed.visible = false;
			recordText.visible = false; recordNumber.visible = false; jumpsText.visible = false;
			
			medals.y = 300;
			score.y = 300; scoreSwitcher.y = 300;
			back.y = 200;
			if ( firstTry1 ) {
				firstTry1.visible = false; firstTry2.visible = false;
			}
		}
		public function ShowScores():void {
			menuState = 2;
			Registry.colors.visible = false;
			changeSong.visible = false;
			Registry.medals.visible = false;
			scoreBrowser.visible = true;
			rText.visible = false; rTextRed.visible = false;
			recordText.visible = false; recordNumber.visible = false; jumpsText.visible = false;
			
			score.y = 300; scoreSwitcher.y = 175;
			medals.y = 300;
			back.y = 200;
			if ( firstTry1 ) {
				firstTry1.visible = false; firstTry2.visible = false;
			}
		}
		
		public function ClearSave():void {
			menuState = 3;
			Registry.colors.visible = false;
			Registry.medals.visible = false;
			clearText.visible = true;
			noButton.visible = true;
			yesButton.visible = true;
			rText.visible = false; rTextRed.visible = false;
			recordText.visible = false; recordNumber.visible = false; jumpsText.visible = false;
			
			medals.y = 300;
			back.y = 200;
		}
		//private function UnlockEVERYTHING():void {
		//	Registry.jumps = 2001;
		//	Registry.SaveDeaths = 101; Registry.timesPlayed = 101;
		//	Registry.record = 505; Registry.SaveRecord = 505;
		//	
		//	Registry.evade_Block100 = 101; Registry.save.data.evade_Block = 101;
		//	Registry.evade_Bullet20 = 21; Registry.save.data.evade_Bullet = 21;
		//	Registry.evade_Crusher20 = 21; Registry.save.data.evade_Crusher = 21;
		//	Registry.evade_Loop20 = 40; Registry.save.data.evade_Loop = 40;
		//	Registry.evade_quake10 = 11; Registry.save.data.evade_quake = 11;
		//	
		//	Registry.reached50 = true; Registry.reached100 = true; Registry.reached300 = true; Registry.reached500 = true;
		//	Registry.unlockGold = true; Registry.unlockRainbow = true; Registry.unlockDeath = true;
		//	Registry.unlockGen = true; Registry.unlockSick = true;
		//	Registry.birds = ["blue", "red", "green", "white" , "black", "sick", "gen", "gold", "rainbow", "dead"];
		//	Registry.save.data.birds = Registry.birds;
		//	FlxG.switchState( new TutorialState );
		//}
		public function EraseRecords():void {
			Registry.firstTime = true;
			Registry.timesPlayed = 1;
			Registry.jumps = 0;
			Registry.record = 0;
			Registry.knowsWallJump = false;
			
			Registry.jumps100 = false;
			Registry.jumps500 = false;
			Registry.jumps1000 = false;
			Registry.jumps2000 = false;
			Registry.achiev_ALL = false;
			
			Registry.medal_Block = false;
			Registry.medal_Bullet = false;
			Registry.medal_quake = false;
			Registry.medal_Mover = false;
			Registry.medal_Spike = false;
			
			Registry.evade_Block100 = 0;
			Registry.evade_Bullet20 = 0;
			Registry.evade_Crusher20 = 0;
			Registry.evade_Loop20 = 0;
			Registry.evade_quake10 = 0;
			
			Registry.death100 = false;
			Registry.reached50 = false;
			Registry.reached50 = false;
			Registry.reached50 = false;
			Registry.reached100 = false;
			Registry.reached300 = false;
			Registry.reached500 = false;
			
			Registry.birds = ["blue", "red", "green"];
			Registry.unlockedMedals = 0;
			Registry.unlockWhite = false;
			Registry.unlockBlack = false;
			Registry.unlockGold = false;
			Registry.unlockSick = false;
			Registry.unlockGen = false;
			Registry.unlockDeath = false;
			Registry.unlockRainbow = false;
			
			Registry.save.erase();
			Registry.LoadData();
			FlxG.switchState( new TutorialState );
		}
		private function HomeRun():void {
			menuState = 3;
			Registry.colors.visible = false;
			Registry.medals.visible = false;
			scoreBrowser.visible = false;
			
			changeSong.visible = false;
			genclops.visible = true;
			mantis.visible = true;
			rText.visible = false; rTextRed.visible = false;
			recordText.visible = false; recordNumber.visible = false; jumpsText.visible = false;
			
			yesHome.visible = true; yesHome.y = 100;
			noHome.visible = true; noHome.y = 140;
			clearHome.visible = true;
			
			score.y = 300; scoreSwitcher.y = 300;
			medals.y = 300;
			back.y = 300;
			if ( firstTry1 ) {
				firstTry1.visible = false; firstTry2.visible = false;
			}
		}
		private function GoToMenu():void {
			FlxG.music.fadeOut( 0.5 );
			Registry.colorValue = 1;
			FlxG.fade( 0xff000000, 0.5, PostFadeOut );
		}
		private function PostFadeOut():void {
			FlxG.music.stop();
			FlxG.switchState( new PreMenuState );
		}
		private function MantisSite():void {
			API.logCustomEvent( "visitMantis" );
			API.loadMySite();
		}
		private function GenclopsSite():void {
			API.logCustomEvent( "visitGenclops" );
			API.loadCustomLink("Genclops");
		}
	}
}