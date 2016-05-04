package  
{
	/**
	 * ...
	 * @author Mantis
	 */
	public class Registry
	{
		import com.newgrounds.API;
		import org.flixel.FlxSave;
		import org.flixel.FlxSound;
		
		public static var player:Player;
		public static var lava:Lava;
		public static var medals:Medals;
		public static var colors:ColorSelection;
		public static var gameOver:GameOverGroup;
		public static var options:Options;
		public static var lines:Lines;
		public static var light:Light;
		public static var darkness:Darkness;
		public static var _black:_Black;
		public static var spike:Spike;
		public static var playState:PlayState;
		public static var bg_Man:BgManager;
		public static var block_Man:BlockManager;
		public static var arrow_Man:ArrowManager;
		public static var wall_Man:WallManager;
		public static var loop_Man:LoopManager;
		public static var mover_Man:MoverManager;
		public static var sentuary_Man:SentuaryManager;
		public static var bullet_Man:BulletManager;
		public static var spike_Man:LoopSpikeManager;
		public static var splat_Man:SplatterManager;
		public static var fx:SpecialFX;
		public static var notifier:MedalsNotifier;
		public static var tutorial1:Tutorial1;
		public static var tutorial_InGame:TutorialSpace;
		
		//Options
		public static var playSFX:Boolean = true;
		public static var playMusic:Boolean = true;
		
		public static var save:FlxSave;
		public static var loaded:Boolean = false;
		public static var saveExists:Boolean = false;
		public static var currentTrack:int = 1;
		public static var colorValue:int = 1;
		
		//Records
		public static var birds:Array = ["blue", "red", "green"];
		public static var unlockWhite:Boolean = false;
		public static var unlockBlack:Boolean = false;
		public static var unlockGold:Boolean = false;
		public static var unlockSick:Boolean = false;
		public static var unlockGen:Boolean = false;
		public static var unlockDeath:Boolean = false;
		public static var unlockRainbow:Boolean = false;
		
		public static var unlockedMedals:int = 0;
		public static var timesPlayed:int = 1;
		public static var record:int;
		public static var jumps:int;
		
		//Tutorial
		public static var firstTimeEVAR:Boolean = true;
		public static var firstTime:Boolean = true;
		public static var knowsWallJump:Boolean = false;
		
		//Achievments:
		public static var achiev_ALL:Boolean = false;
		
		public static var hitByBullet:Boolean = false;
		public static var evade_Block100:int = 0;
		public static var evade_Bullet20:int = 0;
		public static var evade_Loop20:int = 0;
		public static var evade_Crusher20:int = 0;
		public static var evade_quake10:int = 0;
		
		public static var medal_Block:Boolean = false;
		public static var medal_Bullet:Boolean = false;
		public static var medal_quake:Boolean = false;
		public static var medal_Spike:Boolean = false;
		public static var medal_Mover:Boolean = false;
		
		public static var death100:Boolean = false;
		
		public static var jumps2000:Boolean = false;
		public static var jumps1000:Boolean = false;
		public static var jumps500:Boolean = false;
		public static var jumps100:Boolean = false;
		
		public static var reached500:Boolean = false;
		public static var reached300:Boolean = false;
		public static var reached100:Boolean = false;
		public static var reached50:Boolean = false;
		
		public static function get SaveRecord():int {
			if ( loaded ) {
				return save.data.record;
			} else {
				return record;
			}
		}
		public static function set SaveRecord(value:int):void {
			if ( loaded ) {
				save.data.record = value;
			} else {
				record = value;
			}
		}
		public static function get SaveDeaths():int {
			if ( loaded ) {
				return save.data.death;
			} else {
				return timesPlayed;
			}
		}
		public static function set SaveDeaths(value:int):void {
			if ( loaded ) {
				save.data.death = value;
			} else {
				timesPlayed = value;
			}
		}
		public static function SaveMedals():void {
			if ( loaded ) {
				save.data.medals = unlockedMedals;
			}
		}
		public static function SaveJumps():void {
			if ( loaded ) {
				save.data.jumps = jumps;
			}
			API.postScore( "Jumps", Registry.jumps );
		}
		public static function SaveQuake():void {
			if ( loaded ) {
				save.data.evade_quake += 1;
				evade_quake10 = save.data.evade_quake;
			}
		}
		public static function SaveBlock():void {
			if ( loaded ) {
				save.data.evade_Block += 1;
				evade_Block100 = save.data.evade_Block;
			}
		}
		public static function SaveLoop():void {
			if ( loaded ) {
				save.data.evade_Loop += 1;
				evade_Loop20 = save.data.evade_Loop;
			}
		}
		public static function SaveBullet():void {
			if ( loaded ) {
				save.data.evade_Bullet += 1;
				evade_Bullet20 = save.data.evade_Bullet;
			}
		}
		public static function SaveCrusher():void {
			if ( loaded ) {
				save.data.evade_Crusher += 1;
				evade_Crusher20 = save.data.evade_Crusher;
			}
		}
		public static function SaveBirds():void {
			if ( loaded ) {
				save.data.birds = birds;
			}
		}
		public static function LoadData():void {
			save = new FlxSave();
			loaded = save.bind("Abyss");
			if ( loaded && save.data.record == null ) {
				save.data.record = 0;
				save.data.death = 1;
				save.data.jumps = 0;
				save.data.medals = 0;
				save.data.birds = ["blue", "red", "green"];
				save.data.evade_quake = 0;
				save.data.evade_Block = 0;
				save.data.evade_Loop = 0;
				save.data.evade_Bullet = 0;
				save.data.evade_Crusher = 0;
			} else {
				saveExists = true;
			}
			record = save.data.record;
			timesPlayed = save.data.death;
			jumps = save.data.jumps;
			evade_quake10 = save.data.evade_quake;
			evade_Block100 = save.data.evade_Block;
			evade_Loop20 = save.data.evade_Loop;
			evade_Bullet20 = save.data.evade_Bullet;
			evade_Crusher20 = save.data.evade_Crusher;
			birds = save.data.birds;
			unlockedMedals = save.data.medals;
			
			if ( birds.indexOf( "white" ) > -1 ) {
				unlockWhite = true;
			} if ( birds.indexOf( "black" ) > -1 ) {
				unlockBlack = true;
			} if ( birds.indexOf( "sick" ) > -1 ) {
				unlockSick = true;
			} if ( birds.indexOf( "gen" ) > -1 ) {
				unlockGen = true;
			} if ( birds.indexOf( "gold" ) > -1 ) {
				unlockGold = true;
			} if ( birds.indexOf( "rainbow" ) > -1 ) {
				unlockRainbow = true;
				API.unlockMedal("Achievement Unlocked");
			} if ( birds.indexOf( "dead" ) > -1 ) {
				unlockDeath = true;
			}
			
			if ( timesPlayed >= 100 ) {
				API.unlockMedal("Sacrificer");
				death100 = true;
				unlockedMedals += 1;
			}
			
			if ( evade_Block100 >= 100 && medal_Block == false ) {
				API.unlockMedal("Hazard Zone");
				medal_Block = true;
				unlockedMedals += 1;
			} if ( evade_Loop20 >= 35 && medal_Spike == false ) {
				API.unlockMedal("Death Loop");
				medal_Spike = true;
				unlockedMedals += 1;
			} if ( evade_Bullet20 >= 20 && medal_Bullet == false ) {
				API.unlockMedal("Dodge");
				medal_Bullet = true;
				unlockedMedals += 1;
			} if ( evade_Crusher20 >= 20 && medal_Mover == false ) {
				API.unlockMedal("Nearly Smashed");
				medal_Mover = true;
				unlockedMedals += 1;
			} if ( evade_quake10 >= 10 && medal_quake == false ) {
				API.unlockMedal("Rock Bird");
				medal_quake = true;
				unlockedMedals += 1;
			}
			
			if ( jumps >= 100 && jumps100 == false ) {
				API.unlockMedal("Jumper");
				jumps100 = true;
				unlockedMedals += 1;
			} if ( jumps >= 500 && jumps500 == false ) {
				API.unlockMedal("Natural Bird");
				jumps500 = true;
				unlockedMedals += 1;
			} if ( jumps >= 1000 && jumps1000 == false ) {
				API.unlockMedal("Flight to The Top");
				jumps1000 = true;
				unlockedMedals += 1;
			} if ( jumps >= 2000 && jumps2000 == false ) {
				API.unlockMedal("Ascension");
				jumps2000 = true;
				unlockedMedals += 1;
			}
			
			if ( Registry.record >= 50 && Registry.reached50 == false ) {
				API.unlockMedal("First 'Steps'");
				Registry.reached50 = true;
				unlockedMedals += 1;
			} if ( Registry.record >= 100 && Registry.reached100 == false ) {
				API.unlockMedal("Early Climber");
				Registry.reached100 = true;
				unlockedMedals += 1;
			} if ( Registry.record >= 300 && Registry.reached300 == false ) {
				API.unlockMedal("Getting There...");
				Registry.reached300 = true;
				unlockedMedals += 1;
			} if ( Registry.record >= 500 && Registry.reached500 == false ) {
				API.unlockMedal("Arise");
				Registry.reached500 = true;
				unlockedMedals += 1;
			}
		}
		public static function GetRandom(a:Array):String {
			var index:int = Math.floor( Math.random() * a.length );
			return a[index];
		}
	}
}