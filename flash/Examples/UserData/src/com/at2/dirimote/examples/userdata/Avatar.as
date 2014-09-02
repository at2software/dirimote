package com.at2.dirimote.examples.userdata 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;

	public class Avatar extends Sprite
	{
		
		public function Avatar(bmp:Bitmap, name:String) 
		{			
			var format:TextFormat	= new TextFormat();
			format.size				=  10;
			format.align 			= TextFormatAlign.CENTER;
			format.font				= "Helvetica";
			
			var lbl:TextField 		= new TextField();
			lbl.defaultTextFormat	= format;
			lbl.y					= bmp.height;
			lbl.width				= bmp.width;
			lbl.height				= 16;
			lbl.text				= name;
			
			addChild(bmp);
			addChild(lbl);
		}
	}
}