package com.at2.dirimote.examples.Accelerometer
{
	import com.at2.dirimote.receiver.*;
	import com.at2.dirimote.common.*;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Main extends Sprite 
	{
		//register an App on http://dirimote.com/member and get an APP_ID for your application
		private const APPID:String					= "MY_DEV_APP_ID"; //use this id for development only!
		
		private var dirimote:Dirimote 				= null;
		private var controller:DirimoteController 	= null;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			dirimote	= new Dirimote(APPID);
			controller	= dirimote.createController(new DirimoteInterfaceLayout("default", DirimoteInterfaceLayout.DIRIMOTE_UI_ACCEL_NO_BUTTONS));
			controller.addEventListener(DirimoteController.EVENT_INTERACTION, onControllerInteraction);
			
			stage.addChild(controller.qrcode);
		}
		
		private function onControllerInteraction(e:Object):void {

			if (e.id == DirimoteDefaultControls.DIRIMOTE_ACCELEROMETER) {
				
				trace("x: " + e.data.x + "\ny: " + e.data.y + "\nz: " + e.data.z + "\n");
			}
		}
	}
}