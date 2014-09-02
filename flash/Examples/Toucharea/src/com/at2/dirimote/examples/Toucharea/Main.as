package com.at2.dirimote.examples.Toucharea
{
	import com.at2.dirimote.common.*;
	import com.at2.dirimote.receiver.*;
	import com.at2.utils.AT2Event;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Main extends Sprite 
	{
		//register an App on http://dirimote.com/member and get an APP_ID for your application
		private const APPID:String					= "MY_DEV_APP_ID"; //use this id for development only!
		
		private var dirimote:Dirimote				= null;
		private var controller:DirimoteController	= null;
				
		private var canvas:Sprite					= null;
		private var savedCanvas:Bitmap				= null;
		private var clean:Boolean					= true;
		private var lastPoint:Object				= null;
		private var colorIndicator:ColorIndicator	= null;
		private var currentColor:Number 			= 0x000000;
		
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);

			dirimote	= new Dirimote(APPID);
			controller	= dirimote.createController(new DirimoteInterfaceLayout("default", DirimoteInterfaceLayout.DIRIMOTE_UI_CUSTOM_INTERFACE, "interface.xml"));
			controller.addEventListener(DirimoteController.EVENT_CONNECTED, onControllerConnected);
			controller.addEventListener(DirimoteController.EVENT_DISCONNECTED, onControllerDisconnected);
			controller.addEventListener(DirimoteController.EVENT_INTERACTION, onControllerInteraction);

			
			
			savedCanvas= new Bitmap();
			addChild(savedCanvas);
			
			canvas= new Sprite();
			addChild(canvas);
			clearCanvas();
			
			var qrcode:Sprite 	= controller.qrcode;
			qrcode.x			= 30;
			qrcode.y			= stage.stageHeight - 165;
			stage.addChild(qrcode);
			
			colorIndicator 			= new ColorIndicator();
			colorIndicator.x		= 30;
			colorIndicator.y 		= qrcode.y-10;
			colorIndicator.visible	= false;
			addChild(colorIndicator);
			
		}
		
		private function clearCanvas():void {
			
			canvas.graphics.clear();
			canvas.graphics.beginFill(0x0,0.0);
			canvas.graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
			canvas.graphics.endFill();
			
			if (clean) {
				
				savedCanvas.bitmapData = new BitmapData(canvas.width, canvas.height, true, 0xffffff);
			}
		}
		
		private function drawOnCanvas(point:Object):void {
		
			if (lastPoint != null) {
			
				var w:Number		= canvas.width;
				var h:Number		= canvas.height;
				var startX:Number	= lastPoint.x*w;
				var startY:Number	= lastPoint.y*h;
				var endX:Number		= point.x*w;
				var endY:Number		= point.y * h;
				
				canvas.graphics.beginFill(currentColor);
				canvas.graphics.lineStyle(8, currentColor);
				canvas.graphics.moveTo(startX, startY);
				canvas.graphics.lineTo(endX, endY);
				canvas.graphics.endFill();
			}
			
			lastPoint = point;
			
			if (point.x > 1 || point.y > 1) {
			
				trace("x:"+point.x +" y:"+point.y);
			}
			
			clean = false;
		}
		
		private function onControllerConnected(e:Event):void {
			
			colorIndicator.visible = true;
		}
		private function onControllerDisconnected(e:Event):void {
			
			colorIndicator.visible = false;
		}
		
		private function onControllerInteraction(e:AT2Event):void {

			if (e.id == "toucharea") {
			
				if (e.etype == DirimoteEventTypes.TOUCH_DOWN) {
					
					lastPoint = e.data;
				}
				else {
					
					drawOnCanvas(e.data);
				}
			}
			else if (e.etype == DirimoteEventTypes.TOUCH) {
				
				switch(e.id) {
					
					case "color_purple":
						currentColor = 0xb539f6;
						break;
					case "color_blue":
						currentColor = 0x2aa2f0;
						break;
					case "color_red":
						currentColor = 0xfe3e3e;
						break;
					case "color_orange":
						currentColor = 0xdb810a;
						break;
					case "color_yellow":
						currentColor = 0xebe12f;
						break;
					case "color_green":
						currentColor = 0x20cc20;
						break;
					case "color_black":
						currentColor = 0x3a3837;
						break;
					case "color_grey":
						currentColor = 0x989998;
						break;
					case "color_white":
						currentColor = 0xe2e3e3;
						break;
					case "delete":
						clearCanvas();
						clean = true;
						break;
					case "save":
						var bd:BitmapData = new BitmapData(canvas.width, canvas.height, true, 0x0);
						bd.draw(new Bitmap(savedCanvas.bitmapData));
						bd.draw(canvas);
						savedCanvas.bitmapData = bd;
						clearCanvas();
						break;
					default:
						break;
				}
				
				if (e.id != "delete" && e.id != "save") {
					
					colorIndicator.setColor(e.id);
				}
			}
		}
	}
}