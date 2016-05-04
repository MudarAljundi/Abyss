package  
{
	import com.newgrounds.components.ScoreBrowser;
	import com.newgrounds.ScoreBoard;
	import flash.display.StageDisplayState;
	import flash.display.StageScaleMode;
	import com.newgrounds.API;
	import flash.events.Event;
	import org.flixel.FlxButton;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSound;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxG;
	import org.flixel.FlxText;
	import org.flixel.FlxTileblock;
	/**
	 * ...
	 * @author Mantis
	 */
	public class MenuState extends FlxState
	{
		[Embed(source = "/../assets/img/other/Credits_Frootza.png")] private var frootza_PNG:Class;
		[Embed(source = "../assets/img/other/Logo.png")] private var logo_PNG:Class;
		[Embed(source = "../assets/img/other/Credits_Asandir.png")] private var credits1_PNG:Class;
		private var timer:Number = 0;
		private var musicActive:Boolean = false;
		private var playActive:Boolean = false;
		
		private var _bottom:FlxGroup;
		
		private var logo:FlxSprite;
		
		private var screenLength:Number = -240;
		private var patternLength:Number = -240;
		
		private var cameraScroller:FlxSprite;
		private var darkness:FlxSprite;
		
		private var genclops:FlxButton;
		private var genclopsNG:FlxButton;
		private var mantis:FlxButton;
		private var mantisNG:FlxButton;
		
		private var back:FlxButton;
		private var startButton:FlxButton;
		private var creditsButton:FlxButton;
		private var mySite:FlxButton;
		
		private var highScores:FlxButton;
		private var medals:FlxButton;
		private var canPressC:Boolean = false;
		private var clearText:FlxText;
		private var noButton:FlxButton;
		private var yesButton:FlxButton;
		
		private var gameBy:FlxText;
		private var music:FlxText;
		private var betaTesters:FlxText;
		private var credits1:FlxButton;
		private var credits2:FlxText;
		private var credits3:FlxText;
		private var credits4:FlxText;
		private var frootza:FlxButton;
		private var credits5:FlxText;
		
		private var saveExists:FlxText;
		private var options:FlxText;
		
		private var scoreBrowser:ScoreBrowser;
		private var scoreSwitcher:FlxButton;
		
		override public function create():void {
			FlxG.flash( 0xffFFffFF, 1.5 );
			
			if ( Registry.playSFX ) {
				FlxG.play( AssetsRegistry.intro_MP3, 0.5, false, false );
			}
			
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
			
			Registry.LoadData();
			Registry.medals = new Medals();
			Registry.medals.visible = false;
			Registry.fx = new SpecialFX();
			Registry.bg_Man = new BgManager();
			Registry.wall_Man = new WallManager();
			Registry.block_Man = new BlockManager();
			Registry.options = new Options(false);
			
			Registry.fx.bigRock.start( false, 1, 0.05, 20 );
			Registry.fx.rock.start( false, 1, 0.05, 30 );
			
			_bottom = new FlxGroup();
			
			highScores = new FlxButton( 19, 197, null, HandleHighscores );
			highScores.loadGraphic( AssetsRegistry.highscores_PNG, false, false, 21, 20, false );
			highScores.scrollFactor.y = 0;
			medals = new FlxButton( 19, 170, null, HandleMedals );
			medals.loadGraphic( AssetsRegistry.medalsButton_PNG, false, false, 21, 20, false );
			medals.scrollFactor.y = 0;
			
			gameBy = new FlxText( 0, 30, 160, "- A Game By -", true );
			gameBy.alignment = "center";
			gameBy.scrollFactor.y = 0;
			gameBy.visible = false;
			
			music = new FlxText( 0, 60, 160, "- Music By -", true );
			music.alignment = "center";
			music.scrollFactor.y = 0;
			music.visible = false;
			
			betaTesters = new FlxText( 0, 90, 160, "- Special Thanks -", true );
			betaTesters.alignment = "center";
			betaTesters.scrollFactor.y = 0;
			betaTesters.visible = false;
			
			credits2 = new FlxText( 0, 102, 160, "Ammar", true );
			credits2.alignment = "center"; credits2.color = 0xb3b3b3;
			credits2.scrollFactor.y = 0;
			credits2.visible = false;
			credits1 = new FlxButton( FlxG.width / 2 - 18, 118, null, Credits1Site ); //ASANDIR
			credits1.loadGraphic( credits1_PNG, false, false, 36, 8, false );
			credits1.scrollFactor.y = 0;
			credits1.visible = false;
			credits3 = new FlxText( 0, 128, 160, "Bazo", true );
			credits3.alignment = "center"; credits3.color = 0xb3b3b3;
			credits3.scrollFactor.y = 0;
			credits3.visible = false;
			credits4 = new FlxText( 0, 141, 160, "BilalZ", true );
			credits4.alignment = "center"; credits4.color = 0xb3b3b3;
			credits4.scrollFactor.y = 0;
			credits4.visible = false;
			frootza = new FlxButton( 63, 157, null, FrootzaSite );
			frootza.loadGraphic( frootza_PNG, false, false, 36, 8, false );
			frootza.scrollFactor.y = 0; frootza.visible = false;
			credits5 = new FlxText( 0, 167, 160, "Zuhar", true );
			credits5.alignment = "center"; credits5.color = 0xb3b3b3;
			credits5.scrollFactor.y = 0;
			credits5.visible = false;
			
			darkness = new FlxSprite( 0, 0 );
			darkness.makeGraphic( 160, 240, 0x3000000, false );
			darkness.scrollFactor.y = 0;
			logo = new FlxSprite( 23, 40 );
			logo.loadGraphic( logo_PNG, false, false, 115, 34, false );
			logo.scrollFactor.y = 0;
			
			saveExists = new FlxText( 16, 2, 100, "Save Loaded!", true );
			saveExists.scrollFactor.y = 0;
			options = new FlxText( 96, 2, 100, " Options:", true );
			options.scrollFactor.y = 0;
			
			clearText = new FlxText( 33, 80, 130, "Clear ALL records?", true );
			clearText.visible = false; clearText.scrollFactor.y = 0;
			noButton = new FlxButton( 40, 300, "No, Go back", GoBack );
			noButton.scrollFactor.y = 0;
			yesButton = new FlxButton( 40, 300, "Yes, Delete", EraseRecords );
			yesButton.scrollFactor.y = 0;
			
			back = new FlxButton(FlxG.width / 2 - 40, 300, "Back...", GoBack );
			back.scrollFactor.y = 0;
			startButton = new FlxButton(FlxG.width / 2 - 40, 170, "Start Game", FadeIn );
			startButton.scrollFactor.y = 0;
			creditsButton = new FlxButton(FlxG.width / 2 - 40, 197, "Credits", GoCredits);
			creditsButton.scrollFactor.y = 0;
			
			cameraScroller = new FlxSprite(0, 0);
			cameraScroller.makeGraphic( 1, 1, 0x0, false );
			cameraScroller.velocity.y -= 175;
			
			mantisNG = new FlxButton( 6, 226, null, MantisSite );
			mantisNG.loadGraphic( AssetsRegistry.iconMantis_PNG, false, false, 50, 12, false );
			mantisNG.scrollFactor.y = 0;
			
			mantis = new FlxButton( 65, 45, null, MantisSite );
			mantis.loadGraphic( AssetsRegistry.mantis_PNG, false, false, 31, 8, false );
			mantis.scrollFactor.y = 0; mantis.visible = false;
			
			genclopsNG = new FlxButton( 97, 226, null, GenclopsSite );
			genclopsNG.loadGraphic( AssetsRegistry.iconGenclops_PNG, false, false, 57, 12, false );
			genclopsNG.scrollFactor.y = 0;
			
			genclops = new FlxButton( 60, 75, null, GenclopsSite );
			genclops.loadGraphic( AssetsRegistry.genclops_PNG, false, false, 42, 9, false );
			genclops.scrollFactor.y = 0; genclops.visible = false;
			
			_bottom.add( cameraScroller );
			_bottom.add( Registry.bg_Man );
			_bottom.add( Registry.wall_Man );
			_bottom.add( Registry.block_Man );
			_bottom.add( Registry.fx.bigRock );
			_bottom.add( Registry.fx.rock );
			add( _bottom );
			add( darkness );
			add( highScores ); add( medals );
			add( startButton ); add( creditsButton );
			add( options );
			add( genclops ); add( genclopsNG );
			add( mantis ); add( mantisNG );
			add( back );
			add( logo );
			add( gameBy ); add( betaTesters ); add( music );
			add( credits1 ); add( credits2 );
			add( credits3 ); add( credits4 );
			add( frootza ); add( credits5 );
			add( clearText );
			add( noButton ); add( yesButton );
			add( Registry.medals );
			
			add( Registry.options );
			if ( Registry.saveExists == true ) {
				add( saveExists );
			}
			GenerateWalls( 1 );
			FlxG.stage.addChild(scoreBrowser);
			add( scoreSwitcher );
		}
		override public function update():void {
			super.update();
			timer += FlxG.elapsed;
			if ( timer >= 1.1 && !musicActive ) {
				musicActive = true;
				if ( Registry.playMusic ) {
					FlxG.playMusic( TitleScreen, 1 );
				} else if ( !Registry.playMusic ) {
					FlxG.playMusic( TitleScreen, 0 );
					FlxG.music.pause();
				}
			}
			if ( timer >= 2 && playActive ) {
				timer = -10;
				Start();
			}
			if ( !Registry.options.show ) {
				options.visible = false;
			}
			FlxG.camera.scroll.y = cameraScroller.y;
			FlxG.collide( Registry.fx.bigRock, Registry.wall_Man );
			FlxG.collide( Registry.fx.rock, Registry.wall_Man );
			Registry.fx.rock.y = FlxG.camera.scroll.y - 6;
			Registry.fx.bigRock.y = FlxG.camera.scroll.y - 6;
			
			if ( FlxG.camera.scroll.y <= screenLength ) {
				screenLength -= 240;
				GenerateWalls();
			}
			if ( FlxG.camera.scroll.y <= patternLength ) {
				patternLength -= 96;
				GeneratePattern( Math.round( Math.random() * 2 ) );
			}
			if ( canPressC && FlxG.keys.justPressed("C") ) {
				ClearSave();
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
		public function ClearSave():void {
			Registry.medals.visible = false;
			clearText.visible = true; noButton.y = 140; yesButton.y = 100;
			
			startButton.y = 300; creditsButton.y = 300;
			medals.y = 300; highScores.y = 300;
			back.y = 197;
		}
		public function GeneratePattern(level:int = 0):void {
			var platform1:uint = ( Math.round( Math.random() * 7 ) +1 ) * 16;
			var platform2:uint = ( Math.round( Math.random() * 6 ) +1 ) * 16;
			
			if ( level == 0 ) { 
				Registry.block_Man.Platform1( platform1, FlxG.camera.scroll.y - 32 );
			} else if ( level == 1 ) { 
				Registry.block_Man.Platform2( platform2, FlxG.camera.scroll.y - 32 );
			}
		}
		public function GenerateWalls(level:int = 0):void {
			var b:FlxTileblock;
			
			if ( level == 1 ) {
				b = Registry.wall_Man.SpawnWall1();
				b.reset( 0, 0 );
				_bottom.add(b);
				
				b = Registry.wall_Man.SpawnWall2();
				b.reset( 144, 0 );
				_bottom.add(b);
				
				Registry.bg_Man.spawnBG( 15, 0 );
			}
			
			b = Registry.wall_Man.SpawnWall1();
			b.reset( 0, screenLength );
			_bottom.add(b);
			
			b = Registry.wall_Man.SpawnWall2();
			b.reset( 144, screenLength );
			_bottom.add(b);
			
			Registry.bg_Man.spawnBG( 15, screenLength );
		}
		private function FadeIn():void {
			if ( musicActive ) {
				FlxG.fade( 0xff000000, 1, PreStart );
				FlxG.music.fadeOut( 1 );
				timer = 0;
			}
		}
		private function PreStart():void {
			timer = 0;
			playActive = true;
		}
		private function Start():void {
			timer = 0;
			FlxG.music.stop();
			FlxG.switchState( new PreCutsceneState );
		}
		private function HandleMedals():void {
			Registry.options.show = true; Registry.options.fullscreen.visible = false;
			Registry.options.muteMusic.visible = false; Registry.options.muteSFX.visible = false;
			canPressC = true;
			
			Registry.medals.visible = true;
			logo.visible = false;
			startButton.y = 300; creditsButton.y = 300;
			highScores.y = 300; medals.y = 300;
			back.y = 197;
			
		}
		private function HandleHighscores():void {
			Registry.options.show = true; Registry.options.fullscreen.visible = false;
			Registry.options.muteMusic.visible = false; Registry.options.muteSFX.visible = false;
			logo.visible = false;
			scoreBrowser.visible = true;
			
			scoreSwitcher.y = 175;
			
			highScores.y = 300; medals.y = 300;
			startButton.y = 300;
			back.y = 197;
		}
		private function GoCredits():void {
			//bazo.reset( 70, 75 );
			mantis.visible = true;
			frootza.visible = true;
			genclops.visible = true;
			logo.visible = false;
			
			gameBy.visible = true; betaTesters.visible = true; music.visible = true;
			credits1.visible = true; credits2.visible = true;
			credits3.visible = true; credits4.visible = true;
			credits5.visible = true;
			
			startButton.y = 300; creditsButton.y = 300;
			highScores.y = 300; medals.y = 300;
			back.y = 197;
		}
		private function GoBack():void {
			//bazo.reset( 120, 231 );
			mantis.visible = false; 
			frootza.visible = false;
			genclops.visible = false;
			
			scoreBrowser.visible = false;
			
			logo.visible = true;
			gameBy.visible = false; betaTesters.visible = false; music.visible = false;
			credits1.visible = false; credits2.visible = false;
			credits3.visible = false; credits4.visible = false;
			credits5.visible = false;
			
			canPressC = false;
			clearText.visible = false; noButton.y = 300; yesButton.y = 300;
			
			scoreSwitcher.y = 300;
			Registry.medals.visible = false;
			creditsButton.y = 197; startButton.y = 170;
			highScores.y = 197; medals.y = 170;
			back.y = 300;
		}
		private function MantisSite():void {
			API.logCustomEvent( "visitMantis" );
			API.loadMySite();
		}
		private function GenclopsSite():void {
			API.logCustomEvent( "visitGenclops" );
			API.loadCustomLink("genclops");
		}
		private function Credits1Site():void {
			API.loadCustomLink("asandir");
		}
		private function FrootzaSite():void {
			API.logCustomEvent( "visitFrootza" );
			API.loadCustomLink("frootza");
		}
		private function EraseRecords():void {
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
			FlxG.music.stop();
			FlxG.switchState( new PreMenuState );
		}
	}
}