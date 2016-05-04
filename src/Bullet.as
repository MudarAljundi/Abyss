package  
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author Mantis
	 */
	public class Bullet extends FlxSprite
	{
		[Embed(source = "/../assets/img/hazards/Bullet1.png")] private var bullet_PNG:Class;
		private var canPlay:Boolean = true;
		private var arrow:Boolean = false;
		public function Bullet() 
		{
			super(x + 99999, y + 99999);//32
			loadGraphic( bullet_PNG, false, true, 24, 26 );
			addAnimation( "normal", [0], 0, false );
			addAnimation( "arrow", [1], 0, false );
			height = 3; width = 7;
			offset.y = 10; offset.x = 10;
			facing = RIGHT;
			immovable = true;
			maxVelocity.x = 150;
			canPlay = true; Registry.hitByBullet = false;
			exists = false;
		}
		public function SpawnOne(tx:int, ty:int, _Arrow:Boolean):void {
			x = tx; y = ty;
			play("normal");
			exists = true;
			arrow = false;
			canPlay = true; Registry.hitByBullet = false;
			maxVelocity.x = 150;
			if ( Registry.player.x >= x) {
				if( _Arrow ) {
					play("arrow");
					arrow = true;
					maxVelocity.x = 130;
				}
				facing = RIGHT;
				velocity.x = maxVelocity.x;
			} else if ( Registry.player.x <= x) {
				if( _Arrow ) {
					play("arrow");
					arrow = true;
					maxVelocity.x = 130;
				}
				facing = LEFT;
				velocity.x = -maxVelocity.x;
			}
		}
		override public function update():void {
			super.update();
			if ( Registry.playSFX && canPlay ) {
				if ( facing == RIGHT && x >= 132 || facing == LEFT && x <= 14 ) {
					FlxG.play( AssetsRegistry.bulletHitWall_MP3, 0.8, false, false );
					canPlay = false;
				}
			}
			
			if ( facing == RIGHT && x >= 133 ) {
				if ( !Registry.hitByBullet ) {
					Registry.SaveBullet();
				}
				if ( arrow ) {
					Registry.arrow_Man.SpawnOne( x, y, true );
				}
				Registry.fx.fallRock.start( true, 1, 0.1, 4 );
				Registry.fx.fallRock.y = y;
				Registry.fx.fallRock.x = 143;
				Registry.fx.fallRock.setXSpeed( -20, -200 );
				velocity.x = 0;
				exists = false;
			} else if ( facing == LEFT && x <= 13 ) {
				if ( !Registry.hitByBullet ) {
					Registry.SaveBullet();
				}
				if ( arrow ) {
					Registry.arrow_Man.SpawnOne( x, y, false );
				}
				Registry.fx.fallRock.start( true, 1, 0.1, 4 );
				Registry.fx.fallRock.y = y;
				Registry.fx.fallRock.x = 17;
				Registry.fx.fallRock.setXSpeed( +20, +200 );
				velocity.x = 0;
				exists = false;
			}
		}
	}
}