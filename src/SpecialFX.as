package  
{
	import adobe.utils.CustomActions;
	import org.flixel.FlxEmitter;
	import org.flixel.FlxGroup;
	import org.flixel.FlxParticle;
	import org.flixel.FlxG;
	import org.flixel.FlxSound;
	/**
	 * ...
	 * @author Mantis
	 */
	public class SpecialFX extends FlxGroup
	{
		[Embed(source = "/../assets/sfx/Debris1.mp3")] private var debris1_MP3:Class;
		[Embed(source = "/../assets/sfx/Debris2.mp3")] private var debris2_MP3:Class;
		[Embed(source = "/../assets/img/particles/Particles_Blood2.png")] private var blood_PNG:Class;
		[Embed(source = "/../assets/img/particles/Particles_Gibs.png")] private var gibs_PNG:Class;
		[Embed(source = "/../assets/img/particles/Particles_Rock.png")] private var rock_PNG:Class;
		[Embed(source = "/../assets/img/particles/Particles_Rock2.png")] private var bigRock_PNG:Class;
		[Embed(source = "/../assets/img/particles/Particles_Spark.png")] private var spark_PNG:Class;
		[Embed(source = "/../assets/img/particles/Particles_Sweat.png")] private var sweat_PNG:Class;
		public var debris:FlxSound;
		public var block:FlxEmitter;
		public var sweat:FlxEmitter;
		public var fallRock:FlxEmitter;
		public var rock:FlxEmitter;
		public var bigRock:FlxEmitter;
		public var blood:FlxEmitter;
		public var gibs:FlxEmitter;
		public var spark:FlxEmitter;
		public function SpecialFX() {
			sweat = new FlxEmitter();
			sweat.setYSpeed( -50, -60 );
			sweat.gravity = 200;
			sweat.makeParticles( sweat_PNG, 10, 1, true, 0 );
			sweat.start( false, 0.3, 0.2, 0 );
			sweat.visible = false;
			add( sweat );
			
			fallRock = new FlxEmitter();
			fallRock.setYSpeed( -150, +100 );
			fallRock.setXSpeed( +200, +300 );
			fallRock.setRotation( -720, +720 );
			fallRock.bounce = 0.5;
			fallRock.gravity = 500;
			fallRock.makeParticles( rock_PNG, 12, 16, true, 0.8 );
			add( fallRock );
			
			rock = new FlxEmitter();
			rock.setYSpeed( +200, +300 );
			rock.setXSpeed( -200, +200 );
			rock.setRotation( -720, +720 );
			rock.setSize( 118, 1 );
			rock.bounce = 1;
			rock.x = 16;
			rock.makeParticles( rock_PNG, 100, 16, true, 0.8 );
			add( rock );
			
			bigRock = new FlxEmitter();
			bigRock.setYSpeed( +200, +300 );
			bigRock.setXSpeed( -200, +200 );
			bigRock.setSize( 118, 1 );
			bigRock.bounce = 1;
			bigRock.x = 16;
			bigRock.makeParticles( bigRock_PNG, 100, 16, true, 0.8 );
			add( bigRock );
			
			blood = new FlxEmitter();
			blood.setYSpeed( -20, -200);
			blood.bounce = 1;
			blood.gravity = 350;
			blood.bounce = 0.35;
			blood.makeParticles( blood_PNG, 100, 1, true, 1 );
			add( blood );
			
			gibs = new FlxEmitter();
			gibs.setYSpeed( -20, -200);
			gibs.bounce = 1;
			gibs.gravity = 350;
			gibs.bounce = 0.35;
			gibs.makeParticles( gibs_PNG, 1, 32, true, 1 );
			add( gibs );
			
			spark = new FlxEmitter();
			spark.x = 16;
			spark.bounce = 1;
			spark.setSize( 128, 1 );
			spark.setYSpeed(-120,-170);
			spark.gravity = 350;
			spark.makeParticles( spark_PNG, 50, 1, true, 0.5 );
			spark.start( false, 0.5, 0.1, 0 );
			add( spark );
		}
		public function EmitBlood(tx:int, ty:int):void {
			blood.x = tx; blood.y = ty;
			blood.start( true, 3, 0.1, 0 );
			
			gibs.x = tx; gibs.y = ty;
			gibs.start( true, 3, 0.1, 0 );
		}
		public function EmitRock1():void {
			if ( Registry.playSFX ) {
				debris = FlxG.play( debris1_MP3, 0.3, true, false );
				debris.fadeIn(1);
			}
			bigRock.start( false, 1.5, 0.2, 25 );
			rock.start( false, 1.5, 0.3, 20 );
		}
		public function EmitRock2():void {
			FadeSound();
			if ( Registry.playSFX ) {
				FlxG.play( debris2_MP3, 0.5, false, false );
			}
			bigRock.start( false, 1.5, 0.2, 0 );
			rock.start( false, 1.5, 0.1, 0 );
		}
		public function FadeSound():void {
			if ( debris ) {
				debris.fadeOut(1);
			}
		}
		override public function update():void {
			super.update();
			
			spark.y = Registry.lava.lavaTop.y - 10;
			rock.y = FlxG.camera.scroll.y - 6;
			bigRock.y = FlxG.camera.scroll.y - 6;
			if ( !spark.exists ) {
				spark.exists = true;
			}
			sweat.x = Registry.player.x + 8;
			sweat.y = Registry.player.y;
			if ( sweat.y >= Registry.lava.y - 128 ) {
				sweat.visible = true;
			} else {
				sweat.visible = false;
			}
			for each( var p:FlxEmitter in members ) {
				if ( p.y >= FlxG.camera.scroll.y+240 ) {
					p.exists = false;
				}
			}
		}
	}
}