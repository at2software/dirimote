package com.at2.dirimote.examples.HelloDirimote
{
	import com.at2.dirimote.receiver.*;
	import com.at2.dirimote.common.*;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	import flash.display.Sprite;
	import flash.events.Event;

	public class Main extends Sprite 
	{
		//register an App on http://dirimote.com/member and get an APP_ID for your application
		private const APPID:String					= "MY_DEV_APP_ID"; //use this id for development only!
		
		private var dirimote:Dirimote 				= null;
		private var controller:DirimoteController 	= null;
		private var hello:TextField					= null;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			var format:TextFormat	= new TextFormat();
			format.align			= TextFormatAlign.CENTER;
			format.size				= 16;
			
			hello					= new TextField();
			hello.defaultTextFormat = format;
			hello.width 			= 200;
			hello.height			= 25;
			hello.x					= (stage.stageWidth - hello.width) * 0.5;
			hello.y					= (stage.stageHeight - hello.height) * 0.5;
			hello.visible			= false;
			hello.text				= 'Press A!';
			addChild(hello);
			
			dirimote	= new Dirimote(APPID);
			controller	= dirimote.createController(new DirimoteInterfaceLayout("default"), {username:true});
			controller.addEventListener(DirimoteController.EVENT_INTERACTION, onControllerInteraction);
			controller.addEventListener(DirimoteController.EVENT_CONNECTED, onControllerConnected);
			controller.addEventListener(DirimoteController.EVENT_DISCONNECTED, onControllerDisconnected);
			
			stage.addChild(controller.qrcode);
			controller.qrcode.center(stage);
		}
		
		private function onControllerConnected(e:Event):void {
			
			hello.visible= true;
		}
		private function onControllerDisconnected(e:Event):void {
			
			hello.text		= 'Press A!';
			hello.visible	= false;
		}
		
		private function onControllerInteraction(e:Object):void {

			if(e.id== DirimoteDefaultControls.DIRIMOTE_ACTION_A){
			
				var msg:String = 'Hello World!';
				
				if (controller.username.length>0) {
				
					msg = 'Hello ' + controller.username + '!';
				}
				
				hello.text = msg;
				trace(msg);
			}
		}
	}
}