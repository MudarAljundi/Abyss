package 
{
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import org.flixel.FlxG;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.display.Stage;
	import flash.display.StageQuality;
	import flash.display.StageDisplayState;
	import flash.display.StageScaleMode;
	import com.newgrounds.API;
	/**
	 * ...
	 * @author Mantis
	 */
	[SWF(width="320", height="480", backgroundColor="#000000")]
	[Frame(factoryClass = "Preloader")]
	public class Main extends Sprite 
	{
		private var thegame:TheGame;
		public function Main():void 
		{
			trace("I sincerely hope no errors have been found")
			if (stage) init();
			else {
				addEventListener(Event.ADDED_TO_STAGE, init);
			}
		}
		private function init(e:Event = null):void 
		{
			// The Game
			thegame = new TheGame;
			addChild(thegame);
			removeEventListener(Event.ADDED_TO_STAGE, init);
		}
	}
}