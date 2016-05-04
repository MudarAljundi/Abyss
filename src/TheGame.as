package  
{
	import com.newgrounds.API;
	import org.flixel.FlxGame;
	/**
	 * ...
	 * @author Mantis
	 */
	public class TheGame extends FlxGame
	{
		public function TheGame() 
		{
			super( 160, 240, IntroState, 2, 60, 60, true );
			API.logCustomEvent( "startedGame" );
			//useSoundHotKeys = false;
			//forceDebugger = true;
			//IntroState
			//FlxG.mobile = true;
		}
	}
}