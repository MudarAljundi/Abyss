package  
{
	import com.newgrounds.API;
	import flash.display.StageDisplayState;
	import flash.display.StageScaleMode;
	import flash.events.KeyboardEvent;
	import org.flixel.FlxBasic;
	import org.flixel.FlxGroup;
	import org.flixel.FlxParticle;
	import org.flixel.FlxRect;
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
	public class PlayState extends FlxState {
		[Embed(source = "/../assets/sfx/Hit2.mp3")] private var playerHitHazard_MP3:Class;
		[Embed(source = "/../assets/sfx/Destroy1.mp3")] private var destroy1_MP3:Class;
		[Embed(source = "/../assets/sfx/Destroy2.mp3")] private var destroy2_MP3:Class;
		[Embed(source = "/../assets/img/other/TilesGround.png")] private var ground_PNG:Class;
		private var deathTimer:Number = 0;
		
		private var worldText:FlxText;
		private var yearText:FlxText;
		
		private var worldLength:Number = 0;
		private var screenLength:int = -240;
		private var shakeLength:Number = -1500;
		private var patternLength:int = -240;
		
		public var _bottom:FlxGroup;
		public var _arrows:FlxGroup;
		public var _world:FlxGroup;
		public var _hazards:FlxGroup;
		public var _light:FlxGroup;
		private var _hud:FlxGroup;
		public var _top:FlxGroup;
		override public function create():void {
			FlxG.flash( 0xff000000, 0.3 );
			if ( Registry.playMusic ) {
				FlxG.music.volume = 1;
			}
			if ( Registry.playMusic && !FlxG.music.active ) {
				if ( Registry.currentTrack == 1 ) {
					FlxG.playMusic( Theme1, 1 );
				} else if ( Registry.currentTrack == 2 ) {
					FlxG.playMusic( Theme2, 1 );
				}
			}
			if ( !Registry.playMusic && !FlxG.music.active ) {
				FlxG.playMusic( Theme1, 0 );
				FlxG.music.stop();
			}
			
			yearText = new FlxText( 16, 114, 128, null );
			yearText.text = "Year " + Registry.timesPlayed;
			yearText.setFormat( null, 8, 0xffFFff, "center" );
			worldText = new FlxText( 16, 3, 128 );
			worldText.scrollFactor.y = 0;
			
			if ( Registry.firstTime ) {
				Registry.player = new Player( 1 );
			} else if ( Registry.timesPlayed == 13 || Registry.timesPlayed == 66 || Registry.timesPlayed == 100
				|| Registry.timesPlayed == 666 ) {
				Registry.player = new Player( 9 );
			} else {
				Registry.player = new Player( Registry.colorValue );
			}
			
			Registry.notifier = new MedalsNotifier();
			Registry.lava = new Lava();
			Registry.lines = new Lines();
			Registry.darkness = new Darkness();
			Registry.gameOver = new GameOverGroup();
			Registry.options = new Options(true);
			Registry._black = new _Black();
			Registry.light = new Light();
			Registry.spike = new Spike();
			Registry.arrow_Man = new ArrowManager();
			Registry.bg_Man = new BgManager();
			Registry.wall_Man = new WallManager();
			Registry.mover_Man = new MoverManager();
			Registry.block_Man = new BlockManager();
			Registry.sentuary_Man = new SentuaryManager();
			Registry.bullet_Man = new BulletManager();
			Registry.loop_Man = new LoopManager();
			Registry.spike_Man = new LoopSpikeManager();
			Registry.fx = new SpecialFX();
			
			_bottom = new FlxGroup();
			_arrows = new FlxGroup();
			_world = new FlxGroup();
			_hazards = new FlxGroup();
			_hud = new FlxGroup();
			_light = new FlxGroup();
			_top = new FlxGroup();
			
			Registry.notifier.CheckMedals();
			
			if ( !Registry.knowsWallJump ) {
				Registry.tutorial_InGame = new TutorialSpace();
				_hud.add( Registry.tutorial_InGame );
			}
			
			if ( Registry.timesPlayed == 100 ) {
				Registry.notifier.Death100();
			}
			Registry.timesPlayed += 1;
			Registry.SaveDeaths = Registry.timesPlayed;
			Registry.SaveJumps();
			
			FlxG.camera.follow( Registry.player );
			FlxG.camera.setBounds( 0, int.MIN_VALUE + 240, 160, int.MAX_VALUE );
			FlxG.camera.deadzone = new FlxRect( 0, 100, 0, 500 );
			FlxG.worldBounds = new FlxRect( 0, -500, 320, 240 );
			
			add( Registry.bg_Man );
			add( Registry.arrow_Man );
			_arrows.add( Registry.mover_Man );
			_arrows.add( Registry.bullet_Man );
			_bottom.add( Registry.loop_Man );
			_world.add( _bottom );
			_world.add( Registry.wall_Man );
			_hazards.add( _arrows );
			_hazards.add( Registry.spike_Man );
			_hazards.add( Registry.bullet_Man );
			_hazards.add( Registry.block_Man );
			_hazards.add( Registry.lava );
			_light.add( Registry.light );
			_light.add( Registry.darkness );
			_hud.add( Registry._black );
			_hud.add( worldText ); 
			if ( Registry.knowsWallJump ) {
				_hud.add( yearText );
			}
			_hud.add( Registry.lines );
			_hud.add( Registry.options );
			_hud.add( Registry.notifier );
			_top.add( Registry.lava );
			_top.add( Registry.lava.lavaTop );
			add( _bottom );
			add( Registry.spike );
			add( _hazards );
			if ( Registry.player.usingGen ) {
				add( Registry.player );
				add( Registry.player.beam );
			}
			add( _world );
			if ( Registry.player.usingDead ) {
				Registry.splat_Man = new SplatterManager();
				add( Registry.splat_Man );
			}
			if ( Registry.player.usingRainbow ) {
				add( Registry.player.trail );
			}
			if ( Registry.player.usingGen ) {
				add( Registry.player.burst );
			} else {
				add( Registry.player );
			}
			add( Registry.sentuary_Man );
			if ( Registry.player.usingDead ) {
				Registry.fx.add( Registry.player.splatBlood );
			}
			add( Registry.fx );
			add( _light );
			add( _top );
			add( _hud );
			GenerateWalls( 1 );
		}
		override public function update():void {
			super.update();
			
			FlxG.worldBounds.x = FlxG.camera.scroll.x;
			FlxG.worldBounds.y = FlxG.camera.scroll.y;
			worldLength = -FlxG.camera.scroll.y/32;
			worldText.text =  Math.floor( worldLength ) + "m";
			
			if ( yearText.y >= FlxG.camera.scroll.y + 240 && yearText.exists ) {
				yearText.exists = false;
			}
			if ( FlxG.camera.scroll.y > 0 ) {
				FlxG.camera.scroll.y = 0;
			}
			
			FlxG.overlap( Registry.lava, Registry.fx, KillFX )
			FlxG.overlap( Registry.lava, Registry.block_Man, KillBlock )
			FlxG.overlap( Registry.lava, Registry.loop_Man, KillBlock )
			FlxG.overlap( Registry.lava, Registry.spike, KillBlock )
			FlxG.collide( Registry.wall_Man, Registry.fx );
			if ( Registry.player.isAlive ) {
				FlxG.collide( Registry.player, _world );
				FlxG.collide( _hazards, Registry.player, HitHazard );
				FlxG.overlap( Registry.player, Registry.lines )
			}
			
			if ( FlxG.camera.scroll.y <= screenLength ) {
				screenLength -= 240;
				GenerateWalls();
			} if ( FlxG.camera.scroll.y <= shakeLength ) {
				shakeLength -= 1000 + Math.random()*2000;
				PreShake();
			} if ( FlxG.camera.scroll.y <= patternLength ) {
				patternLength -= 96;
				if ( worldLength >= 300 ) {
					GeneratePattern( Math.floor( Math.random() * 13 ) + 2 );
				} else if ( worldLength >= 250 ) {
					GeneratePattern( Math.floor( Math.random() * 12 ) + 2 );
				} else if ( worldLength >= 200 ) {
					GeneratePattern( Math.floor( Math.random() * 9 ) + 2 );
				} else if ( worldLength >= 100 ) {
					GeneratePattern( Math.floor( Math.random() * 7 ) + 2 );
				} else if ( worldLength >= 50 ) {
					GeneratePattern( Math.floor( Math.random() * 6 ) + 1 );
				} else if ( worldLength >= 25 ) {
					GeneratePattern( Math.floor( Math.random() * 6 ) );
				} else if ( worldLength >= 0 ) {
					GeneratePattern( Math.floor( Math.random() * 4 ) );
					Registry.lava.fastMove = true;
				}
			}
			if ( Registry.player.y >= FlxG.camera.scroll.y + 250 ) {
				Registry.player.y += 99999;
				PlayerDeath();
			}
			if ( !Registry.player.exists ) {
				GameOver();
			}
			if ( !Registry.achiev_ALL ) {
				//Check Evade
				if ( Registry.medal_quake == false && Registry.evade_quake10 >= 10 ) {
					Registry.notifier.DeathQuake();
					Registry.medal_quake = true;
				} else if ( Registry.medal_Block == false && Registry.evade_Block100 >= 100 ) {
					Registry.notifier.DeathBlock();
					Registry.medal_Block = true;
				} else if ( Registry.medal_Spike == false && Registry.evade_Loop20 >= 35 ) {
					Registry.notifier.DeathLoop();
					Registry.medal_Spike = true;
				} else if ( Registry.medal_Bullet == false && Registry.evade_Bullet20 >= 20 ) {
					Registry.notifier.DeathBullet();
					Registry.medal_Bullet = true;
				} else if ( Registry.medal_Mover == false && Registry.evade_Crusher20 >= 20 ) {
					Registry.notifier.DeathCrusher();
					Registry.medal_Mover = true;
				}
				//Check Lines
				if ( Registry.reached50 == false && worldLength >= 50 ) {
					Registry.notifier.Reach50();
					Registry.reached50 = true;
				} else if ( Registry.reached100 == false && worldLength >= 100 ) {
					Registry.notifier.Reach100();
					Registry.reached100 = true;
				} else if ( Registry.reached300 == false && worldLength >= 300 ) {
					Registry.notifier.Reach300();
					Registry.reached300 = true;
				} else if ( Registry.reached500 == false && worldLength >= 500 ) {
					Registry.notifier.Reach500();
					Registry.reached500 = true;
				}
				//Check Jumps
				if ( Registry.jumps100 == false && Registry.jumps >= 100 ) {
					Registry.notifier.Jump100();
					Registry.jumps100 = true;
				} else if ( Registry.jumps500 == false && Registry.jumps >= 500 ) {
					Registry.notifier.Jump500();
					Registry.jumps500 = true;
				} else if ( Registry.jumps1000 == false && Registry.jumps >= 1000 ) {
					Registry.notifier.Jump1000();
					Registry.jumps1000 = true;
				} else if ( Registry.jumps2000 == false && Registry.jumps >= 2000 ) {
					Registry.notifier.Jump2000();
					Registry.jumps2000 = true;
				}
			}
		}
		public function GeneratePattern(level:int = 0):void {
			var b:FlxTileblock;
			var leftLoop:int = - 64 + ( ( Math.floor( Math.random() * 6 ) ) * 16);
			var hole:int = 80 + leftLoop + 4 * 16;
			var platform1:int = ( Math.floor( Math.random() * 8 ) +1 ) * 16;
			var platform2:int = ( Math.floor( Math.random() * 7 ) +1 ) * 16;
			var platform3:int = ( Math.floor( Math.random() * 6 ) +1 ) * 16;
			var platform4:int = ( Math.floor( Math.random() * 5 ) +1 ) * 16;
			if ( platform4 == 48 ) {
				platform4 += 16;
			}
			if ( leftLoop == -64 ) {
				leftLoop -= 16;
			} else if ( leftLoop == 32 ) {
				hole += 16;
			} else if ( hole == 144 ) {
				hole += 16;
			}
			
			if ( level == 0 ) { 
				Registry.block_Man.Platform1( platform1, FlxG.camera.scroll.y - 32 );
			} else if ( level == 1 ) { 
				Registry.block_Man.Platform2( platform2, FlxG.camera.scroll.y - 32 );
			} else if ( level == 2 ) { 
				Registry.block_Man.Platform3( platform3, FlxG.camera.scroll.y - 32 );
			} else if ( level == 3 ) { 
				Registry.block_Man.Platform4( platform4, FlxG.camera.scroll.y-32 );
			} else if ( level == 4 ) { 
				Registry.block_Man.Platform1x4( platform1, FlxG.camera.scroll.y - 80 );
				patternLength -= 32;
			} else if ( level == 5 ) {
				Registry.block_Man.Platform1x5( platform1, FlxG.camera.scroll.y - 96 );
				patternLength -= 48;
			} else if ( level == 6 ) {
				Registry.spike_Man.SpawnOne( leftLoop, FlxG.camera.scroll.y - 16 );
				Registry.spike_Man.SpawnOne( leftLoop + 16, FlxG.camera.scroll.y - 16 );
				Registry.spike_Man.SpawnOne( leftLoop + 32, FlxG.camera.scroll.y - 16 );
				Registry.spike_Man.SpawnOne( leftLoop + 48, FlxG.camera.scroll.y - 16 );
				Registry.spike_Man.SpawnOne( leftLoop + 64, FlxG.camera.scroll.y - 16 );
				
				Registry.spike_Man.SpawnOne( hole, FlxG.camera.scroll.y - 16 );
				Registry.spike_Man.SpawnOne( hole + 16, FlxG.camera.scroll.y - 16 );
				Registry.spike_Man.SpawnOne( hole + 32, FlxG.camera.scroll.y - 16 );
				Registry.spike_Man.SpawnOne( hole + 48, FlxG.camera.scroll.y - 16 );
				Registry.spike_Man.SpawnOne( hole + 64, FlxG.camera.scroll.y - 16 );
				
				b = new FlxTileblock( 0, 0, 1, 1 );
				b = Registry.loop_Man.SpawnLoop1();
				b.reset( leftLoop, FlxG.camera.scroll.y - 32 );
				_bottom.add(b);
				
				b = Registry.loop_Man.SpawnLoop2();
				b.reset( hole, FlxG.camera.scroll.y - 32 );
				_bottom.add(b);
				
				patternLength -= 10;
			} else if ( level == 7 ) {
				GenerateTurret( 0 );
			} else if ( level == 8 ) {
				GenerateTurret( 1 );
			} else if ( level == 9 ) {
				Registry.mover_Man.SpawnOne( platform4, FlxG.camera.scroll.y - 48 );
				patternLength -= 16;
			} else if ( level == 10 ) {
				Registry.mover_Man.SpawnTwo( platform1, FlxG.camera.scroll.y - 80 );
				patternLength -= 32;
			} else if ( level == 11 ) {
				Registry.block_Man.Platform2x2( platform2, FlxG.camera.scroll.y - 48 );
			} else if ( level == 12 ) { 
				Registry.block_Man.Platform3x2( platform3, FlxG.camera.scroll.y - 48 );
			} else if ( level == 13 ) { 
				Registry.block_Man.Platform2x3( platform2, FlxG.camera.scroll.y - 64 );
				patternLength -= 16;
			} else if ( level == 14 ) {
				GenerateTurret( 2 );
			}
		}
		public function GenerateTurret(level:int = 0):void {
			var tx:int = 0;
			var direction:int = Math.round( Math.random() );
			if ( direction == 1 ) {
				tx = 143;
			}
			if ( level == 0 ) {
				Registry.sentuary_Man.SpawnOne( tx, FlxG.camera.scroll.y - 64, false );
			} else if ( level == 1 ) {
				Registry.sentuary_Man.SpawnOne( tx, FlxG.camera.scroll.y - 64, false );
				Registry.sentuary_Man.SpawnOne( tx, FlxG.camera.scroll.y - 80, false );
				patternLength -= 32;
			} else if ( level == 2 ) {
				Registry.sentuary_Man.SpawnOne( tx, FlxG.camera.scroll.y - 64, true );
				Registry.sentuary_Man.SpawnOne( tx, FlxG.camera.scroll.y - 80, true );
				Registry.sentuary_Man.SpawnOne( tx, FlxG.camera.scroll.y - 96, true );
				patternLength -= 48;
			}
		}
		public function GenerateWalls(level:int = 0):void {
			var b:FlxTileblock;
			
			if ( level == 1 ) {
				b = new FlxTileblock( 48, 208, 64, 20 );
				b.loadTiles( ground_PNG, 16, 20 );
				_world.add(b);
				
				if ( Registry.record >= 100 && Registry.knowsWallJump ) {
					var temp2:int = Math.floor( Math.random() * 3 );
					if ( temp2 == 0 ) {
						GenerateTurret( 0 );
					} else if ( temp2 == 1 ) {
						GeneratePattern( 6 );
					} else if ( temp2 == 2 ) {
						GeneratePattern( 9 );
					}
				} else if ( Registry.record >= 50 && Registry.knowsWallJump ) {
					var temp1:int = Math.round( Math.random() );
					if ( temp1 == 0 ) {
						GenerateTurret( 0 );
					} else if ( temp1 == 1 ) {
						GeneratePattern( 6 );
					}
				} else if ( Registry.record >= 10 && Registry.knowsWallJump ) {
					GenerateTurret( 0 );
				}
				
				b = Registry.wall_Man.SpawnWall1();
				b.reset( 0, 0 );
				_world.add(b);
				
				b = Registry.wall_Man.SpawnWall2();
				b.reset( 144, 0 );
				_world.add(b);
				
				Registry.bg_Man.spawnBG( 15, 0 );
			}
			b = Registry.wall_Man.SpawnWall1();
			b.reset( 0, screenLength );
			_world.add(b);
			
			b = Registry.wall_Man.SpawnWall2();
			b.reset( 144, screenLength );
			_world.add(b);
			
			Registry.bg_Man.spawnBG( 15, screenLength );
		}
		public function KillFX( l:Lava, p:FlxParticle ):void {
			p.exists = false;
			var random:int = Math.random();
			if ( random == 0 ) {
				if ( Registry.playSFX ) {
					FlxG.play( destroy1_MP3, 0.03, false, false );
				}
			} else if ( random == 1 ) {
				if ( Registry.playSFX ) {
					FlxG.play( destroy2_MP3, 0.03, false, false );
				}
			}
		}
		public function KillBlock( l:Lava, b:FlxSprite ):void {
			b.exists = false;
			var random:int = Math.random();
			if ( random == 0 ) {
				if ( Registry.playSFX ) {
					FlxG.play( destroy1_MP3, 0.05, false, false );
				}
			} else if ( random == 1 ) {
				if ( Registry.playSFX ) {
					FlxG.play( destroy2_MP3, 0.05, false, false );
				}
			}
		}
		public function GameOver():void {
			BlackStart();
			yearText.visible = false;
			if ( Registry.gameOver.menuState == 1 || Registry.gameOver.menuState == 2 ) {
				Registry.options.show = true; Registry.options.fullscreen.visible = false;
				Registry.options.muteMusic.visible = false; Registry.options.muteSFX.visible = false;
			}
			if ( FlxG.keys.justPressed("SPACE") || FlxG.keys.justPressed("R") || FlxG.keys.justPressed("ENTER") ) {
				if ( Registry.gameOver.menuState == 0 ) {
					if ( !Registry.colors.canSelect ) {
						if ( Registry.playSFX ) {
							FlxG.play( AssetsRegistry.click_MP3, 1, false, false );
						}
						Registry.colorValue = 0;
					} else {
						if ( !Registry.knowsWallJump ) {
							FlxG.switchState( new TutorialState() );
						} else {
							FadeOut();
						}
					}
				}
			}
			if ( FlxG.keys.justPressed("C") ) {
				if ( Registry.gameOver.menuState == 2 || Registry.gameOver.menuState == 1 ) {
					Registry.gameOver.ClearSave();
				}
			}
		}
		public function HitHazard( b:FlxSprite, p:Player ):void {
			if ( b is Block ) {
				Registry.spike.SpawnOne( b.x, b.y );
			} else if ( b is Bullet ) {
				Registry.hitByBullet = true;
				if ( Registry.player.usingRainbow ) {
					Registry.player.trail.sprite = Registry.lava;
				}
			} else if ( Registry.player.usingRainbow ) {
				if ( b is Mover || b is LoopSpikeManager || b is Lava ) {
					Registry.player.trail.sprite = Registry.lava;
				}
			}
			if ( Registry.playSFX ) {
				FlxG.play( playerHitHazard_MP3, 1.0, false, false );
			}
			FlxG.shake( 0.03, 0.2 );
			PlayerDeath();
		}
		public function PlayerDeath():void {
			Registry.player.kill();
			FlxG.camera.follow( null );
			
			Registry.fx.sweat.visible = false;
			Registry.fx.sweat.on = false;
			Registry.fx.sweat.y += 300;
			Registry.fx.FadeSound();
			Registry.fx.EmitBlood( Registry.light.x + 155, Registry.light.y + 150 );
			Registry.lava.rumble.fadeOut( 1 );
			if ( Registry.player.usingSick ) {
				FlxG.flash( 0xffFFffFF, 1.5 );
				FlxG.shake( 0.04, 0.8, PostSick );
				if ( Registry.playSFX ) {
					FlxG.play( AssetsRegistry.intro_MP3, 0.5, false, false );
				}
				Registry.fx.bigRock.start( false, 1, 0.05, 10 );
				Registry.fx.rock.start( false, 1, 0.05, 15 );
				Registry.fx.gibs.on = false;
			} else {
				Registry.fx.rock.on = false;
				Registry.fx.bigRock.on = false;
			}
			
			if ( worldLength >= Registry.record ) {
				Registry.record = worldLength;
				Registry.SaveRecord = Registry.record;
				API.postScore( "Records", Registry.record );
			}
			Registry.SaveDeaths = Registry.timesPlayed;
			Registry.SaveJumps();
			
			GameOver();
			Registry.player.kill();
		}
		public function PreShake():void {
			FlxG.shake( 0.01, 5, Shake );
			Registry.fx.EmitRock1();
		}
		public function Shake():void {
			FlxG.shake( 0.025, 2, PostShake );
			Registry.fx.EmitRock2();
		}
		public function PostShake():void {
			Registry.fx.rock.on = false;
			Registry.fx.bigRock.on = false;
			Registry.SaveQuake();
		}
		public function PostSick():void {
			Registry.fx.rock.on = false;
			Registry.fx.bigRock.on = false;
		}
		public function FadeIn():void {
			FlxG.fade( 0xff000000, 0.3 );
		}
		public function FadeOut():void {
			FlxG.fade( 0xff000000, 0.3, PostFadeOut );
		}
		private function PostFadeOut():void {
			FlxG.resetState();
		}
		override public function draw():void {
			super.draw();
			Registry.darkness.fill(0xca000000);
		}
		// 
		//	Let's pretends that PlayState ends here, shall we?
		//
		public function PostBlack():void {
			if ( Registry.playMusic ) {
				FlxG.music.volume = 0.4;
			}
			Registry.options._options.loadGraphic( Options.optionsHigh_PNG, false, false, 12, 12, false );
			Registry.gameOver = new GameOverGroup();
			Registry.firstTime = false;
			Registry.medals = new Medals;
			_hud.add( Registry.gameOver );
			Registry.gameOver.ShowGameOver();
			_hud.add( Registry.medals );
		}
		
		public function BlackStart():void {
			deathTimer += FlxG.elapsed;
			if ( deathTimer >= 1.5 ) {
				Registry._black.activate25();
				deathTimer = int.MIN_VALUE;
				PostBlack();
			} else if ( deathTimer >= 1.475 ) {
				Registry._black.activate24();
			} else if ( deathTimer >= 1.45 ) {
				Registry._black.activate23();
			} else if ( deathTimer >= 1.425 ) {
				Registry._black.activate22();
			} else if ( deathTimer >= 1.4 ) {
				Registry._black.activate21();
			} else if ( deathTimer >= 1.375 ) { 
				if ( Registry.playMusic ) {
					FlxG.music.volume = 0.5;
				}
				Registry._black.activate20();
			} else if ( deathTimer >= 1.350 ) {
				Registry._black.activate19();
			} else if ( deathTimer >= 1.325 ) {
				Registry._black.activate18();
			} else if ( deathTimer >= 1.3 ) {
				Registry._black.activate17();
			} else if ( deathTimer >= 1.275 ) {
				Registry._black.activate16();
			} else if ( deathTimer >= 1.250 ) {
				if ( Registry.playMusic ) {
					FlxG.music.volume = 0.6;
				}
				Registry._black.activate15();
			} else if ( deathTimer >= 1.225 ) {
				Registry._black.activate14();
			} else if ( deathTimer >= 1.2 ) {
				Registry._black.activate13();
			} else if ( deathTimer >= 1.175 ) {
				Registry._black.activate12();
			} else if ( deathTimer >= 1.150 ) {
				Registry._black.activate11();
			} else if ( deathTimer >= 1.125 ) {
				if ( Registry.playMusic ) {
					FlxG.music.volume = 0.7;
				}
				Registry._black.activate10();
			} else if ( deathTimer >= 1.1 ) {
				Registry._black.activate9();
			} else if ( deathTimer >= 1.075 ) {
				Registry._black.activate8();
			} else if ( deathTimer >= 1.050 ) {
				Registry._black.activate7();
			} else if ( deathTimer >= 1.025 ) {
				Registry._black.activate6();
			} else if ( deathTimer >= 1 ) {
				if ( Registry.playMusic ) {
					FlxG.music.volume = 0.8;
				}
				Registry._black.activate5();
			} else if ( deathTimer >= 0.975 ) {
				Registry._black.activate4();
			} else if ( deathTimer >= 0.95 ) { 
				Registry._black.activate3();
			} else if ( deathTimer >= 0.925 ) {
				Registry._black.activate2();
			} else if ( deathTimer >= 0.9 ) {
				if ( Registry.playMusic ) {
					FlxG.music.volume = 0.9;
				}
				Registry._black.activate1();
			}
		}
	}
}