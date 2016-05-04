package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxGroup;
	import org.flixel.FlxRect;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Mantis
	 */
	public class Splatter extends FlxGroup
	{
		[Embed(source = "../assets/img/particles/Splat2.png")] private var splatter_PNG:Class;
		public var splat:FlxSprite;
		private var trail:FlxSprite;
		private var _high:Number = 1;
		public var canTrail:Boolean;
		public function Splatter() {
			exists = false;
			
			splat = new FlxSprite();
			splat.loadGraphic( splatter_PNG, true, true, 3, 18, false );
			splat.addAnimation( "norm", [0, 1, 2, 3, 4], 40, false );
			trail = new FlxSprite();
			trail.makeGraphic( 2, 1, 0xFF9b0000, false );
			
			add( trail );
			add( splat );
		}
		override public function update():void {
			super.update();
			if ( Registry.player.onLeftWall || Registry.player.onRightWall ) {
				if ( canTrail ) {
					if ( splat.y < Registry.player.y ) { 
						_high = Registry.player.y + 8 - trail.y;
						trail.makeGraphic( 2, _high, 0xFF9b0000, false );
					} else if ( Registry.player.velocity.y < 0 ) { //trailUP
						if ( splat.x == 143 || splat.x == 14 ) {
							trail.y -= 1.4;
							_high += 1.4;
							trail.makeGraphic( 2, _high, 0xFF9b0000, false );
						}
					}
				}
			} else {
				canTrail = false;
			}
		}
		public function SpawnOne(X:int, Y:int, Facing:Boolean):void {
			exists = true;
			canTrail = true;
			_high = 1;
			splat.reset( X, Y - 5 );
			splat.play( "norm" );
			trail.reset( X + 1, Y + 1 );
			trail.makeGraphic( 2, 1, 0xFF9b0000, false );
			
			if ( !Facing ) {
				splat.facing = FlxObject.RIGHT;
				Registry.player.splatBlood.start( true, 0.25, 0.1, 6 );
				Registry.player.splatBlood.x = X;
				Registry.player.splatBlood.y = Y + 5;
				Registry.player.splatBlood.setXSpeed( 50, 100 );
			} else {
				splat.facing = FlxObject.LEFT;
				trail.reset( X, Y + 1 );
				Registry.player.splatBlood.start( true, 0.25, 0.1, 6 );
				Registry.player.splatBlood.x = X;
				Registry.player.splatBlood.y = Y + 5;
				Registry.player.splatBlood.setXSpeed( -50, -100 );
			}
		}
	}
}