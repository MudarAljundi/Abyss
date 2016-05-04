package  
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Mantis
	 */
	public class Lines extends FlxGroup {
		[Embed(source = "../assets/img/Lines/Record.png")] private var record_PNG:Class;
		[Embed(source = "../assets/img/Lines/Line50.png")] private var line50_PNG:Class;
		[Embed(source = "../assets/img/Lines/Line100.png")] private var line100_PNG:Class;
		[Embed(source = "../assets/img/Lines/Line300.png")] private var line300_PNG:Class;
		[Embed(source = "../assets/img/Lines/Line500.png")] private var line500_PNG:Class;
		
		public var _record:FlxSprite;
		public var _line50:FlxSprite;
		public var _line100:FlxSprite;
		public var _line300:FlxSprite;
		public var _line500:FlxSprite;
		public function Lines() {
			_record = new FlxSprite( 0, 320, record_PNG );
			_line50 = new FlxSprite( 0, +83 - 50 * 32, line50_PNG );
			_line100 = new FlxSprite( 0, +83 - 100 * 32, line100_PNG );
			_line300 = new FlxSprite( 0, +83 - 300 * 32, line300_PNG );
			_line500 = new FlxSprite( 0, +83 - 500 * 32, line500_PNG );
			
			if ( Registry.record >= 5 ) {
				_record.reset( 0, +64 -Registry.record * 32 );
			}
			
			add( _record );
			add( _line50 );
			add( _line100 );
			add( _line300 );
			add( _line500 );
		}
	}
}