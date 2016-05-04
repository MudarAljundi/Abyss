package
{
	import com.newgrounds.API;
	import org.flixel.FlxG;
	import org.flixel.FlxButton;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;
	/**
	 * ...
	 * @author Mantis
	 */
	public class Medals extends FlxGroup {
		public var awardText:FlxText;
		
		private var on:FlxSprite;
		private var medal50:FlxButton;
		private var medal100:FlxButton;
		private var medal300:FlxButton;
		private var medal500:FlxButton;
		
		private var jump100:FlxButton;
		private var jump500:FlxButton;
		private var jump1000:FlxButton;
		private var jump2000:FlxButton;
		private var achievALL:FlxButton;
		
		private var deathQuake:FlxButton;
		private var deathBlock:FlxButton;
		private var deathLoop:FlxButton;
		private var deathBullet:FlxButton;
		private var deathCrusher:FlxButton;
		
		private var medalDeath:FlxButton;
		
		public function Medals() {
			if ( Registry.timesPlayed >= 100 ) {
				Registry.death100 = true;
			}
			
			awardText = new FlxText( 16, 183, 128, "Press 'C' to clear records", true );
			awardText.alignment = "center"; awardText.scrollFactor.y = 0; awardText.color = 0xFF666666;
			
			medal50 = new FlxButton( 22, 20 );
			medal50.scrollFactor.y = 0;
			medal50.onOver = function():void { awardText.text = "Reach 50m"; awardText.color = 0xFFffFFff; }
			medal50.onOut = function():void { awardText.text = "Press 'C' to clear records"; awardText.color = 0xFF666666;  }
			if ( Registry.reached50 ) {
				medal50.loadGraphic( AssetsRegistry.medal50_PNG, false, false, 26, 24, false );
			} else {
				medal50.loadGraphic( AssetsRegistry.medalNO_PNG, false, false, 26, 24, false );
			}
			
			medal100 = new FlxButton( 22, 54 );
			medal100.scrollFactor.y = 0;
			medal100.onOver = function():void { awardText.text = "Reach 100m"; awardText.color = 0xFFffFFff; }
			medal100.onOut = function():void { awardText.text = "Press 'C' to clear records"; awardText.color = 0xFF666666; }
			if ( Registry.reached100 ) {
				medal100.loadGraphic( AssetsRegistry.medal100_PNG, false, false, 26, 24, false );
			} else {
				medal100.loadGraphic( AssetsRegistry.medalNO_PNG, false, false, 26, 24, false );
			}
			
			medal300 = new FlxButton( 22, 88 );
			medal300.scrollFactor.y = 0;
			medal300.onOver = function():void { awardText.text = "Reach 300m"; awardText.color = 0xFFffFFff; }
			medal300.onOut = function():void { awardText.text = "Press 'C' to clear records"; awardText.color = 0xFF666666; }
			if ( Registry.reached300 ) {
				medal300.loadGraphic( AssetsRegistry.medal300_PNG, false, false, 26, 24, false );
			} else {
				medal300.loadGraphic( AssetsRegistry.medalNO_PNG, false, false, 26, 24, false );
			}
			
			medal500 = new FlxButton( 22, 122 );
			medal500.scrollFactor.y = 0;
			medal500.onOver = function():void { awardText.text = "Reach 500m"; awardText.color = 0xFFffFFff; }
			medal500.onOut = function():void { awardText.text = "Press 'C' to clear records"; awardText.color = 0xFF666666; }
			if ( Registry.reached500 ) {
				medal500.loadGraphic( AssetsRegistry.medal500_PNG, false, false, 26, 24, false );
			} else {
				medal500.loadGraphic( AssetsRegistry.medalNO_PNG, false, false, 26, 24, false );
			}
			
			jump100 = new FlxButton( 67, 20 );
			jump100.scrollFactor.y = 0;
			jump100.onOver = function():void { awardText.text = "Jump 100 times"; awardText.color = 0xFFffFFff; }
			jump100.onOut = function():void { awardText.text = "Press 'C' to clear records"; awardText.color = 0xFF666666; }
			if ( Registry.jumps100 ) {
				jump100.loadGraphic( AssetsRegistry.jump100_PNG, false, false, 26, 24, false );
			} else {
				jump100.loadGraphic( AssetsRegistry.medalNO_PNG, false, false, 26, 24, false );
			}
			
			jump500 = new FlxButton( 67, 54 );
			jump500.scrollFactor.y = 0;
			jump500.onOver = function():void { awardText.text = "Jump 500 times"; awardText.color = 0xFFffFFff; }
			jump500.onOut = function():void { awardText.text = "Press 'C' to clear records"; awardText.color = 0xFF666666; }
			if ( Registry.jumps500 ) {
				jump500.loadGraphic( AssetsRegistry.jump500_PNG, false, false, 26, 24, false );
			} else {
				jump500.loadGraphic( AssetsRegistry.medalNO_PNG, false, false, 26, 24, false );
			}
			
			jump1000 = new FlxButton( 67, 88 );
			jump1000.scrollFactor.y = 0;
			jump1000.onOver = function():void { awardText.text = "Jump 1000 times"; awardText.color = 0xFFffFFff; }
			jump1000.onOut = function():void { awardText.text = "Press 'C' to clear records"; awardText.color = 0xFF666666; }
			if ( Registry.jumps1000 ) {
				jump1000.loadGraphic( AssetsRegistry.jump1000_PNG, false, false, 26, 24, false );
			} else {
				jump1000.loadGraphic( AssetsRegistry.medalNO_PNG, false, false, 26, 24, false );
			}
			
			jump2000 = new FlxButton( 67, 122 );
			jump2000.scrollFactor.y = 0;
			jump2000.onOver = function():void { awardText.text = "Jump 2000 times"; awardText.color = 0xFFffFFff; }
			jump2000.onOut = function():void { awardText.text = "Press 'C' to clear records"; awardText.color = 0xFF666666; }
			if ( Registry.jumps2000 ) {
				jump2000.loadGraphic( AssetsRegistry.jump2000_PNG, false, false, 26, 24, false );
			} else {
				jump2000.loadGraphic( AssetsRegistry.medalNO_PNG, false, false, 26, 24, false );
			}
			
			achievALL = new FlxButton( 67, 156 );
			achievALL.scrollFactor.y = 0;
			achievALL.onOver = function():void { awardText.text = "Unlock all medals"; awardText.color = 0xFFffFFff; }
			achievALL.onOut = function():void { awardText.text = "Press 'C' to clear records"; awardText.color = 0xFF666666; }
			if ( Registry.jumps100 && Registry.jumps500 && Registry.jumps1000 && Registry.jumps2000
				&& Registry.reached50 && Registry.reached100 && Registry.reached300 && Registry.reached500 && Registry.death100
				&& Registry.medal_quake && Registry.medal_Block && Registry.medal_Spike && Registry.medal_Bullet && Registry.medal_Mover ) {
				achievALL.loadGraphic( AssetsRegistry.achievALL_PNG, false, false, 26, 24, false );
				Registry.achiev_ALL = true;
				
				if ( Registry.unlockRainbow == false ) {
					API.unlockMedal("Achievement Unlocked");
					Registry.unlockRainbow = true;
					Registry.birds.push("rainbow");
					Registry.SaveBirds();
					Registry.notifier.GetAll();
				}
			} else {
				achievALL.loadGraphic( AssetsRegistry.medalNO_PNG, false, false, 26, 24, false );
			}
			
			deathBlock = new FlxButton( 112, 20 );
			deathBlock.scrollFactor.y = 0;
			deathBlock.onOver = function():void { awardText.text = "Evade 100 Spike Blocks"; awardText.color = 0xFFffFFff; }
			deathBlock.onOut = function():void { awardText.text = "Press 'C' to clear records"; awardText.color = 0xFF666666; }
			if ( Registry.medal_Block ) {
				deathBlock.loadGraphic( AssetsRegistry.deathBlock_PNG, false, false, 26, 24, false );
			} else {
				deathBlock.loadGraphic( AssetsRegistry.medalNO_PNG, false, false, 26, 24, false );
			}
			
			deathLoop = new FlxButton( 112, 54 );
			deathLoop.scrollFactor.y = 0;
			deathLoop.onOver = function():void { awardText.text = "Evade 20 Death Loops"; awardText.color = 0xFFffFFff; }
			deathLoop.onOut = function():void { awardText.text = "Press 'C' to clear records"; awardText.color = 0xFF666666; }
			if ( Registry.medal_Spike ) {
				deathLoop.loadGraphic( AssetsRegistry.deathLoop_PNG, false, false, 26, 24, false );
			} else {
				deathLoop.loadGraphic( AssetsRegistry.medalNO_PNG, false, false, 26, 24, false );
			}
			
			deathQuake = new FlxButton( 112, 88 );
			deathQuake.scrollFactor.y = 0;
			deathQuake.onOver = function():void { awardText.text = "Evade 10 Quakes"; awardText.color = 0xFFffFFff; }
			deathQuake.onOut = function():void { awardText.text = "Press 'C' to clear records"; awardText.color = 0xFF666666; }
			if ( Registry.medal_quake ) {
				deathQuake.loadGraphic( AssetsRegistry.deathQuake_PNG, false, false, 26, 24, false );
			} else {
				deathQuake.loadGraphic( AssetsRegistry.medalNO_PNG, false, false, 26, 24, false );
			}
			
			deathBullet = new FlxButton( 112, 122 );
			deathBullet.scrollFactor.y = 0;
			deathBullet.onOver = function():void { awardText.text = "Evade 20 Flame Bullets"; awardText.color = 0xFFffFFff; }
			deathBullet.onOut = function():void { awardText.text = "Press 'C' to clear records"; awardText.color = 0xFF666666; }
			if ( Registry.medal_Bullet ) {
				deathBullet.loadGraphic( AssetsRegistry.deathBullet_PNG, false, false, 26, 24, false );
			} else {
				deathBullet.loadGraphic( AssetsRegistry.medalNO_PNG, false, false, 26, 24, false );
			}
			
			deathCrusher = new FlxButton( 112, 156 );
			deathCrusher.scrollFactor.y = 0;
			deathCrusher.onOver = function():void { awardText.text = "Evade 20 Crushers"; awardText.color = 0xFFffFFff; }
			deathCrusher.onOut = function():void { awardText.text = "Press 'C' to clear records"; awardText.color = 0xFF666666; }
			if ( Registry.medal_Mover ) {
				deathCrusher.loadGraphic( AssetsRegistry.deathCrusher_PNG, false, false, 26, 24, false );
			} else {
				deathCrusher.loadGraphic( AssetsRegistry.medalNO_PNG, false, false, 26, 24, false );
			}
			
			medalDeath = new FlxButton( 22, 156 );
			medalDeath.loadGraphic( AssetsRegistry.medalNO_PNG, false, false, 26, 24, false );
			medalDeath.scrollFactor.y = 0;
			medalDeath.onOut = function():void { awardText.text = "Press 'C' to clear records"; awardText.color = 0xFF666666; }
			medalDeath.onOver = function():void { if ( Registry.death100 ) {
					awardText.text = "Play for a century"; awardText.color = 0xFFffFFff;
				} else {
					awardText.text = "Play for some time"; awardText.color = 0xFFffFFff;
				}
			}
			if ( Registry.death100 ) {
				medalDeath.loadGraphic( AssetsRegistry.medalDeath100_PNG, false, false, 26, 24, false );
				if ( Registry.unlockDeath == false ) {
					API.unlockMedal("Sacrificer");
					Registry.unlockedMedals += 1;
					Registry.unlockDeath = true;
					Registry.birds.push("dead");
					Registry.SaveBirds();
				}
			} else {
				medalDeath.loadGraphic( AssetsRegistry.medalNO_PNG, false, false, 26, 24, false );
			}
			
			add( medal50 ); add( medal100 ); add( medal300 );
			add( medal500 ); add( medalDeath );
			
			add( jump100 ); add( jump500 ); add( jump1000 );
			add( jump2000 ); add( achievALL );
			
			add( deathQuake ); add( deathBlock ); add( deathLoop );
			add( deathBullet ); add( deathCrusher );
			
			add( awardText );
		}
	}
}