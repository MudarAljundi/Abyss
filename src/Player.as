package  
{
	import org.flixel.FlxButton;
	import org.flixel.FlxEmitter;
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	import org.flixel.FlxTimer;
	import org.flixel.plugin.FlxTrail;
	/**
	 * ...
	 * @author Mantis
	 */
	public class Player extends FlxSprite
	{
		[Embed(source = "/../assets/sfx/Jump16.mp3")] private var jump_mp3:Class;
		[Embed(source = "/../assets/sfx/beam20.mp3")] private var beam_mp3:Class;
		[Embed(source = "/../assets/sfx/Land1.mp3")] private var land_mp3:Class;
		[Embed(source = "/../assets/players/Player_Blue5.png")] private var player_blue:Class;
		[Embed(source = "/../assets/players/Player_Red5.png")] private var player_red:Class;
		[Embed(source = "/../assets/players/Player_Green5.png")] private var player_green:Class;
		[Embed(source = "/../assets/players/Player_White5.png")] private var player_white:Class;
		[Embed(source = "/../assets/players/Player_Black.png")] private var player_black:Class;
		[Embed(source = "/../assets/players/Player_Sick.png")] private var player_sick:Class;
		[Embed(source = "/../assets/players/Player_Genclops.png")] private var player_gen:Class;
		[Embed(source = "/../assets/players/Player_Flame2.png")] private var player_flame:Class;
		[Embed(source = "/../assets/players/Player_Dead5.png")] private var player_DEAD:Class;
		[Embed(source = "/../assets/players/Player_Rainbow.png")] private var player_RAINBOW:Class;
		[Embed(source = "/../assets/img/particles/Splat2Blood.png")] private var splatBlood_PNG:Class;
		[Embed(source = "/../assets/img/particles/Trail_Rainbow.png")] private var trailRainbow_PNG:Class;
		[Embed(source = "../assets/img/particles/Line.png")] private var beam_PNG:Class;
		[Embed(source = "../assets/img/particles/Burst.png")] private var burst_PNG:Class;
		public var usingRainbow:Boolean = false;
		public var usingSick:Boolean = false;
		public var usingGold:Boolean = false;
		public var usingDead:Boolean = false;
		public var usingGen:Boolean = false;
		
		public var trail:FlxTrail;
		public var splatBlood:FlxEmitter;
		public var beam:FlxSprite;
		public var burst:FlxSprite;
		private var shooting:Boolean;
		private var beamTimer:FlxTimer;
		public var isAlive:Boolean = true;
		public var onLeftWall:Boolean = false;
		public var onRightWall:Boolean = false;
		public function Player(ColorValue:int) {
			super( 72, 175 );
			
			if ( ColorValue == 0 ) {
				var graphic:String = Registry.GetRandom( Registry.birds );
				if ( graphic == "blue" ) {
					loadGraphic( player_blue, true, true, 15, 16, false );
				} else if ( graphic == "green" ) {
					loadGraphic( player_green, true, true, 15, 16, false );
				} else if ( graphic == "red" ) {
					loadGraphic( player_red, true, true, 15, 16, false );
				} else if ( graphic == "white" ) {
					loadGraphic( player_white , true, true, 15, 16, false );
				} else if ( graphic == "black" ) {
					loadGraphic( player_black, true, true, 15, 16, false );
				} else if ( graphic == "sick" ) {
					loadGraphic( player_sick, true, true, 15, 16, false );
					usingSick = true;
				} else if ( graphic == "gen" ) {
					loadGraphic( player_gen, true, true, 15, 16, false );
					usingGen = true;
					addAnimation( "shoot", [8], 0, false );
					beamTimer = new FlxTimer();
					beam = new FlxSprite( 0, 0 );
					beam.loadGraphic( beam_PNG, false, true, 106, 106, false );
					beam.exists = false;
					burst = new FlxSprite( -20, -20 );
					burst.loadGraphic( burst_PNG, true, false, 20, 20, false );
					burst.addAnimation( "norm", [0, 1, 2, 3, 4, 5, 5, 0], 30, false );
					burst.exists = false;
				} else if ( graphic == "gold" ) {
					loadGraphic( player_flame, true, true, 27, 27, false );
					offset.x = 7; offset.y = 8;
					usingGold = true;
				} else if ( graphic == "dead" ) {
					loadGraphic( player_DEAD, true, true, 15, 16, false );
					splatBlood = new FlxEmitter();
					splatBlood.setYSpeed( -50, 50 );
					splatBlood.makeParticles( splatBlood_PNG, 12, 1, false, 0 );
					usingDead = true;
				} else if ( graphic == "rainbow" ) {
					loadGraphic( player_RAINBOW, true, true, 15, 16, false );
					trail = new FlxTrail( this, trailRainbow_PNG, 30, 1, 1, 0.033 );
					usingRainbow = true;
				}
			} else if ( ColorValue == 1 ) {
				loadGraphic( player_blue, true, true, 15, 16, false );
			} else if ( ColorValue == 2 ) {
				loadGraphic( player_red, true, true, 15, 16, false );
			} else if ( ColorValue == 3 ) {
				loadGraphic( player_green, true, true, 15, 16, false );
			} else if ( ColorValue == 4 ) {
				loadGraphic( player_white, true, true, 15, 16, false );
			} else if ( ColorValue == 5 ) {
				loadGraphic( player_black, true, true, 15, 16, false );
			} else if ( ColorValue == 6 ) {
				loadGraphic( player_sick, true, true, 15, 16, false );
				usingSick = true;
			} else if ( ColorValue == 7 ) {
				loadGraphic( player_gen, true, true, 15, 16, false );
				usingGen = true;
				addAnimation( "shoot", [8], 0, false );
				beamTimer = new FlxTimer();
				beam = new FlxSprite( 0, 0 );
				beam.loadGraphic( beam_PNG, false, true, 106, 106, false );
				beam.exists = false;
				burst = new FlxSprite( -20, -20 );
				burst.loadGraphic( burst_PNG, true, false, 20, 20, false );
				burst.addAnimation( "norm", [0, 1, 2, 3, 4, 5, 5, 0], 30, false );
				burst.exists = false;
			} else if ( ColorValue == 8 ) {
				loadGraphic( player_flame, true, true, 27, 27, false );
				offset.x = 7; offset.y = 8;
				usingGold = true;
			} else if ( ColorValue == 9 ) {
				loadGraphic( player_DEAD, true, true, 15, 16, false );
				splatBlood = new FlxEmitter();
				splatBlood.setYSpeed( -50, 50 );
				splatBlood.makeParticles( splatBlood_PNG, 12, 1, false, 0 );
				usingDead = true;
			} else if ( ColorValue == 10 ) {
				loadGraphic( player_RAINBOW, true, true, 15, 16, false );
				trail = new FlxTrail( this, trailRainbow_PNG, 30, 1, 1, 0.033 );
				usingRainbow = true;
			}
			width = 13; height = 14;
			if ( !usingGold ) {
				offset.x = 1; offset.y = 2;
			}
			
			addAnimation( "idle", [0], 0, false );
			addAnimation( "move", [0, 1, 0, 2], 20, true );
			addAnimation( "wall", [3, 4, 5], 50, false );
			addAnimation( "air", [ 0, 6, 6, 7], 20, false );
			
			drag.x = 500;
			acceleration.y = 300;
			maxVelocity.y = 205;
			
			maxVelocity.x = 200;
			acceleration.x = 150;
		}
		override public function update():void {
			super.update();
			if ( isAlive ) {
				//Movement
				acceleration.x = 0;
				if (velocity.x == 0 && isTouching(FLOOR)) { play( "idle" ); }
				else if (!velocity.x == 0 && isTouching(FLOOR)) { play( "move" ); }
				if ( !onLeftWall && !onRightWall && !isTouching( DOWN ) ) { 
					drag.x = 0; play("air");
				} else {
					drag.x = 500; onLeftWall = false; onRightWall = false;
					maxVelocity.x = 200;
				}
				if ( Registry.playSFX && justTouched( ANY ) ) {
					FlxG.play( land_mp3, 0.2, false, false );
				}
				if ( FlxG.keys.RIGHT || FlxG.keys.D ) {
					acceleration.x = 600;
					if ( !usingGen ) {
						facing = RIGHT;
					} else {
						if ( !shooting ) {
							facing = RIGHT;
						}
					}
				}
				if ( FlxG.keys.LEFT || FlxG.keys.A ) {
					acceleration.x = -600;
					if ( !usingGen ) {
						facing = LEFT;
					} else {
						if ( !shooting ) {
							facing = LEFT;
						}
					}
				}
				if ( FlxG.keys.justPressed("SPACE") || FlxG.keys.justPressed("Z")
					|| FlxG.keys.justPressed("UP") || FlxG.keys.justPressed("W") || FlxG.keys.justPressed("ENTER") ) {
					play("air");
					if  ( isTouching( DOWN ) ) {
						if ( Registry.playSFX ) {
							FlxG.play( jump_mp3, 0.5, false, false );
						}
						Registry.jumps += 1;
						velocity.y -= 225;
					}
				}
				if ( FlxG.keys.justReleased("SPACE") || FlxG.keys.justReleased("Z")
					|| FlxG.keys.justReleased("UP") || FlxG.keys.justReleased("W") || FlxG.keys.justReleased("ENTER") ) {
					if ( velocity.y <= 0 ) {
						velocity.y = velocity.y / 2; velocity.x = velocity.x / 2;
					}
				}
				if ( justTouched( LEFT ) ) {
					play( "wall", true );
					if ( usingDead ) {
						Registry.splat_Man.SpawnOne( x - 2, y + 3, false );
					} if ( usingGen ) {
						beam.exists = false
					}
				} if ( justTouched( RIGHT ) ) {
					play( "wall", true );
					if ( usingDead ) {
						Registry.splat_Man.SpawnOne( x + 12, y + 3, true );
					} if ( usingGen ) {
						beam.exists = false
					}
				}
				if ( isTouching(LEFT) ) {
					onLeftWall = true;
					facing = LEFT;
					maxVelocity.x = 0; velocity.x -= 100;
					if ( FlxG.keys.justPressed("SPACE") || FlxG.keys.justPressed("Z")
					|| FlxG.keys.justPressed("UP") || FlxG.keys.justPressed("W") || FlxG.keys.justPressed("ENTER") ) {
						Registry.jumps += 1;
						onLeftWall = false; onRightWall = false;
						velocity.x = 0; maxVelocity.x = 200; velocity.x += 175;
						velocity.y -= 500;
						if ( Registry.playSFX ) {
							if ( !usingGen ) {
								FlxG.play( jump_mp3, 0.5, false, false );
							} else {
								FlxG.play( beam_mp3, 0.5, false, false );
							}
						}
						if ( usingGen ) {
							beam.exists = true;
							beam.facing = LEFT;
							beamTimer.start( 0.3, 1, HandleBeam );
							shooting = true;
							burst.exists = true;
							burst.reset( x - 7, y - 9 );
							burst.play( "norm" );
						}
					}
				} else {
					onLeftWall = false;
					maxVelocity.x = 200;
				}
				if ( isTouching(RIGHT) ) {
					onRightWall = true;
					facing = RIGHT;
					maxVelocity.x = 0; velocity.x += 1;
					if ( FlxG.keys.justPressed("SPACE") || FlxG.keys.justPressed("Z")
					|| FlxG.keys.justPressed("UP") || FlxG.keys.justPressed("W") || FlxG.keys.justPressed("ENTER") ) {
						Registry.jumps += 1;
						onLeftWall = false; onRightWall = false;
						velocity.x = 0; maxVelocity.x = 200; velocity.x -= 175;
						velocity.y -= 500;
						if ( Registry.playSFX ) {
							if ( !usingGen ) {
								FlxG.play( jump_mp3, 0.5, false, false );
							} else {
								FlxG.play( beam_mp3, 0.5, false, false );
							}
						}
						if ( usingGen ) {
							beam.exists = true;
							beam.facing = RIGHT;
							beamTimer.start( 0.3, 1, HandleBeam );
							shooting = true;
							burst.exists = true;
							burst.reset( x, y - 9 );
							burst.play( "norm" );
						}
					}
				} else {
					onRightWall = false;
					maxVelocity.x = 200;
				}
				if ( usingGen ) {
					if ( facing == LEFT ) {
						beam.x = x - 99;
					} else {
						beam.x = x + 5;
					}
					beam.y = y + 3;
					if ( shooting ) {
						play( "shoot" );
					}
				}
			}
		}
		private function HandleBeam(t:FlxTimer):void {
			beam.exists = false;
			burst.exists = false;
			shooting = false;
		}
		override public function kill():void {
			isAlive = false;
			super.kill();
		}
	}
}