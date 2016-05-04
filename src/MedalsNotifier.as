package  
{
	import com.newgrounds.API;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;
	import org.flixel.FlxG;
	import org.flixel.FlxTimer;
	/**
	 * ...
	 * @author Mantis
	 */
	public class MedalsNotifier extends FlxGroup {
		[Embed(source = "/../assets/img/other/Rainbow.png")] private var rainbow_PNG:Class;
		private var notification:FlxSprite;
		private var noteText:FlxText;
		private var birdText:FlxText;
		private var rainbowText:FlxSprite;
		private var removeTimer:FlxTimer = new FlxTimer();
		public function MedalsNotifier() {
			notification = new FlxSprite( 10, 19 );
			notification.scrollFactor.y = 0; notification.exists = false;
			
			noteText = new FlxText( 37, 18, 150, null, true );
			noteText.scrollFactor.y = 0; noteText.exists = false;
			birdText = new FlxText( 37, 29, 150, null, true );
			birdText.scrollFactor.y = 0; birdText.exists = false;
			
			add( notification );
			add( noteText );
			add( birdText );
		}
		public function HandleTimer(t:FlxTimer):void {
			notification.exists = false;
			noteText.exists = false;
			birdText.exists = false;
			if ( rainbowText ) {
				rainbowText.exists = false;
			}
		}
		public function Death100():void {
			Registry.unlockedMedals += 1;
			CheckMedals();
			API.unlockMedal("Sacrificer");
			if ( Registry.playSFX ) {
				FlxG.play( AssetsRegistry.unlock1_MP3, 0.4, false, true );
			}
			notification.loadGraphic( AssetsRegistry.medalDeath100_PNG, false, false, 26, 24, false );
			notification.exists = true;
			noteText.text = "Play for a century";
			noteText.exists = true;
			birdText.text = "Unlocked Dead Bird";
			birdText.color = 0xFF0000; birdText.exists = true;
			removeTimer.start( 6, 1, HandleTimer );
		}
		public function Reach50():void {
			Registry.unlockedMedals += 1;
			CheckMedals();
			API.unlockMedal("First 'Steps'");
			if ( Registry.playSFX ) {
				FlxG.play( AssetsRegistry.unlock1_MP3, 0.4, false, true );
			}
			notification.loadGraphic( AssetsRegistry.medal50_PNG, false, false, 26, 24, false );
			notification.exists = true;
			noteText.text = "Reach 50m";
			noteText.exists = true;
			removeTimer.start( 6, 1, HandleTimer );
		}
		public function Reach100():void {
			Registry.unlockedMedals += 1;
			CheckMedals();
			API.unlockMedal("Early Climber");
			if ( Registry.playSFX ) {
				FlxG.play( AssetsRegistry.unlock1_MP3, 0.4, false, true );
			}
			notification.loadGraphic( AssetsRegistry.medal100_PNG, false, false, 26, 24, false );
			notification.exists = true;
			noteText.text = "Reach 100m";
			noteText.exists = true;
			removeTimer.start( 6, 1, HandleTimer );
		}
		public function Reach300():void {
			Registry.unlockedMedals += 1;
			CheckMedals();
			API.unlockMedal("Getting There...");
			if ( Registry.playSFX ) {
				FlxG.play( AssetsRegistry.unlock1_MP3, 0.4, false, true );
			}
			notification.loadGraphic( AssetsRegistry.medal300_PNG, false, false, 26, 24, false );
			notification.exists = true;
			noteText.text = "Reach 300m";
			noteText.exists = true;
			removeTimer.start( 6, 1, HandleTimer );
		}
		public function Reach500():void {
			Registry.unlockedMedals += 1;
			CheckMedals();
			API.unlockMedal("Arise");
			if ( Registry.playSFX ) {
				FlxG.play( AssetsRegistry.unlock1_MP3, 0.4, false, true );
			}
			notification.loadGraphic( AssetsRegistry.medal500_PNG, false, false, 26, 24, false );
			notification.exists = true;
			noteText.text = "Reach 500m";
			noteText.exists = true;
			removeTimer.start( 6, 1, HandleTimer );
		}
		public function Jump100():void {
			Registry.unlockedMedals += 1;
			CheckMedals();
			API.unlockMedal("Jumper");
			if ( Registry.playSFX ) {
				FlxG.play( AssetsRegistry.unlock1_MP3, 0.4, false, true );
			}
			notification.loadGraphic( AssetsRegistry.jump100_PNG, false, false, 26, 24, false );
			notification.exists = true;
			noteText.text = "Jump 100 times";
			noteText.exists = true;
			removeTimer.start( 6, 1, HandleTimer );
		}
		public function Jump500():void {
			Registry.unlockedMedals += 1;
			CheckMedals();
			API.unlockMedal("Natural Bird");
			if ( Registry.playSFX ) {
				FlxG.play( AssetsRegistry.unlock1_MP3, 0.4, false, true );
			}
			notification.loadGraphic( AssetsRegistry.jump500_PNG, false, false, 26, 24, false );
			notification.exists = true;
			noteText.text = "Jump 500 times";
			noteText.exists = true;
			removeTimer.start( 6, 1, HandleTimer );
		}
		public function Jump1000():void {
			Registry.unlockedMedals += 1;
			CheckMedals();
			API.unlockMedal("Flight to The Top");
			if ( Registry.playSFX ) {
				FlxG.play( AssetsRegistry.unlock1_MP3, 0.4, false, true );
			}
			notification.loadGraphic( AssetsRegistry.jump1000_PNG, false, false, 26, 24, false );
			notification.exists = true;
			noteText.text = "Jump 1000 times";
			noteText.exists = true;
			removeTimer.start( 6, 1, HandleTimer );
		}
		public function Jump2000():void {
			Registry.unlockedMedals += 1;
			CheckMedals();
			API.unlockMedal("Ascension");
			if ( Registry.playSFX ) {
				FlxG.play( AssetsRegistry.unlock1_MP3, 0.4, false, true );
			}
			notification.loadGraphic( AssetsRegistry.jump2000_PNG, false, false, 26, 24, false );
			notification.exists = true;
			noteText.text = "Jump 2000 times";
			noteText.exists = true;
			removeTimer.start( 6, 1, HandleTimer );
		}
		public function DeathQuake():void {
			Registry.unlockedMedals += 1;
			CheckMedals();
			API.unlockMedal("Rock Bird");
			if ( Registry.playSFX ) {
				FlxG.play( AssetsRegistry.unlock1_MP3, 0.4, false, true );
			}
			notification.loadGraphic( AssetsRegistry.deathQuake_PNG, false, false, 26, 24, false );
			notification.exists = true;
			noteText.text = "Evade 10 Quakes";
			noteText.exists = true;
			removeTimer.start( 6, 1, HandleTimer );
		}
		public function DeathBlock():void {
			Registry.unlockedMedals += 1;
			CheckMedals();
			API.unlockMedal("Hazard Zone");
			if ( Registry.playSFX ) {
				FlxG.play( AssetsRegistry.unlock1_MP3, 0.4, false, true );
			}
			notification.loadGraphic( AssetsRegistry.deathBlock_PNG, false, false, 26, 24, false );
			notification.exists = true;
			noteText.text = "Evade 100 Spike Blocks";
			noteText.exists = true;
			removeTimer.start( 6, 1, HandleTimer );
		}
		public function DeathLoop():void {
			Registry.unlockedMedals += 1;
			CheckMedals();
			API.unlockMedal("Death Loop");
			if ( Registry.playSFX ) {
				FlxG.play( AssetsRegistry.unlock1_MP3, 0.4, false, true );
			}
			notification.loadGraphic( AssetsRegistry.deathLoop_PNG, false, false, 26, 24, false );
			notification.exists = true;
			noteText.text = "Evade 20 Death Loops";
			noteText.exists = true;
			removeTimer.start( 6, 1, HandleTimer );
		}
		public function DeathBullet():void {
			Registry.unlockedMedals += 1;
			CheckMedals();
			API.unlockMedal("Dodge");
			if ( Registry.playSFX ) {
				FlxG.play( AssetsRegistry.unlock1_MP3, 0.4, false, true );
			}
			notification.loadGraphic( AssetsRegistry.deathBullet_PNG, false, false, 26, 24, false );
			notification.exists = true;
			noteText.text = "Evade 20 Flame Bullets";
			noteText.exists = true;
			removeTimer.start( 6, 1, HandleTimer );
		}
		public function DeathCrusher():void {
			Registry.unlockedMedals += 1;
			CheckMedals();
			API.unlockMedal("Nearly Smashed");
			if ( Registry.playSFX ) {
				FlxG.play( AssetsRegistry.unlock1_MP3, 0.4, false, true );
			}
			notification.loadGraphic( AssetsRegistry.deathCrusher_PNG, false, false, 26, 24, false );
			notification.exists = true;
			noteText.text = "Evade 20 Crushers";
			noteText.exists = true;
			removeTimer.start( 6, 1, HandleTimer );
		}
		public function GetAll():void {
			Registry.unlockedMedals += 1;
			API.unlockMedal("Achievement Unlocked");
			if ( Registry.playSFX ) {
				FlxG.play( AssetsRegistry.unlock1_MP3, 0.4, false, true );
			}
			notification.loadGraphic( AssetsRegistry.achievALL_PNG, false, false, 26, 24, false );
			notification.exists = true;
			noteText.text = "Unlock all medals";
			noteText.exists = true;
			birdText.text = "Unlocked Rainbow Bird";
			birdText.color = 0xcc0000; birdText.exists = true;
			rainbowText = new FlxSprite( 86, 32, rainbow_PNG );
			rainbowText.scrollFactor.y = 0;
			add( rainbowText );
			removeTimer.start( 6, 1, HandleTimer );
		}
		public function CheckMedals():void {
			if ( Registry.unlockedMedals == 1 && !Registry.unlockWhite ) {
				Registry.unlockWhite = true;
				Registry.birds.push("white");
				Registry.SaveBirds();
				birdText.text = "Unlocked White Bird";
				birdText.color = 0xFFffFF; birdText.exists = true;
				removeTimer.start( 6, 1, HandleTimer );
			}
			if ( Registry.unlockedMedals == 3 && !Registry.unlockBlack ) {
				Registry.unlockBlack = true;
				Registry.birds.push("black");
				Registry.SaveBirds();
				birdText.text = "Unlocked Black Bird";
				birdText.color = 0x444444; birdText.exists = true;
				removeTimer.start( 6, 1, HandleTimer );
			}
			if ( Registry.unlockedMedals == 6 && !Registry.unlockSick ) {
				Registry.unlockSick = true;
				Registry.birds.push("sick");
				Registry.SaveBirds();
				birdText.text = "Unlocked Sick Bird";
				birdText.color = 0x00aa00; birdText.exists = true;
				removeTimer.start( 6, 1, HandleTimer );
			}
			if ( Registry.unlockedMedals == 9 && !Registry.unlockGen ) {
				Registry.unlockGen = true;
				Registry.birds.push("gen");
				Registry.SaveBirds();
				birdText.text = "Unlocked Gen Bird";
				birdText.color = 0x0000C4; birdText.exists = true;
				removeTimer.start( 6, 1, HandleTimer );
			}
			if ( Registry.unlockedMedals == 12 && !Registry.unlockGold ) {
				Registry.unlockGold = true;
				Registry.birds.push("gold");
				Registry.SaveBirds();
				birdText.text = "Unlocked Golden Bird";
				birdText.color = 0xffff00; birdText.exists = true;
				removeTimer.start( 6, 1, HandleTimer );
			}
		}
	}
}