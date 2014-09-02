package com.at2.dirimote.examples.userdata
{
	import com.at2.dirimote.receiver.*;
	import com.at2.dirimote.common.*;
	
	import flash.display.Bitmap;	
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.events.Event;

	[SWF(backgroundColor="0xaaaaaa")]
	public class Main extends Sprite 
	{
		//register an App on http://dirimote.com/member and get an APP_ID for your application
		private const APPID:String					= "MY_DEV_APP_ID"; //use this id for development only!
		
		private var dirimote:Dirimote 				= null;
		private var controller:DirimoteController 	= null;
		private var avatar:Avatar					= null;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);

			dirimote			= new Dirimote(APPID);
			var options:Object	= { username:true, avatar:true };
			controller			= dirimote.createController(new DirimoteInterfaceLayout("default"), options);
			controller.addEventListener(DirimoteController.EVENT_READY, onControllerReady);
			controller.addEventListener(DirimoteController.EVENT_DISCONNECTED, onControllerDisconnected);
			
			stage.addChild(controller.qrcode);
		}
		
		private function onControllerReady(e:Event):void {

			if (controller.avatar != null) {
				
				avatar				= new Avatar(controller.avatar, controller.username);
				var qrcode:Sprite	= controller.qrcode;
				
				avatar.height	= qrcode.height;
				avatar.width	= avatar.width * avatar.scaleY;
				avatar.x		= qrcode.x+(qrcode.width-avatar.width)*0.5;
				avatar.y		= qrcode.y;
				addChild(avatar);
			}
		}
		
		private function onControllerDisconnected(e:Event):void {
			
			removeChild(avatar);
			avatar = null;
		}
	}
}