package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxButton;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;
	import org.flixel.FlxTimer;
	/**
	 * ...
	 * @author Mantis
	 */
	public class ColorSelection extends FlxGroup
	{
		[Embed(source = "/../assets/img/other/Handle.png")] private var handle_PNG:Class;
		[Embed(source = "/../assets/img/other/HandleRight.png")] private var handleRight_PNG:Class;
		[Embed(source = "/../assets/players/Players.png")] private var players:Class;
		[Embed(source = "../assets/players/PlayersDark.png")] private var blackPNG:Class;
		public var chooseText:FlxText;
		
		private var bird1:FlxSprite;
		private var bird2:FlxSprite;
		private var bird3:FlxSprite;
		
		public var canSelect:Boolean = false;
		
		private var left:FlxButton;
		private var right:FlxButton;
		public function ColorSelection() {
			chooseText = new FlxText( 16, 168, 128, "Select Bird:", true );
			chooseText.setFormat( null, 8, 0xff0000, "center" );
			chooseText.scrollFactor.y = 0;
			if ( Registry.colorValue == 11 ) {
				chooseText.text = "Puke Some Rainbows!";
			}
			
			bird1 = new FlxSprite( 54, 181 );
			bird1.loadGraphic( blackPNG, true, false, 14, 16 );
			bird1.scrollFactor.y = 0;
			
			bird1.addAnimation( "blue", [0], 0, false );
			bird1.addAnimation( "red", [1], 0, false );
			bird1.addAnimation( "green", [2], 0, false );
			bird1.addAnimation( "white", [3], 0, false );
			bird1.addAnimation( "black", [4], 0, false );
			bird1.addAnimation( "sick", [5], 0, false );
			bird1.addAnimation( "gen", [6], 0, false );
			bird1.addAnimation( "gold", [7], 0, false );
			bird1.addAnimation( "dead", [8], 0, false );
			bird1.addAnimation( "rainbow", [9], 0, false );
			bird1.addAnimation( "locked", [10], 0, false );
			bird1.addAnimation( "random", [11], 0, false );
			
			bird2 = new FlxSprite( 74, 181 );
			bird2.loadGraphic( players, true, false, 14, 16 );
			bird2.scrollFactor.y = 0;
			
			bird2.addAnimation( "blue", [0], 0, false );
			bird2.addAnimation( "red", [1], 0, false );
			bird2.addAnimation( "green", [2], 0, false );
			bird2.addAnimation( "white", [3], 0, false );
			bird2.addAnimation( "black", [4], 0, false );
			bird2.addAnimation( "sick", [5], 0, false );
			bird2.addAnimation( "gen", [6], 0, false );
			bird2.addAnimation( "gold", [7], 0, false );
			bird2.addAnimation( "dead", [8], 0, false );
			bird2.addAnimation( "rainbow", [9], 0, false );
			bird2.addAnimation( "locked", [10], 0, false );
			bird2.addAnimation( "random", [11], 0, false );
			
			bird3 = new FlxSprite( 94, 181 );
			bird3.loadGraphic( blackPNG, true, false, 14, 16 );
			bird3.scrollFactor.y = 0;
			
			bird3.addAnimation( "blue", [0], 0, false );
			bird3.addAnimation( "red", [1], 0, false );
			bird3.addAnimation( "green", [2], 0, false );
			bird3.addAnimation( "white", [3], 0, false );
			bird3.addAnimation( "black", [4], 0, false );
			bird3.addAnimation( "sick", [5], 0, false );
			bird3.addAnimation( "gen", [6], 0, false );
			bird3.addAnimation( "gold", [7], 0, false );
			bird3.addAnimation( "dead", [8], 0, false );
			bird3.addAnimation( "rainbow", [9], 0, false );
			bird3.addAnimation( "locked", [10], 0, false );
			bird3.addAnimation( "random", [11], 0, false );
			
			SwitchColor();
			
			left = new FlxButton( 42, 183, null, HandleLeft );
			left.loadGraphic( handle_PNG, false, true, 25, 12 );
			left.scrollFactor.y = 0;
			right = new FlxButton( 94, 183, null, HandleRight );
			right.loadGraphic( handleRight_PNG, false, true, 25, 12 );
			right.scrollFactor.y = 0;
			
			add( chooseText );
			add( bird1 ); add( bird2 ); add( bird3 );
			add( left ); add( right );
		}
		public function SwitchColor():void {
			switch( Registry.colorValue ) {
				case 0:
					if ( Registry.unlockRainbow ) {
						bird1.play( "rainbow" );
					} else {
						bird1.play( "locked" );
					}
					
					bird2.play( "random" );
					bird3.play( "blue" );
					chooseText.text = "Select Bird:";
					canSelect = true;
					break;
				case 1:
					bird1.play( "random" );
					bird2.play( "blue" );
					bird3.play( "red" );
					canSelect = true;
					break;
				case 2:
					bird1.play( "blue" );
					bird2.play( "red" );
					bird3.play( "green" );
					canSelect = true;
					break;
				case 3:
					bird1.play( "red" );
					bird2.play( "green" );
					if ( Registry.unlockWhite ) {
						bird3.play( "white" );
					} else {
						bird3.play( "locked" );
					}
					chooseText.text = "Select Bird:";
					canSelect = true;
					break;
				case 4:
					bird1.play( "green" );
					
					if ( Registry.unlockWhite ) {
						bird2.play( "white" );
						canSelect = true;
						chooseText.text = "Select Bird:";
					} else {
						bird2.play( "locked" );
						canSelect = false;
						chooseText.text = "Unlock 1 Medal";
					}
					
					if ( Registry.unlockBlack ) {
						bird3.play( "black" );
					} else {
						bird3.play( "locked" );
					}
					break;
				case 5:
					if ( Registry.unlockWhite ) {
						bird1.play( "white" );
					} else {
						bird1.play( "locked" );
					}
					
					if ( Registry.unlockBlack ) {
						bird2.play( "black" );
						canSelect = true;
						chooseText.text = "Select Bird:";
					} else {
						bird2.play( "locked" );
						canSelect = false;
						chooseText.text = "Unlock 3 Medals";
					}
					
					if ( Registry.unlockSick ) {
						bird3.play( "sick" );
					} else {
						bird3.play( "locked" );
					}
					break;
				case 6:
					if ( Registry.unlockBlack ) {
						bird1.play( "black" );
					} else {
						bird1.play( "locked" );
					}
					
					if ( Registry.unlockSick ) {
						bird2.play( "sick" );
						canSelect = true;
						chooseText.text = "Select Bird:";
					} else {
						bird2.play( "locked" );
						canSelect = false;
						chooseText.text = "Unlock 6 Medals";
					}
					
					if ( Registry.unlockGen ) {
						bird3.play( "gen" );
					} else {
						bird3.play( "locked" );
					}
					break;
				case 7:
					if ( Registry.unlockSick ) {
						bird1.play( "sick" );
					} else {
						bird1.play( "locked" );
					}
					
					if ( Registry.unlockGen ) {
						bird2.play( "gen" );
						canSelect = true;
						chooseText.text = "Select Bird:";
					} else {
						bird2.play( "locked" );
						canSelect = false;
						chooseText.text = "Unlock 9 Medals";
					}
					
					if ( Registry.unlockGold ) {
						bird3.play( "gold" );
					} else {
						bird3.play( "locked" );
					}
					break;
				case 8:
					if ( Registry.unlockGen ) {
						bird1.play( "gen" );
					} else {
						bird1.play( "locked" );
					}
					
					if ( Registry.unlockGold ) {
						bird2.play( "gold" );
						canSelect = true;
						chooseText.text = "Select Bird:";
					} else {
						bird2.play( "locked" );
						canSelect = false;
						chooseText.text = "Unlock 12 Medals";
					}
					
					if ( Registry.unlockDeath ) {
						bird3.play( "dead" );
					} else {
						bird3.play( "locked" );
					}
					break;
				case 9:
					if ( Registry.unlockGold ) {
						bird1.play( "gold" );
					} else {
						bird1.play( "locked" );
					}
					
					if ( Registry.unlockDeath ) {
						bird2.play( "dead" );
						chooseText.text = "Select Bird:";
						canSelect = true;
					} else {
						bird2.play( "locked" );
						chooseText.text = "Play for Some Time";
						canSelect = false;
					}
					
					if ( Registry.unlockRainbow ) {
						bird3.play( "rainbow" );
					} else {
						bird3.play( "locked" );
					}
					break;
				case 10:
					if ( Registry.unlockDeath ) {
						bird1.play( "dead" );
					} else {
						bird1.play( "locked" );
					}
					
					if ( Registry.unlockRainbow ) {
						bird2.play( "rainbow" );
						chooseText.text = "Puke Some Rainbows!";
						canSelect = true;
					} else {
						bird2.play( "locked" );
						chooseText.text = "Unlock All Medals";
						canSelect = false;
					}
					
					bird3.play( "random" );
					break;
			}
		}
		override public function update():void {
			super.update();
			if ( FlxG.keys.justPressed("LEFT") || FlxG.keys.justPressed("A") ) {
				HandleLeft();
			} if ( FlxG.keys.justPressed("RIGHT") || FlxG.keys.justPressed("D") ) {
				HandleRight();
			}
			
			SwitchColor();
		}
		public function HandleLeft():void {
			if ( Registry.playSFX ) {
				FlxG.play( AssetsRegistry.click_MP3, 1, false, false );
			}
			if (  Registry.colorValue >= 0 ) {
				Registry.colorValue -= 1;
			} if ( Registry.colorValue == -1 ) {
				Registry.colorValue = 10;
			}
		}
		public function HandleRight():void {
			if ( Registry.playSFX ) {
				FlxG.play( AssetsRegistry.click_MP3, 1, false, false );
			}
			if ( Registry.colorValue < 11 ) {
				Registry.colorValue += 1;
			} if ( Registry.colorValue == 11 ) {
				Registry.colorValue = 0;
			}
		}
	}
}