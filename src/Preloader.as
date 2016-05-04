package  
{
    import com.newgrounds.*;
    import com.newgrounds.components.*;
    import flash.display.MovieClip;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Mantis
	 */
    public class Preloader extends MovieClip
    {
        public function Preloader() 
        {
            var apiConnector:APIConnector = new APIConnector();
            apiConnector.className = "Main";
            apiConnector.apiId = "?????";
            apiConnector.encryptionKey = "???????????????";
			apiConnector.redirectOnHostBlocked = true;
			API.debugMode = API.RELEASE_MODE;
            addChild(apiConnector);
			
            // center connector on screen
            if(stage)
            {
                apiConnector.x = 4.599999999999994;
                apiConnector.y = 93.17500000000001;
			} else {
                apiConnector.x = 4.599999999999994;
                apiConnector.y = 93.17500000000001;
			}
        }
    }
}